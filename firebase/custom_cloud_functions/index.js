const admin = require("firebase-admin/app");
admin.initializeApp();

const sendPushNotificationToUser = require("./send_push_notification_to_user.js");
exports.sendPushNotificationToUser =
  sendPushNotificationToUser.sendPushNotificationToUser;
const sendPushNotificationToMultipleUsers = require("./send_push_notification_to_multiple_users.js");
exports.sendPushNotificationToMultipleUsers =
  sendPushNotificationToMultipleUsers.sendPushNotificationToMultipleUsers;
const sendPushNotificationToUsers = require("./send_push_notification_to_users.js");
exports.sendPushNotificationToUsers =
  sendPushNotificationToUsers.sendPushNotificationToUsers;
const generateDynamicReport = require("./generate_dynamic_report.js");
exports.generateDynamicReport = generateDynamicReport.generateDynamicReport;
