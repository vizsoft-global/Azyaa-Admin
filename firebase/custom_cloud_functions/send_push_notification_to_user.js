const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { requireStaff } = require("./store_valley_staff.js");
exports.sendPushNotificationToUser = functions.https.onCall(
  async (data, context) => {
    // Office staff only: checked before anything else.
    await requireStaff(context, { noDesigner: true });

    // --- Input Parameters from FlutterFlow ---
    const userId = data["userId"];
    const notificationTitle = data["notificationTitle"];
    const notificationBody = data["notificationBody"];
    const imageUrl = data["imageUrl"];
    const initialPageName = data["initialPageName"];
    const initialPageParameters = data["initialPageParameters"];

    if (!userId || !notificationTitle || !notificationBody) {
      console.error(
        "Missing required parameters: userId, notificationTitle, or notificationBody",
      );
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Missing required parameters.",
      );
    }

    // --- Fetch FCM Token from Firestore ---
    let fcmToken;
    try {
      const userDocRef = admin.firestore().collection("users").doc(userId);
      const userDoc = await userDocRef.get();

      if (!userDoc.exists) {
        console.warn(`User document not found for userId: ${userId}`);
        throw new functions.https.HttpsError("not-found", "User not found.");
      }

      fcmToken = userDoc.data().fcm_token; // Make sure this matches your field name

      if (!fcmToken) {
        console.warn(`FCM token not found for user: ${userId}`);
        // You might throw an error or just return if no token to send to
        throw new functions.https.HttpsError(
          "not-found",
          "FCM token not found for user.",
        );
      }
    } catch (error) {
      console.error("Error fetching user or FCM token:", error);
      throw new functions.https.HttpsError(
        "internal",
        "Failed to retrieve FCM token.",
        error.message,
      );
    }

    // --- Construct the FCM Message ---
    const message = {
      notification: {
        title: notificationTitle,
        body: notificationBody,
      },
      token: fcmToken,
      data: {
        // Custom data to pass to your app when notification is tapped
        // Ensure these keys match what you expect in FlutterFlow's "Notification Clicked Actions"
        userId: userId,
        // Example for navigating to a page:
        initialPage: initialPageName || "HomePage", // Default to Home if not specified
      },
    };

    if (imageUrl) {
      message.notification.imageUrl = imageUrl;
    }

    if (
      initialPageParameters &&
      Object.keys(initialPageParameters).length > 0
    ) {
      // Merge initialPageParameters into the data payload
      Object.assign(message.data, initialPageParameters);
    }

    // --- Send the Push Notification ---
    try {
      const response = await admin.messaging().send(message);
      console.log("Successfully sent message:", response);
      return { status: "success", message: "Notification sent successfully." }; // Optional return
    } catch (error) {
      console.error("Error sending message:", error);
      throw new functions.https.HttpsError(
        "internal",
        "Failed to send notification.",
        error.message,
      );
    }
  },
);
