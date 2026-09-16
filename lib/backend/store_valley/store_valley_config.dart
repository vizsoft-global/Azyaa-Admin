class StoreValleyConfig {
  static const warehouseId = 'WH-KWT-MAIN';
  static const pickupLocationId = 'WH-KWT-MAIN';
  static const packagingProfile = 'AZY-PKG-STD-01';
  static const fallbackDesignerId = 'DSN-KWT-0001';
  static const proxyCallableName = 'storeValleyProxy';
  static const syncInventoryCallableName = 'storeValleySyncInventory';
  static const resendPickupOtpCallableName = 'storeValleyResendPickupOtp';
  static const reserveWarehouseStockCallableName = 'reserveWarehouseStock';
  static const releaseWarehouseStockCallableName = 'releaseWarehouseStock';
  static const backfillWarehouseReservationsCallableName =
      'backfillWarehouseReservations';
  static const retryStoreValleyDeliveryCallableName =
      'retryStoreValleyDelivery';
  static const backfillStoreValleyDeliveriesCallableName =
      'backfillStoreValleyDeliveries';
}
