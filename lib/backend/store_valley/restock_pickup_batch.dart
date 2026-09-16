class RestockPickupBatch {
  RestockPickupBatch._();

  static bool isReadyRestock({
    required String requestType,
    required String fulfillStatus,
  }) {
    return requestType == 'Restock' && fulfillStatus == 'Ready to pickup';
  }

  static String batchExternalRequestId(String deliveryId) {
    final trimmed = deliveryId.trim();
    return trimmed.isEmpty ? 'BCH' : 'BCH$trimmed';
  }

  static List<String> mergeSelectedReady({
    required List<String> readyIds,
    required String selectedId,
    required bool selectedIsReady,
  }) {
    final seen = <String>{};
    final out = <String>[];
    if (selectedIsReady && selectedId.isNotEmpty) {
      out.add(selectedId);
      seen.add(selectedId);
    }
    for (final id in readyIds) {
      if (id.isEmpty || seen.contains(id)) {
        continue;
      }
      seen.add(id);
      out.add(id);
    }
    return out;
  }
}
