import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'custom_promotion_view_widget.dart' show CustomPromotionViewWidget;
import 'package:flutter/material.dart';

class CustomPromotionViewModel
    extends FlutterFlowModel<CustomPromotionViewWidget> {
  ///  Local state fields for this component.

  int? count;

  List<CreatorPromotionsStruct> promotionList = [];
  void addToPromotionList(CreatorPromotionsStruct item) =>
      promotionList.add(item);
  void removeFromPromotionList(CreatorPromotionsStruct item) =>
      promotionList.remove(item);
  void removeAtIndexFromPromotionList(int index) =>
      promotionList.removeAt(index);
  void insertAtIndexInPromotionList(int index, CreatorPromotionsStruct item) =>
      promotionList.insert(index, item);
  void updatePromotionListAtIndex(
          int index, Function(CreatorPromotionsStruct) updateFn) =>
      promotionList[index] = updateFn(promotionList[index]);

  List<String> uids = [];
  void addToUids(String item) => uids.add(item);
  void removeFromUids(String item) => uids.remove(item);
  void removeAtIndexFromUids(int index) => uids.removeAt(index);
  void insertAtIndexInUids(int index, String item) => uids.insert(index, item);
  void updateUidsAtIndex(int index, Function(String) updateFn) =>
      uids[index] = updateFn(uids[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in reject widget.
  UsersRecord? creatorResultCopy;
  // Stores action output result for [Cloud Function - sendPushNotificationToMultipleUsers] action in reject widget.
  SendPushNotificationToMultipleUsersCloudFunctionCallResponse?
      cloudFunctionhs5;
  // Stores action output result for [Backend Call - Read Document] action in approve widget.
  UsersRecord? creatorResult;
  // Stores action output result for [Firestore Query - Query a collection] action in approve widget.
  SettingsRecord? settingsResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
