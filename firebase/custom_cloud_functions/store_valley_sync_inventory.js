const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { mergeInventoryCacheDoc } = require("./store_valley_inventory_cache.js");

const DEFAULT_BASE_URL =
  "https://us-central1-store-valley-websitek-staging.cloudfunctions.net/api/v1";
const DEFAULT_DESIGNER_ID = "DSN-KWT-0001";
const DEFAULT_WAREHOUSE_ID = "WH-KWT-MAIN";
const PAGE_SIZE = 50;

function configValue(key, envName, fallback) {
  const fromEnv = process.env[envName];
  if (fromEnv) {
    return fromEnv;
  }
  try {
    const cfg = functions.config().storevalley || {};
    if (cfg[key]) {
      return cfg[key];
    }
  } catch (_) {
    // functions.config() is unset locally
  }
  return fallback;
}

async function fetchInventoryPage(baseUrl, apiKey, query) {
  const search = new URLSearchParams();
  Object.keys(query).forEach((key) => {
    const value = query[key];
    if (value !== undefined && value !== null && value !== "") {
      search.append(key, String(value));
    }
  });
  const url = baseUrl + "/inventory?" + search.toString();
  const response = await fetch(url, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
      "x-api-key": apiKey,
    },
  });
  const text = await response.text();
  let parsed;
  try {
    parsed = text ? JSON.parse(text) : {};
  } catch (_) {
    parsed = { message: text };
  }
  if (!response.ok) {
    const error = new Error(
      parsed.message || "Store Valley inventory request failed.",
    );
    error.status = response.status;
    throw error;
  }
  return parsed;
}

exports.storeValleySyncInventory = functions
  .runWith({
    timeoutSeconds: 120,
    memory: "256MB",
  })
  .https.onCall(async (data, context) => {
    if (!context.auth) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "Sign in required.",
      );
    }

    const apiKey = configValue("api_key", "STOREVALLEY_API_KEY");
    if (!apiKey) {
      throw new functions.https.HttpsError(
        "failed-precondition",
        "Store Valley API key is not configured.",
      );
    }

    const baseUrl = configValue(
      "base_url",
      "STOREVALLEY_BASE_URL",
      DEFAULT_BASE_URL,
    ).replace(/\/$/, "");
    const designerId =
      (data && data.designer_id) || DEFAULT_DESIGNER_ID;
    const warehouseId =
      (data && data.warehouse_id) || DEFAULT_WAREHOUSE_ID;

    const db = admin.firestore();
    let startingAfter;
    let upserted = 0;
    let pages = 0;
    let asOf = null;

    try {
      let hasMore = true;
      while (hasMore) {
        const page = await fetchInventoryPage(baseUrl, apiKey, {
          designer_id: designerId,
          warehouse_id: warehouseId,
          limit: PAGE_SIZE,
          starting_after: startingAfter,
        });
        pages += 1;
        asOf = page.as_of || asOf;
        const items = Array.isArray(page.inventory) ? page.inventory : [];
        for (const item of items) {
          const wrote = await mergeInventoryCacheDoc(db, item, {
            updatedAt: admin.firestore.FieldValue.serverTimestamp(),
            asOf: page.as_of || null,
          });
          if (wrote) {
            upserted += 1;
          }
        }
        hasMore = page.has_more === true;
        startingAfter = page.next_cursor || null;
        if (hasMore && !startingAfter) {
          break;
        }
      }
    } catch (error) {
      if (error.status) {
        throw new functions.https.HttpsError(
          "unavailable",
          error.message || "Store Valley inventory request failed.",
        );
      }
      throw new functions.https.HttpsError(
        "unavailable",
        "Store Valley inventory sync failed.",
      );
    }

    return {
      upserted,
      pages,
      designer_id: designerId,
      warehouse_id: warehouseId,
      as_of: asOf,
    };
  });
