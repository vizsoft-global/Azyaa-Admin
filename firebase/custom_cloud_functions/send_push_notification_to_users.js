const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.sendPushNotificationToUsers = functions.https.onCall(
  async (data, context) => {
    const userIds = data["userIds"];

    const notificationTitle = data["notificationTitle"];

    const notificationBody = data["notificationBody"];

    const imageUrl = data["imageUrl"];

    const initialPageName = data["initialPageName"];

    const initialPageParameters = data["initialPageParameters"];

    if (!Array.isArray(userIds) || userIds.length === 0) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "userIds must be a non-empty array.",
      );
    }

    if (!notificationTitle || !notificationBody) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Missing notification title or body.",
      );
    }

    const results = {
      success: [],

      failed: [],
    };

    for (const userId of userIds) {
      try {
        const userDocRef = admin.firestore().collection("users").doc(userId);

        const userDoc = await userDocRef.get();

        if (!userDoc.exists) {
          results.failed.push({ userId, reason: "User not found" });

          continue;
        }

        let finalFcmToken = null;

        // --- Check fcm_tokens subcollection for latest token ---

        const fcmTokensSnap = await userDocRef.collection("fcm_tokens").get();

        if (!fcmTokensSnap.empty) {
          let latestTokenEntry = null;

          for (const doc of fcmTokensSnap.docs) {
            const data = doc.data();

            const token = data?.fcm_token;

            const createdAt = data?.created_at;

            if (!token || !createdAt) continue;

            const createdDate = createdAt.toDate?.() ?? new Date(createdAt);

            if (!latestTokenEntry || createdDate > latestTokenEntry.createdAt) {
              latestTokenEntry = {
                token: token,

                createdAt: createdDate,
              };
            }
          }

          if (latestTokenEntry?.token) {
            finalFcmToken = latestTokenEntry.token;
          }
        }

        // --- Fallback to top-level user.fcm_token field ---

        if (!finalFcmToken) {
          finalFcmToken = userDoc.data()?.fcm_token;
        }

        if (!finalFcmToken) {
          results.failed.push({ userId, reason: "No valid FCM token found" });
          continue;
        }

        // --- Build the message ---
        const message = {
          token: finalFcmToken,
          notification: {
            title: notificationTitle,
            body: notificationBody,
          },
          data: {
            userId: userId,
            initialPage: initialPageName || "HomePage",
            ...(initialPageParameters || {}),
          },
        };

        if (imageUrl) {
          message.notification.imageUrl = imageUrl;
        }

        // --- Send the message ---
        const response = await admin.messaging().send(message);
        results.success.push({
          userId,
          messageId: response,
          sentMessage: message,
        });
      } catch (error) {
        console.error(`Error sending to ${userId}:`, error.message);
        results.failed.push({ userId, reason: error.message });
      }
    }

    return {
      status: "done",
      summary: results,
    };
  },
);
