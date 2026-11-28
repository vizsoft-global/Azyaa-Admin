/*
 * Things an outsider or a curious customer might try. Each must be refused;
 * the legitimate neighbour of each attack must still be allowed.
 */
const { doc, getDoc, setDoc, updateDoc, deleteDoc, arrayUnion } = require("firebase/firestore");
const { dbOf, seedDocs, ok, no, personRecord, PEOPLE } = require("./lib");

const STAFF_ROLES = ["super_admin", "admin", "shop_manager", "designer"];

async function identity(env) {
  // ---- a customer cannot give themselves a role ----
  for (const who of ["cust1", "cust2", "pending1", "designer1"]) {
    const db = dbOf(env, who);
    for (const role of STAFF_ROLES) {
      if (PEOPLE[who].role_unique_key === role) continue;
      await no(updateDoc(doc(db, "users", who), { role_unique_key: role }), who + " makes themselves " + role);
    }
  }
  await no(updateDoc(doc(dbOf(env, "designer1"), "users", "designer1"), { role_unique_key: "" }), "designer clears own role");
  await no(updateDoc(doc(dbOf(env, "cust1"), "users", "cust1"), { user_role: "Super Admin" }), "customer sets user_role to Super Admin");
  await ok(updateDoc(doc(dbOf(env, "cust1"), "users", "cust1"), { user_role: "Customer", display_name: "New Name" }), "customer saves own profile");

  // ---- creating a users record ----
  const ghost = dbOf(env, "ghost");
  for (const role of STAFF_ROLES) {
    await no(setDoc(doc(ghost, "users", "ghost"), { uid: "ghost", role_unique_key: role }), "new account creates own record as " + role);
  }
  await no(setDoc(doc(ghost, "users", "someone-else"), { uid: "someone-else", user_role: "Customer" }), "account creates a record under another id");
  await no(setDoc(doc(ghost, "users", "someone-else"), { uid: "ghost", user_role: "Customer" }), "account creates a second record claiming its own uid");
  await no(setDoc(doc(dbOf(env, "anon"), "users", "anon-made"), { uid: "x", user_role: "Customer" }), "signed-out create of a users record");
  await no(setDoc(doc(ghost, "users", "ghost"), { uid: "ghost", user_role: "Super Admin" }), "new account creates own record with user_role Super Admin");
  await ok(setDoc(doc(ghost, "users", "ghost"), { uid: "ghost", email: "ghost@example.test", user_role: "Customer", status: "Published" }), "new account creates own record (app shape, no role field)");
  const fresh = env.authenticatedContext("fresh-panel").firestore();
  await ok(
    setDoc(doc(fresh, "users", "fresh-panel"), { uid: "fresh-panel", email: "p@example.test", role_unique_key: "", user_role: "Admin", status: "Pending" }),
    "panel Register form creates own record (empty role)",
  );

  // ---- someone else's record ----
  const cust1 = dbOf(env, "cust1");
  await ok(updateDoc(doc(cust1, "users", "cust2"), { points_balance: 15, user_vto: 2 }), "customer pays the referral bonus onto another record");
  await no(updateDoc(doc(cust1, "users", "cust2"), { email: "stolen@example.test" }), "customer changes another customer's email");
  await no(updateDoc(doc(cust1, "users", "cust2"), { points_balance: 20, role_unique_key: "designer" }), "customer slips a role into a referral write");
  await no(updateDoc(doc(cust1, "users", "super1"), { role_unique_key: "customer" }), "customer demotes a super admin");
  await no(updateDoc(doc(dbOf(env, "designer1"), "users", "cust2"), { display_name: "x" }), "designer changes a customer's record");
  await no(updateDoc(doc(dbOf(env, "designer1"), "users", "designer2"), { status: "Rejected" }), "designer changes another designer's record");

  // ---- office and super admin ----
  const admin = dbOf(env, "admin1");
  await ok(updateDoc(doc(admin, "users", "pending1"), { role_unique_key: "designer", status: "Published" }), "admin approves a designer");
  await ok(updateDoc(doc(admin, "users", "cust2"), { status: "Blocked" }), "admin edits a customer");
  await no(updateDoc(doc(admin, "users", "cust2"), { role_unique_key: "super_admin" }), "admin makes someone a super admin");
  await no(updateDoc(doc(admin, "users", "super2"), { role_unique_key: "admin" }), "admin demotes a super admin");
  await no(updateDoc(doc(admin, "users", "admin1"), { role_unique_key: "super_admin" }), "admin makes themselves super admin");
  await ok(updateDoc(doc(admin, "users", "super2"), { display_name: "Edited" }), "admin edits a super admin's name, role untouched");
  const superDb = dbOf(env, "super1");
  await ok(updateDoc(doc(superDb, "users", "cust2"), { role_unique_key: "super_admin" }), "super admin makes someone a super admin");
  await ok(updateDoc(doc(superDb, "users", "cust2"), { role_unique_key: "" }), "super admin takes it away again");
  await no(setDoc(doc(superDb, "users", "made-by-super"), { uid: "made-by-super", role_unique_key: "admin" }), "nobody creates a record for someone else, not even a super admin");
  await no(setDoc(doc(admin, "users", "made-by-admin"), { uid: "made-by-admin", role_unique_key: "super_admin" }), "admin creates a super admin record");

  // ---- staff keep saving their own profile (role sent back unchanged) ----
  for (const who of ["designer1", "admin1", "shop1", "super1"]) {
    const db = dbOf(env, who);
    const whole = { ...personRecord(who), display_name: "Renamed " + who };
    await ok(setDoc(doc(db, "users", who), whole), who + " saves own whole record, role unchanged");
    await ok(setDoc(doc(db, "users", who), { display_name: "Merged" }, { merge: true }), who + " merges into own record");
  }
  await no(
    setDoc(doc(dbOf(env, "designer1"), "users", "designer1"), { ...personRecord("designer1"), role_unique_key: "admin" }),
    "designer saves own whole record with a higher role",
  );
  // A returning sign-in that writes the create payload again must not wipe or change the role.
  await no(
    setDoc(doc(dbOf(env, "designer1"), "users", "designer1"), { uid: "designer1", email: "designer1@example.test", user_role: "Customer" }),
    "returning designer overwrites own record without the role",
  );
  await ok(
    setDoc(doc(dbOf(env, "designer1"), "users", "designer1"), { email: "designer1@example.test", last_login: 1 }, { merge: true }),
    "returning designer merges sign-in fields",
  );

  // ---- approval status is given by the office, never taken ----
  await seedDocs(env, "users", {
    cust1: { ...personRecord("cust1"), creator_main_info: { creator_status: "pending", creator_promotions: [] }, designer_requests: { status: "Pending" } },
    designer1: { ...personRecord("designer1"), designer_main_info: { designer_status: "inactive", designer_bank_info: { bank_name: "A" } } },
  });
  await no(updateDoc(doc(cust1, "users", "cust1"), { "creator_main_info.creator_status": "active" }), "customer approves themselves as a creator");
  await no(updateDoc(doc(cust1, "users", "cust1"), { designer_main_info: { designer_status: "active" } }), "customer writes themselves a designer approval");
  await no(updateDoc(doc(dbOf(env, "designer1"), "users", "designer1"), { "designer_main_info.designer_status": "active" }), "designer re-activates themselves");
  await ok(
    updateDoc(doc(dbOf(env, "designer1"), "users", "designer1"), { "designer_main_info.designer_bank_info.bank_name": "B", "designer_main_info.designer_bank_info.iban_or_ifsc_code": "KW00" }),
    "designer saves own bank details (panel)",
  );
  await ok(
    updateDoc(doc(cust1, "users", "cust1"), { "creator_main_info.creator_promotions": arrayUnion({ promotion_id: "PROMP1", promotion_status: "pending" }) }),
    "creator adds a promotion to own record (app)",
  );
  await ok(updateDoc(doc(admin, "users", "cust1"), { "creator_main_info.creator_status": "active", user_role: "Creator" }), "admin approves a creator");
  await ok(updateDoc(doc(admin, "users", "designer1"), { "designer_main_info.designer_status": "active" }), "admin re-activates a designer");

  // ---- deleting people ----
  await seedDocs(env, "users", { "gone-1": { uid: "gone-1" }, "gone-2": { uid: "gone-2" }, "gone-3": { uid: "gone-3" } });
  await no(deleteDoc(doc(cust1, "users", "cust1")), "customer deletes own record");
  await no(deleteDoc(doc(cust1, "users", "gone-1")), "customer deletes another record");
  await no(deleteDoc(doc(admin, "users", "gone-2")), "admin deletes a user");
  await ok(deleteDoc(doc(superDb, "users", "gone-3")), "super admin deletes a user");

  // ---- roles and permissions ----
  await seedDocs(env, "roles", { designer: { role_unique_key: "designer", permissions_list: ["dashboard"] } });
  await no(getDoc(doc(dbOf(env, "anon"), "roles", "designer")), "signed-out read of a role");
  await ok(getDoc(doc(ghost, "roles", "designer")), "any signed-in account reads its role");
  await no(updateDoc(doc(dbOf(env, "designer1"), "roles", "designer"), { permissions_list: ["dashboard", "users"] }), "designer widens the designer role");
  await no(updateDoc(doc(admin, "roles", "designer"), { permissions_list: [] }), "admin edits a role");
  await ok(updateDoc(doc(superDb, "roles", "designer"), { permissions_list: ["dashboard", "product"] }), "super admin edits a role");
}

async function runAttacks(env) {
  await identity(env);
}

module.exports = { runAttacks };
