const functions = require("firebase-functions");
const admin = require("firebase-admin");

// The panel roles. A signed-in customer (role "customer", or no role) is not staff.
const STAFF_ROLES = ["super_admin", "admin", "shop_manager", "designer"];
const DESIGNER_ROLE = "designer";

function roleKeyOf(profile) {
  return String((profile && profile.role_unique_key) || "").trim();
}

function isStaffRole(roleKey, opts) {
  const key = String(roleKey || "").trim();
  if (!STAFF_ROLES.includes(key)) {
    return false;
  }
  if (opts && opts.noDesigner === true && key === DESIGNER_ROLE) {
    return false;
  }
  return true;
}

/**
 * Whether a caller may use a staff-only function.
 * `auth` is `context.auth`; `profile` is the caller's `users` record or null.
 */
function staffDecision(auth, profile, opts) {
  if (!auth || !auth.uid) {
    return { ok: false, code: "unauthenticated", message: "Sign in required." };
  }
  const roleKey = roleKeyOf(profile);
  if (!isStaffRole(roleKey, opts)) {
    return { ok: false, code: "permission-denied", message: "Staff only." };
  }
  return { ok: true, uid: auth.uid, roleKey };
}

/**
 * The caller's `users` record. The record filed under the login id is the one
 * the database rules trust, so it is read first. Only when there is none is
 * the `uid` field searched (one old account is filed under another id).
 * A second record that merely claims someone's uid can never outrank the
 * record under the login id.
 */
async function loadStaffProfile(db, uid) {
  const direct = await db.collection("users").doc(uid).get();
  if (direct.exists) {
    return direct.data() || {};
  }
  const byField = await db
    .collection("users")
    .where("uid", "==", uid)
    .limit(1)
    .get();
  return byField.empty ? null : byField.docs[0].data() || {};
}

/**
 * Stops the call unless the signed-in person is panel staff.
 * `opts.noDesigner` also refuses designers.
 */
async function requireStaff(context, opts) {
  const auth = context && context.auth;
  if (!auth || !auth.uid) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "Sign in required.",
    );
  }
  const options = opts || {};
  const db = options.db || admin.firestore();
  const profile = await loadStaffProfile(db, auth.uid);
  const decision = staffDecision(auth, profile, options);
  if (!decision.ok) {
    throw new functions.https.HttpsError(decision.code, decision.message);
  }
  return decision;
}

module.exports = {
  STAFF_ROLES,
  isStaffRole,
  staffDecision,
  loadStaffProfile,
  requireStaff,
};
