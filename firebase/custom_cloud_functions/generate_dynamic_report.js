const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { requireStaff } = require("./store_valley_staff.js");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.generateDynamicReport = functions
  .runWith({
    timeoutSeconds: 300,
    memory: "512MB",
  })
  .https.onCall(async (data, context) => {
    // Office staff only: checked before anything else.
    await requireStaff(context, { noDesigner: true });

    // 1. Extract dynamic parameters from the client request
    const projectId = data.projectId;
    const collectionName = data.collectionName;
    const reportType = data.reportType; // 'count' or 'financial'
    const fieldToSum = data.fieldToSum; // e.g., 'totalAmount', 'deliveryFee'
    const statusFilter = data.statusFilter; // e.g., 'completed'

    const db = admin.firestore();

    // 2. Validate essential inputs
    if (!projectId || !collectionName || !reportType) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Missing required parameters: projectId, collectionName, or reportType.",
      );
    }

    if (reportType === "financial" && !fieldToSum) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "A fieldToSum must be provided for financial reports.",
      );
    }

    try {
      // 3. Build the dynamic query
      let query = db
        .collection(collectionName)
        .where("projectId", "==", projectId);

      // Add optional filters dynamically
      if (statusFilter) {
        query = query.where("order_status", "==", statusFilter);
      }

      // 4. Execute the query
      const snapshot = await query.get();

      if (snapshot.empty) {
        return {
          success: true,
          message: "No data found for the given parameters.",
          result: 0,
        };
      }

      // 5. Perform dynamic calculations
      let result = 0;

      if (reportType === "count") {
        // Simply count the documents that matched the query
        result = snapshot.size;
      } else if (reportType === "financial") {
        // Iterate through documents and sum the requested field
        snapshot.forEach((doc) => {
          const docData = doc.data();
          const value = docData[fieldToSum];

          // Ensure the value exists and is a number before adding
          if (typeof value === "number") {
            result += value;
          }
        });
      } else {
        throw new functions.https.HttpsError(
          "invalid-argument",
          'Invalid reportType. Use "count" or "financial".',
        );
      }

      // 6. Return the calculated data back to the client
      return {
        success: true,
        collection: collectionName,
        reportType: reportType,
        totalRecordsProcessed: snapshot.size,
        result: result,
      };
    } catch (error) {
      console.error("Error generating report:", error);
      throw new functions.https.HttpsError(
        "internal",
        "Unable to generate report",
        error.message,
      );
    }
  });
