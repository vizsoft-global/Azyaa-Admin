# Virtual try-on — provider and model registry

Status: approved design, ready for an implementation plan
Date: 2026-09-29
Repos touched: `azyaa-admin` (cloud functions, Firestore rules), `azya-admin-2026` (admin panel), `azyaa-app` (customer app)
Firebase project: `azyaa-0uiv4k`

## 1. Problem

Virtual try-on works today, but nothing about how it generates an image is under our control.

The customer app posts to a private Flask service on Render (`newplot.onrender.com`, reached through `proxy.vizsoft.in`). That service is not in any of our repos and nothing in the request names a model, so we cannot say which model answers, what it costs, or what it will do next quarter. The model string and even the wire format are not ours to set.

Four specific defects fall out of that:

1. **No model choice.** `VirtualTryOnGroup.mainCall` in `azyaa-app/lib/backend/api_requests/api_calls.dart` sends `person_image`, `outfit_image`, `prompt`, `resolution`, `num_images` and nothing else identifying a model. Swapping models means changing someone else's server.
2. **The prompt is hardcoded in the app.** The identical string appears twice — `api_calls.dart:982` and `v_t_o_final_widget.dart:910`. Changing a word requires an app release.
3. **Credits are double-counted in two ledgers that never reconcile.** The response carries `credits_used` from newplot, and the app separately decrements `users.user_vto.user_vto_credit_points`.
4. **`tryon_requests` has no rule in `azyaa-admin/firebase/firestore.rules`.** There is no catch-all rule either, so the collection is deny-all in the repo copy of the rules, yet the app writes to it on every try-on and the result screen StreamBuilders on it. That is a live bug to confirm on device as part of this work.

The admin panel has no way to set an API key or choose a model. `azyaa-admin/lib/backend/gemini/gemini.dart` holds a hardcoded Gemini key for text and vision only, and nothing in it is used by try-on.

## 2. Goals

- Generate try-on images through Google Gemini image models (the Nano Banana family) and OpenAI image models, with keys that never leave the server.
- Let an admin add a provider and a model row without a deploy, including editing the API model string and the request style.
- Move the prompt, resolution and image count out of the app and into an admin-editable setting.
- Make every generation an auditable, retryable request row with a real error.
- Keep exactly one credit ledger, charged once per successful generation.
- Preserve the app's existing pending-then-done user experience.

## 3. Non-goals

- No Secret Manager integration. Keys live in Firestore behind a deny-all rule on the client.
- No per-user rate limiting or spend cap beyond one in-flight request per user.
- No change to `user_vto_plans` or the credit-pack purchase flow.
- No backfill or reprocessing of existing `tryon_requests` rows.
- No 2nd-gen `firebase-functions` migration.
- No change to the `users/{uid}/**` storage read policy.

## 4. Architecture

    app ──callable──▶ tryonCreateRequest
                          │  transaction: settings + model + balance
                          │  reserve credits, write status=pending
                          ▼
                  tryon_requests/{id} ──onWrite (pending)──▶ runTryonJob
                                                               │ atomic claim → processing
                                                               │ adapter → provider
                                                               │ upload → Storage
                                                               │ commit completed | failed + refund
                                                               ▼
    app ◀──streams the document──────────────────────────── tryon_requests/{id}

    admin panel ──callable(tryonAdmin)──▶ providers / models / settings / requests
                                          test_model reuses runTryonJob

Two properties this shape buys us. The client never holds a provider key, and it never holds an open connection for the length of a generation — the job is detached from the request that started it, so a user closing the app mid-run does not lose a paid generation.

## 5. Data model

Four collections. `user_vto_plans` is unchanged.

### 5.1 `tryon_providers/{provider_id}`

One document per vendor account. This is where keys live.

| field | type | notes |
|---|---|---|
| `provider_id` | string | slug, e.g. `google`, `openai` |
| `label` | string | e.g. `Google AI Studio` |
| `kind` | string | `gemini` or `openai` — selects the adapter module |
| `api_key` | string | never returned to any client |
| `base_url` | string | optional override; empty means the adapter default, so a proxy or region change needs no deploy |
| `enabled` | boolean | |
| `notes` | string | |
| `created_at`, `updated_at` | timestamp | |

### 5.2 `tryon_models/{model_id}`

One document per selectable model. This is the "add more models" affordance.

| field | type | notes |
|---|---|---|
| `model_id` | string | slug, e.g. `nano-banana-2` |
| `label` | string | e.g. `Nano Banana 2 (3.1 Flash Image)` |
| `provider_id` | string | → `tryon_providers` |
| `model` | string | the API model string, e.g. `gemini-3.1-flash-image` |
| `api_style` | string | `interactions`, `generate_content`, `images_edit`, `images_generate` |
| `capabilities` | map | `{ image_edit, text_to_image, max_input_images }` |
| `resolutions` | array | provider-native values |
| `default_resolution` | string | |
| `num_images` | number | |
| `credit_cost` | number | |
| `timeout_seconds` | number | default `120` |
| `prompt_override` | string | optional; when set it wins over `tryon_settings.prompt` |
| `extra` | map | free-form provider knobs: `aspect_ratio`, `quality`, `background` |
| `enabled` | boolean | |
| `is_default` | boolean | used when a request carries no `model_id` |
| `sort_order` | number | |
| `created_at`, `updated_at` | timestamp | |

`api_style` is seeded from the provider's `kind` but stays editable, because Google moved image generation off `generateContent`. That single field is what keeps a wire-format change from becoming a deploy:

- `interactions` → `POST /v1beta/interactions`, header `x-goog-api-key`, body `{model, input:[{type:"image",mime_type,data}, {type:"text",text}], response_format:{type:"image",mime_type,aspect_ratio,image_size}}`. Response: `steps[]` where `type == "model_output"` → `content[]` blocks. `image_size` accepts `512px`, `1K`, `2K`, `4K`, and the `K` must be uppercase.
- `generate_content` → `POST /v1beta/models/{model}:generateContent` with `contents[].parts[]` using `inline_data` and `generationConfig.responseModalities:["IMAGE"]`. Needed by `gemini-2.5-flash-image`, the legacy Nano Banana.
- `images_edit` → `POST /v1/images/edits`, multipart, `model`, `prompt`, `n`, `size`, `quality`, repeated `image[]`. This is the two-image try-on case. Response `data[0].b64_json`.
- `images_generate` → `POST /v1/images/generations`, JSON. Text-to-image only.

Seed rows: `gemini-3.1-flash-image` on `interactions`, `gemini-2.5-flash-image` on `generate_content`, `gpt-image-1.5` on `images_edit`.

`is_default` is not enforced as unique. When more than one enabled row carries it, `pickModel` in §6.2 takes the lowest `sort_order`, which keeps resolution deterministic instead of depending on document order.

### 5.3 `tryon_settings/current`

Single document, global configuration, not readable by any client.

| field | type | default |
|---|---|---|
| `enabled` | boolean | `true` — master kill switch |
| `default_model_id` | string | |
| `fallback_model_id` | string | `""` — used only when the primary attempt fails |
| `prompt` | string | the string currently hardcoded at `api_calls.dart:982` |
| `resolution` | string | |
| `num_images` | number | `1` |
| `credit_cost_fallback` | number | `1` |
| `max_attempts` | number | `2` |
| `require_person_and_outfit` | boolean | `true` |
| `updated_at`, `updated_by` | timestamp, string | |

### 5.4 `tryon_settings/public`

A three-field projection so the app can render an honest credit label without seeing prompts or model configuration: `{ enabled, credit_cost_hint, updated_at }`. Readable by any authenticated user. `credit_cost_hint` is the default model's `credit_cost`, falling back to `credit_cost_fallback` when no default resolves.

### 5.5 `tryon_requests/{auto_id}`

Existing collection, extended. Fields kept as they are: `id`, `created_at`, `user_id`, `status`, `product_ref`, `person_image`, `outfit_image`, `result`.

Fields added: `model_id`, `provider_id`, `model`, `api_style`, `prompt`, `resolution`, `num_images`, `attempt`, `credits_charged`, `credits_refunded`, `error`, `error_code`, `started_at`, `finished_at`, `duration_ms`, `mime_type`, `result_path`, `usage` (provider token or cost block), `raw_response` (trimmed to about 2KB), `source` (see §9), `is_test`.

Status vocabulary: `pending` → `processing` → `completed` or `failed`.

`pending` is deliberately reused as the queued state rather than inventing a new word, so any app build already installed still resolves against it.

### 5.6 Rules

Added to `azyaa-admin/firebase/firestore.rules`. New collections are deny-all today, so this is purely additive.

    match /tryon_providers/{doc}       { allow read, write: if false; }
    match /tryon_models/{doc}          { allow read, write: if false; }
    match /tryon_settings/current      { allow read, write: if false; }
    match /tryon_settings/public       { allow read: if request.auth != null;
                                         allow write: if false; }
    match /tryon_requests/{doc} {
      allow read:  if request.auth != null
                   && resource.data.user_id == request.auth.uid;
      allow write: if request.auth != null;   // phase 1 only, see §9
    }

Providers, models and settings are reachable only through the admin callable, which is why a key cannot reach a browser. The `tryon_requests` write stays open to authenticated users during phase 1 so installed app builds keep working; it tightens to `if false` in phase 3.

### 5.7 Indexes

Added to `azyaa-admin/firebase/firestore.indexes.json`:

- `tryon_requests`: `user_id` ASC, `created_at` DESC — app history list
- `tryon_requests`: `status` ASC, `created_at` ASC — admin queue and the stuck-job sweeper
- `tryon_requests`: `user_id` ASC, `status` ASC — the one-in-flight guard

### 5.8 Storage

Results are written to `users/{uid}/vto/{request_id}.png`, which works with the current `storage.rules` (`users/{uid}/**` is world-readable, owner-write) and is bypassed by the admin SDK anyway. Known caveat: results are therefore as publicly readable by URL as existing user uploads. That is not changed by this work.

## 6. Cloud functions

Six new files in `azyaa-admin/firebase/custom_cloud_functions/` — four modules and two test files — following the split this codebase already uses: `*_functions.js` for wiring, `*_ops.js` for pure logic, `*_ops.test.js` for plain-node tests, exactly as `store_valley_delivery_jobs_functions.js` and `store_valley_delivery_jobs_ops.js` do.

No new npm dependencies: `firebase-admin ^11` and `firebase-functions ^4` are installed, and Node 22 supplies global `fetch`, `FormData`, `Blob` and `AbortController`.

### 6.1 `tryon_providers.js` — the adapter registry

Pure. No admin SDK. `fetch` is injected so tests never touch the network.

`generate(input, deps)` dispatches on `api_style` across all four styles described in §5.2:

- Gemini `interactions`: builds `{model, input:[...images, text], response_format}`, and parses `steps[]` filtered to `type === "model_output"`, then `content[]` blocks of `type === "image"` → `{ base64: block.data, mimeType: block.mime_type }`.
- Gemini `generate_content`: builds `contents[].parts[]` with `inline_data`, and parses `candidates[0].content.parts[].inlineData.data`.
- OpenAI `images_edit`: builds `FormData` with `model`, `prompt`, `n`, `size`, `quality`, and one `image[]` entry per input image carrying the right MIME type.
- OpenAI `images_generate`: JSON body `{model, prompt, n, size, quality}`.

Returns `{ images: [{ base64, mimeType }], usage, raw }`.

Also exported:

- `defaultBaseUrl(kind)` — `https://generativelanguage.googleapis.com` and `https://api.openai.com`
- `defaultApiStyle(kind)` — `interactions` and `images_edit`
- `seedModelRows()` — the three starter rows, so the panel's seed action and the tests share one definition
- `describeError(status, body)` — normalises failures into `invalid_key` (401/403), `rate_limited` (429), `blocked` (a safety refusal in the body), `provider_error` (5xx), `timeout` (abort). It also extracts any text blocks from the response, so a model that answers with prose instead of an image produces a readable message rather than "no image returned".

### 6.2 `tryon_generate_ops.js` — pure job logic

No admin SDK. Every function here is directly unit-testable.

- `STATUS` — the four state constants
- `pickModel({ settings, models, modelId })` — explicit id, then the `is_default` row with the lowest `sort_order`, then the enabled row with the lowest `sort_order`. Throws typed errors: `no_model`, `model_disabled`, `provider_disabled`, `provider_missing`.
- `resolveResolution(model, requested)` — returns `requested` only when it appears in the model's own `resolutions`, otherwise the model's `default_resolution`. This is what makes one global resolution setting safe across a Gemini `1K`/`4K` scale and an OpenAI `1024x1536` scale.
- `buildPrompt(settings, model)` — `model.prompt_override` wins over `settings.prompt`
- `buildAdapterInput({ request, model, provider, settings })`
- `validateCreateInput(data)`
- `creditsFor(model, settings)`
- `shouldRetry(request, settings)` — true when `attempt < max_attempts` and `error_code` is one of `timeout`, `rate_limited`, `provider_error`
- `storagePath(uid, requestId, mimeType)`
- `summarizeRaw(body)` — caps `raw_response` near 2KB, because a provider error dump can otherwise push a document toward the 1MB limit
- `maskKey(key)` — `"sk-…4f2a"` for the admin table

### 6.3 `tryon_generate_functions.js` — the customer path

- `tryonCreateRequest` (callable). Requires auth, validates input, then runs one transaction that reads `tryon_settings/current`, picks the model, and reads the user document. Inside the transaction it enforces three things: `settings.enabled`, that the user has no existing `pending` or `processing` request (the one-in-flight guard), and that the balance covers the cost. It deducts from `users/{uid}.user_vto.user_vto_credit_points` — the single ledger this design settles on — and writes the request with `status: "pending"` and `source: "function"`. Returns `{ request_id, status, credits_charged, credit_balance }`.

  The same `user_vto.user_vto_credit_points` field is the one the app already decrements today, so no balance data has to be migrated. What goes away is the second ledger — newplot's own `credits_used` counter — because newplot is removed from the path entirely.

  The transaction is what makes the guard race-free — two taps 40ms apart cannot both pass.

- `onTryonRequestWritten` — `firestore.document("tryon_requests/{id}").onWrite`, firing only on a transition into `pending` (`change.before.data().status !== "pending" && change.after.data().status === "pending"`). `onWrite` rather than `onCreate` is deliberate: a retry is just the status flipping back, so it reuses this same trigger instead of needing a second code path. It ignores rows whose `source` is not `"function"` — see §9.

- `tryonRetryRequest` (callable). Clears the error, bumps `attempt`, sets status back to `pending`. Serves both the app's "try again" and the admin Retry button.

- `runTryonJob({ requestId })` — the worker, exported so the admin test path reuses it:

  1. Atomic claim in a transaction: bail unless status is `pending`, then set `processing` and `started_at`.
  2. Load settings, model and provider.
  3. Fetch person and outfit images to base64. Both a Storage path and a plain URL must be accepted, because the app currently sends URLs.
  4. Call the adapter under an `AbortController` bounded by the model's `timeout_seconds`.
  5. Upload the result and obtain a download URL.
  6. Success → commit `completed` with `result`, `result_path`, `mime_type`, `duration_ms`, `usage` and the trimmed `raw_response`.
  7. Failure → retry once against `fallback_model_id` when `shouldRetry` allows; otherwise refund `credits_charged` in a transaction, set `credits_refunded: true`, and record `error` plus `error_code` with status `failed`.

  Reserving credits at create and refunding on failure is the reason the create path deducts rather than charging on success: it stops a user queuing ten jobs on one credit, and it makes every debit traceable to exactly one request row.

- `sweepStuckTryonRequests` — `functions.pubsub.schedule("every 10 minutes")`, the same idiom as the existing `sweepStoreValleyDeliveryJobs`. It finds `processing` rows whose `started_at` is older than the function ceiling, marks them `failed` with `error_code: "timeout"`, and refunds. Without this, a run that dies mid-flight leaves a debited balance and a spinner that never resolves.

### 6.4 `tryon_admin_functions.js` — one gated callable

A single `tryonAdmin` callable taking an `action` field, following the `storeValleyProxy` precedent of one shared gate rather than nine near-identical callables.

`requireTryonAdmin(context)` mirrors the client check exactly: `users/{uid}` must exist with `status === "Published"` and a `role_unique_key`, and the `roles` document with that `role_unique_key` must contain `tryon` or `super_admin` in `permissions_list`. That is the same derivation as `auth-provider.tsx` lines 104-121, so panel and server cannot drift apart.

Reads and retries accept `tryon`. Mutations — `save_provider`, `save_model`, `save_settings`, `delete_provider`, `delete_model`, `seed_defaults` — additionally require `settings` or `super_admin`.

Actions: `list_providers`, `save_provider`, `delete_provider`, `list_models`, `save_model`, `delete_model`, `get_settings`, `save_settings`, `test_model`, `list_requests`, `retry_request`, `get_request`, `seed_defaults`.

Key handling:

- `list_providers` returns `{ provider_id, label, kind, base_url, enabled, has_key, key_hint }` and never the key itself.
- `save_provider` accepts `api_key`, but when that field is omitted the stored key is left untouched, so a label change or an enable toggle does not require re-typing a 40-character key.
- `test_model` writes a real `tryon_requests` row owned by the calling admin, tagged `is_test: true` and `source: "function"`, and returns the id. The panel then streams it. A passing test therefore exercises production code rather than a side door.

`list_requests` is paginated with status, user and model filters. This is required, not a nicety: under the new rules the panel can only see rows where `user_id` is its own, so without the callable it could not see the queue at all.

`index.js` gains five exports, in the existing registration style.

### 6.5 Tests

Plain node scripts, run the same way as the existing suite.

- `tryon_providers.test.js` — asserts the exact request body for each of the four `api_style` values, the OpenAI multipart field names (`model`, `prompt`, `size`, and one `image[]` per input), parsing from a canned response per style, and every `describeError` mapping including the prose-instead-of-an-image case.
- `tryon_generate_ops.test.js` — model resolution order, resolution fallback, prompt-override precedence, the retry decision, credit math, storage path, raw truncation, and key masking.

## 7. Admin panel (`azya-admin-2026`)

### 7.1 Routes and navigation

Four routes under the existing Media › Virtual try-on nav leaf:

    { label: "Virtual try-on", tabs: ["tryon", "tryon-models", "tryon-requests", "tryon-settings"] }

`/tryon` is unchanged — Plans over `user_vto_plans`. The three new paths are added to `src/lib/routes.ts` with `group: "Media"`, `permission: "tryon"`, and a new `view: "tryon"` member added to the `AdminRoute.view` union. Listing all four as tabs on one nav leaf satisfies `tests/nav.test.ts`, which asserts every route is linked exactly once, with no change to that test.

### 7.2 Files

`src/lib/tryon.ts` — the only module that talks to the backend, mirroring how `src/lib/functions.ts` wraps `storeValleyProxy`.

- Types `TryonProvider`, `TryonModel`, `TryonSettings`, `TryonRequest`. None has an `api_key` field; providers carry `has_key` and `key_hint` instead.
- `tryonAdmin<T>(action, payload)` over the existing `callFunction`, plus wrappers: `listProviders`, `saveProvider`, `deleteProvider`, `listModels`, `saveModel`, `deleteModel`, `getSettings`, `saveSettings`, `seedDefaults`, `testModel`, `listRequests`, `retryRequest`.
- `newModelDraft(kind)` — a prefilled model row carrying the right `api_style`, `resolutions` and `default_resolution` for that provider kind: `["512px","1K","2K","4K"]` for Gemini, `["1024x1024","1024x1536","1536x1024"]` for OpenAI. This is the concrete "add more models" affordance — choose a provider, get a valid draft, type the model string.
- `statusTone(status)` and `describeError(code)` mapping `invalid_key`, `rate_limited`, `blocked`, `provider_error`, `timeout` to plain wording such as "The provider rejected the API key", so the Requests tab explains itself instead of showing a raw provider payload.
- Pure and dependency-free, so it is directly unit-testable.

`src/components/tryon-models.tsx` — two stacked panels.

- Providers table: label, kind, base URL, key state ("key set · …4f2a" or "no key"), enabled toggle, Edit, Delete. Form: label, kind select, `api_key` as a password input with show/hide and the hint "leave blank to keep the current key", base URL, notes, enabled.
- Models table: label, provider, model string, `api_style`, credit cost, default resolution, a default marker, enabled. Form: provider select, label, model string, `api_style` select whose options are filtered by the chosen provider's kind, capability checkboxes, resolutions as a comma list, default resolution, `num_images`, `credit_cost`, `timeout_seconds`, `prompt_override` textarea, and an `extra` JSON textarea for knobs such as `aspect_ratio` and `quality` with inline validation on blur.
- A Test button per model calls `testModel`, then follows the returned request row and renders the resulting image or the normalised error. This is the payoff of the whole design: a new model row is provable from the panel before it goes anywhere near the app.
- Write controls are hidden unless `allowed("settings")`; a `tryon`-only admin sees read-only tables. This matches the server gate in §6.4.

`src/components/tryon-requests.tsx` — the queue.

- Columns: created_at, user, model, status badge, duration, credits, error, result thumbnail. Filters for status, model and user, paginated through `listRequests`.
- Retry per row calls `retryRequest`, which flips status back to `pending` and lets the existing trigger do the work.
- Expanding a row reveals the full error, the prompt snapshot, resolution, attempt count and the `usage` block — which is what you will want when a provider's pricing changes.

`src/components/tryon-settings.tsx` — the global form.

- Master `enabled` switch, default model select, optional fallback model select, prompt textarea seeded with the exact string currently hardcoded at `api_calls.dart:982`, resolution, `num_images`, `credit_cost_fallback`, `max_attempts`, `require_person_and_outfit`.
- A read-only "App-facing values" card showing exactly what `tryon_settings/public` exposes, so the credit label in the app is never a mystery to whoever is on support.

### 7.3 Notable choices

- These pages deliberately do **not** use `RecordPanel`. RecordPanel reads Firestore directly from the browser, and these collections are unreadable from the client by design. Purpose-built components going through the callable are the point, not a preference.
- A "Seed defaults" button appears only when providers and models are both empty. It calls `seed_defaults`, which creates the `google` and `openai` provider shells with no keys, the three starter model rows from §5.2, and the settings document. Without it the first screen an admin sees is three empty tables with no hint of what belongs in them.
- Styling follows the house tokens already in `screen.tsx` and `record-panel.tsx`: `rounded-[14px] bg-white`, `text-[13px]`, `text-[#a9a9a9]` for muted text, `#f52525` for errors. `label()` and `cellText()` are reused where they fit rather than inventing new formatting.

`tests/tryon.test.ts` — vitest, matching `tests/store-valley.test.ts`: `newModelDraft` for both kinds, `statusTone` and `describeError` across all five codes, and the payload each wrapper sends with `callFunction` injected, so a mistyped action name fails the suite rather than production.

## 8. Customer app (`azyaa-app`)

### 8.1 New `lib/backend/virtual_try_on/tryon_service.dart`

Hand-written rather than generated, which is where this repo's conventions put hand edits (`lib/backend/<domain>/`, `lib/custom_code/`, tests). `cloud_functions: 5.5.2` and `cloud_firestore: 5.6.9` are already in `pubspec.yaml`, so no dependency changes.

- `createTryonRequest({ personImageUrl, outfitImageUrl, productRefId, personStoragePath, outfitStoragePath })` → `httpsCallable("tryonCreateRequest")`, returning `{ requestId, creditsCharged, creditBalance }`
- `watchTryonRequest(id)` → `cloud_firestore.collection("tryon_requests").doc(id).snapshots()` mapped to a typed snapshot `{ status, result, error, errorCode, creditsCharged, modelId }`
- `retryTryonRequest(id)` → `httpsCallable("tryonRetryRequest")`
- `loadPublicSettings()` → reads `tryon_settings/public`, so the button label stops hardcoding "(-1 credit)"
- `TryonRequestSnapshot.fromMap` and `isTerminal(status)` kept pure and Firebase-free
- `TryonCreateException` turning `invalid_key`, `rate_limited`, `blocked`, `provider_error` and `timeout` into readable copy

### 8.2 Edits to `v_t_o_final_widget.dart`

Three surgical changes:

1. Lines ~905-1006 — the `VirtualTryOnGroup.mainCall.call`, the manual `tryon_requests` write, the manual credit deduction and the `user_vto_history` append — collapse into one `createTryonRequest(...)` call. Credits move server-side; the widget reads `creditsCharged` off the response to keep its optimistic UI identical.
2. Both `StreamBuilder`s at line 1047 and line 1178, which today filter `where('status', isEqualTo: 'pending')`, must watch the document by reference instead. This is required, not cosmetic: with `processing` as a new state, the old filter stops matching the moment the job is claimed and the spinner would vanish mid-generation. The builder becomes a status switch — `pending` and `processing` show the existing `BlankLoadingWidget`, `completed` shows the result image, `failed` shows the error text plus a Retry button wired to `retryTryonRequest`.
3. `processesStatus` at line 971 still works; it flips to `Show` on a successful create response instead of a provider response.

### 8.3 Deletions

`VirtualTryOnGroup` (`api_calls.dart` lines 963-1091) and `WaterMarkImageCall` (lines 1177-1194). The watermark call is already dead — a live probe returns 404 for `/` — and `virtual_try_on_slides` and the rest of the folder are untouched.

### 8.4 Test

New `test/tryon_service_test.dart` covering the pure parts only: `TryonRequestSnapshot.fromMap`, `isTerminal`, and the error-code copy. `azyaa-app/test/` currently holds only `widget_test.dart`, which is web-only and cannot run on the VM — a pre-existing condition that this work does not touch.

## 9. Rollout

Five separately deployable chunks, in this order.

**Chunk 1 — functions, rules, indexes.** Purely additive and inert. The new collections are deny-all today and nothing reads them yet, so adding their rules changes no behaviour. `tryon_requests.write` deliberately stays `if request.auth != null`.

    cd azyaa-admin/firebase
    firebase deploy --only functions:custom_cloud_functions,firestore:rules,firestore:indexes

Confirm the deploy targets `us-central1`. `FirebaseFunctions.instance` in the app defaults to that region, and a mismatch fails at runtime rather than at deploy.

**Chunk 2 — panel pages.** Also inert; nothing calls the pipeline until keys are set.

**Chunk 3 — keys and verification, entirely inside the panel.** Seed defaults, paste the Google and OpenAI keys, Test each of the three starter models, and confirm an image or a clear error. This is the moment both providers are proven end to end, with the app still untouched.

**Chunk 4 — the app release.** New installs use callables. Installed builds keep calling newplot until they update — we do not control that server and do not touch it, so "delete newplot" is a client-side deletion and the cutover is gradual through store-update adoption rather than a flag day. Newplot traffic decays to zero on its own.

**Chunk 5 — after the new build dominates**, change the `tryon_requests` write rule to `if false`. Keeping this in its own deploy is what lets you watch the Requests tab for surprises first.

### 9.1 The `source` marker

The trigger acts only on rows carrying `source: "function"`, written by the create callable. If a legacy build somehow writes its own `pending` row, the new pipeline ignores it rather than generating — and billing — a second image for a request newplot may already have processed. The same marker means existing `tryon_requests` rows are deliberately not backfilled or reprocessed; they stay as history.

This matters because `tryon_requests` has no rule in the repo copy of `firestore.rules` (see §1), so whether legacy builds can write there at all depends on the deployed rules. The marker makes the answer irrelevant.

## 10. Verification

Automated:

- Functions: `cd azyaa-admin/firebase/custom_cloud_functions && npm install && for f in *.test.js; do node "$f" && echo "PASS $f" || echo "FAIL $f"; done`. This reads 10/10 today and should read 12/12 after.
- Panel: `npm test` (vitest, 3 files → 4), `npm run lint`, and `npm run build`. The build is what actually catches the `AdminRoute.view` union change and any dead import.
- App: `flutter analyze` and `flutter test test/tryon_service_test.dart`.

Manual, in order:

1. Seed defaults, set both keys, Test each of the three starter models from the panel. Each must return an image or a normalised error.
2. One real try-on from the app: the request row reaches `completed`, credits are debited exactly once, the image renders, and the history grid picks it up.
3. Confirm the deployed rules: `tryon_requests` is readable only by its owner user, and `tryon_providers`, `tryon_models` and `tryon_settings/current` reject a direct client read.

Negative cases, done by hand:

- A deliberately wrong key must produce `invalid_key` and a refund, with the balance restored.
- A disabled model must be rejected at create with no debit at all.
- Two fast taps must have the second rejected by the one-in-flight guard.
- A `tryon`-only admin must see read-only tables and must be refused by `save_model` server-side.
- Cloud Functions logs must be grepped to confirm no API key ever appears in them.

## 11. Limitations and risks

1. **FlutterFlow regeneration will revert the widget changes.** `v_t_o_final_widget.dart` and `api_calls.dart` are generated, and the hardcoded prompt at line 910 is already a hand edit of generated code. Mitigation is to keep the widget diff to a one-line call swap and a status switch, with all logic in `tryon_service.dart` — but the same change has to be made in the FlutterFlow project itself eventually or it will regress on the next export. This is the largest ongoing risk here and it cannot be eliminated from these repos.
2. **Results stay world-readable by URL** under `users/{uid}/**`, the same as existing user uploads.
3. **No rate limiting** beyond one in-flight request per user, and no per-user spend cap.
4. **Per-model `credit_cost` prices models differently, but nothing enforces a spend ceiling.** The `usage` block is recorded per request so real provider spend can be reconciled later, not capped.
5. **Keys live in Firestore** behind a deny-all rule, not in Secret Manager. The documented upgrade path is to move the key into Secret Manager and keep only the secret name on the `tryon_providers` document, behind the same field shape, so nothing else changes.
6. **`firebase-functions ^4` is 1st-gen.** The design follows the existing `onWrite` and `pubsub.schedule` idioms, so nothing new is required, but a 2nd-gen migration is out of scope.
7. **`gpt-image` calls are slower and priced differently from nano banana.** `timeout_seconds` is per model so this is tunable, and `fallback_model_id` exists precisely because one provider can be unavailable while the other is fine.

## 12. Suggested implementation order

1. `tryon_providers.js` + `tryon_generate_ops.js` and their tests. Pure, no cloud access, fastest feedback, and they pin down both providers' request shapes before anything can deploy.
2. `tryon_generate_functions.js` and `tryon_admin_functions.js`, plus the rules and index changes and the `index.js` registrations.
3. `src/lib/tryon.ts` + `tests/tryon.test.ts`, then the three panel pages.
4. `tryon_service.dart` + `test/tryon_service_test.dart`, then the three edits in `v_t_o_final_widget.dart` and the two deletions in `api_calls.dart`.
5. Deploy in the order given in §9, and only then tighten the `tryon_requests` write rule.


