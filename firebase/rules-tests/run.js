/*
 * Checks firebase/firestore.rules against the Firestore emulator.
 *
 *   npm install && npm test
 *
 * `npm test` starts the emulator through firebase-tools 13, whose emulator
 * runs on Java 17; newer firebase-tools need Java 21.
 *
 * What runs:
 *   unchanged   collections the lockdown leaves alone answer as before
 *   matrix      expected.js: every collection x person x operation
 *   attacks     things an outsider or a customer might try
 *   app flows   every write the customer app makes still works
 *   panel flows every write the admin panel makes still works
 */
const { newRules, oldRules, startEnv, seedPeople, counter } = require("./lib");
const { runUnchanged } = require("./unchanged.test");
const { runMatrix } = require("./matrix.test");
const { runAttacks } = require("./attacks.test");

const optional = (file, name) => {
  try {
    return require(file)[name];
  } catch (error) {
    if (error.code === "MODULE_NOT_FOUND" && String(error.message).includes(file.replace("./", ""))) return null;
    throw error;
  }
};

(async () => {
  const env = await startEnv(newRules(), "demo-azyaa-rules");
  const before = await startEnv(oldRules(), "demo-azyaa-rules-before");
  const parts = [
    ["unchanged", async () => runUnchanged(env, before)],
    ["matrix", () => runMatrix(env)],
    ["attacks", () => runAttacks(env)],
    ["app flows", optional("./app-flows.test", "runAppFlows") && (() => optional("./app-flows.test", "runAppFlows")(env))],
    ["panel flows", optional("./panel-flows.test", "runPanelFlows") && (() => optional("./panel-flows.test", "runPanelFlows")(env))],
  ].filter(([, run]) => run);
  const only = process.env.ONLY ? process.env.ONLY.split(",") : null;
  try {
    const summary = [];
    for (const [name, run] of parts) {
      if (only && !only.includes(name)) continue;
      await env.clearFirestore();
      await before.clearFirestore();
      await seedPeople(env);
      await seedPeople(before);
      const start = counter.checks;
      const compared = await run();
      summary.push(name + " " + (typeof compared === "number" ? compared + " comparisons" : counter.checks - start + " checks"));
    }
    console.log("rules tests passed: " + summary.join(", "));
  } finally {
    await env.cleanup();
    await before.cleanup();
  }
})().catch((error) => {
  console.error("RULES TEST FAILED:", error.message);
  process.exit(1);
});
