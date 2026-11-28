const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { requireStaff } = require("./store_valley_staff.js");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.sendPushNotificationToMultipleUsers = functions
  .runWith({
    timeoutSeconds: 60,
    memory: "512MB",
  })
  .https.onCall(async (data, context) => {
    // Office staff only: checked before anything else.
    await requireStaff(context, { noDesigner: true });

    const userIds = data.userIds;
    const notificationTitle = data.notificationTitle;
    const notificationBody = data.notificationBody;
    const imageUrl = data.imageUrl;
    const initialPageName = data.initialPageName;
    const initialPageParameters = data.initialPageParameters;
    // Write your code below!

    // Write your code above!
    return {};
  });
