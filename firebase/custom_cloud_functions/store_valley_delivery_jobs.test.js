const jobs = require("./store_valley_delivery_jobs.js");
const ids = require("./store_valley_client_ids.js");

function assertEqual(actual, expected, label) {
  if (actual !== expected) {
    throw new Error(label + ": expected " + JSON.stringify(expected) + " got " + JSON.stringify(actual));
  }
}

function assertTrue(value, label) {
  if (!value) {
    throw new Error(label + ": expected truthy");
  }
}

const warehouseItem = {
  product_id: "AZYPRD1122",
  quantity: 2,
  product_main_type: "ready",
  product_stock_info: { is_preferred_vendor: true },
};

const customItem = {
  product_id: "CUSTOM1",
  quantity: 1,
  product_main_type: "custom",
  product_designer_id: "uidA",
  product_pickup_info: { status: "Ready to Pickup" },
};

assertEqual(
  jobs.isPickupEligibleItem(customItem),
  true,
  "custom ready to pickup is eligible",
);
assertEqual(
  jobs.isPickupEligibleItem({
    ...customItem,
    product_pickup_info: { status: "Ready to pickup" },
  }),
  false,
  "restock casing is not order pickup",
);
assertEqual(
  jobs.isPickupEligibleItem({
    ...customItem,
    product_pickup_info: {
      status: "Ready to Pickup",
      delivery_tracking_id: "SV-1",
    },
  }),
  false,
  "already tracked item is not eligible",
);
assertEqual(
  jobs.isPickupEligibleItem({
    product_id: "DSNREADY",
    quantity: 1,
    product_main_type: "ready",
    product_stock_info: { is_preferred_vendor: false },
    product_designer_id: "uidA",
    product_pickup_info: { status: "Ready to Pickup" },
  }),
  true,
  "designer-held ready is pickup eligible",
);
assertEqual(
  jobs.isPickupEligibleItem(warehouseItem),
  false,
  "warehouse ready is not pickup eligible",
);

const mixed = {
  payment_status: "CAPTURED",
  shipping_address: {
    address_line1: "Gulf Road",
    city: "Salmiya",
    shipping_name: "Customer",
    shipping_phone: "+96550000000",
    building: "12",
    block: "5",
    state: "Hawalli",
  },
  order_items: {
    cart_items: [warehouseItem, customItem],
  },
};

assertEqual(
  jobs.warehouseJobId("ORD1"),
  "ORD1-RM",
  "warehouse job id",
);
assertEqual(
  jobs.customJobId("ORD1", "uidA"),
  "ORD1-CM-uidA",
  "custom job id",
);

const warehouseJobs = jobs.warehouseJobsToEnqueue({
  orderId: "ORD1",
  order: mixed,
  reservationStatus: "reserved",
  existingJobs: [],
});
assertEqual(warehouseJobs.length, 1, "one warehouse job");
assertEqual(warehouseJobs[0].id, "ORD1-RM", "warehouse job uses -RM");
assertEqual(warehouseJobs[0].kind, jobs.KIND.WAREHOUSE, "warehouse kind");

assertEqual(
  jobs.warehouseJobsToEnqueue({
    orderId: "ORD1",
    order: mixed,
    reservationStatus: "stock_failed",
    existingJobs: [],
  }).length,
  0,
  "no warehouse job on stock_failed",
);

assertEqual(
  jobs.warehouseJobsToEnqueue({
    orderId: "ORD1",
    order: mixed,
    reservationStatus: "reserved",
    existingJobs: [{ id: "ORD1-RM", status: jobs.STATUS.REQUESTED }],
  }).length,
  0,
  "do not overwrite requested warehouse job",
);

assertEqual(
  jobs.customJobsToEnqueue({
    orderId: "ORD1",
    order: { ...mixed, payment_status: "Initialization" },
    existingJobs: [],
  }).length,
  0,
  "no custom job before capture",
);

const customJobs = jobs.customJobsToEnqueue({
  orderId: "ORD1",
  order: mixed,
  existingJobs: [],
});
assertEqual(customJobs.length, 1, "one custom job for designer A");
assertEqual(customJobs[0].id, "ORD1-CM-uidA", "custom job id includes designer");
assertEqual(customJobs[0].kind, jobs.KIND.CUSTOM, "custom kind");

const twoDesigners = {
  payment_status: "CAPTURED",
  order_items: {
    cart_items: [
      customItem,
      {
        ...customItem,
        product_id: "CUSTOM2",
        product_designer_id: "uidB",
      },
    ],
  },
};
const split = jobs.customJobsToEnqueue({
  orderId: "ORD1",
  order: twoDesigners,
  existingJobs: [],
});
assertEqual(split.length, 2, "two designers two jobs");
assertEqual(
  split.map((job) => job.designerUid).sort().join(","),
  "uidA,uidB",
  "jobs not mixed across designers",
);

assertEqual(
  jobs.customJobsToEnqueue({
    orderId: "ORD1",
    order: {
      payment_status: "CAPTURED",
      order_items: {
        cart_items: [
          customItem,
          {
            ...customItem,
            product_id: "CUSTOM1B",
          },
        ],
      },
    },
    existingJobs: [{ id: "ORD1-CM-uidA", status: jobs.STATUS.QUEUED }],
  }).length,
  0,
  "second item while queued does not create another job",
);

const afterRequested = jobs.customJobsToEnqueue({
  orderId: "ORD1",
  order: {
    payment_status: "CAPTURED",
    order_items: {
      cart_items: [
        {
          ...customItem,
          product_pickup_info: {
            status: "processing",
            delivery_tracking_id: "SV-OLD",
          },
        },
        {
          ...customItem,
          product_id: "CUSTOM1B",
        },
      ],
    },
  },
  existingJobs: [{ id: "ORD1-CM-uidA", status: jobs.STATUS.REQUESTED }],
});
assertEqual(afterRequested.length, 1, "new job after first already requested");
assertEqual(afterRequested[0].id, "ORD1-CM-uidA-2", "suffix for next pickup");

assertEqual(
  jobs.pickupPurposeForItem(customItem).pickupPurpose,
  "custom_made_fulfillment",
  "custom purpose",
);
assertEqual(
  jobs.pickupPurposeForItem({
    product_main_type: "ready",
    product_stock_info: { is_preferred_vendor: false },
  }).pickupPurpose,
  "designer_order_fulfillment",
  "designer-held ready purpose",
);

const address = jobs.customerAddressFromOrder(mixed);
assertEqual(address.ok, true, "complete address ok");
assertEqual(address.address.street, "Gulf Road", "street from address_line1");
assertEqual(address.address.building, "12", "building from dedicated field");
assertEqual(address.address.block, "5", "block from dedicated field");
assertEqual(address.address.governorate, "Hawalli", "governorate from state");
assertEqual(
  jobs.customerAddressFromOrder({
    shipping_address: { address_line_1: "Gulf Road", city: "Salmiya", shipping_name: "A", shipping_phone: "1" },
  }).ok,
  true,
  "address_line_1 underscore is accepted",
);
assertEqual(
  jobs.customerAddressFromOrder({ shipping_address: { city: "Salmiya" } }).ok,
  false,
  "incomplete address fails",
);

const payload = jobs.warehouseDeliveryPayload({
  orderId: "ORD1",
  order: mixed,
  inventoryByProduct: {
    AZYPRD1122: { sku: "AZY-DSN0001-DRESS-RED-M", designer_id: "DSN-KWT-0001" },
  },
});
assertEqual(payload.ok, true, "warehouse payload ok");
assertEqual(payload.body.client_order_id, "ORD1-RM", "client order id");
assertEqual(payload.body.designer_id, "DSN-KWT-0001", "uses inventory designer");
assertEqual(payload.body.items[0].sku, "AZY-DSN0001-DRESS-RED-M", "uses inventory sku");
assertEqual(payload.body.items[0].product_id, "AZYPRD1122", "uses product id");
assertEqual(
  payload.body.items[0].sku === warehouseItem.product_id,
  false,
  "sku is not firebase product id",
);

const uidPayload = jobs.warehouseDeliveryPayload({
  orderId: "ORD1",
  order: mixed,
  inventoryByProduct: {
    AZYPRD1122: { sku: "AZY-SKU", designer_id: "firebaseUidNotDsn" },
  },
});
assertEqual(
  uidPayload.body.designer_id,
  "DSN-KWT-0001",
  "firebase uid designer falls back",
);

assertEqual(
  jobs.canClaim({ status: jobs.STATUS.QUEUED }, Date.now(), 60000),
  true,
  "queued can claim",
);
assertEqual(
  jobs.canClaim({ status: jobs.STATUS.REQUESTED }, Date.now(), 60000),
  false,
  "requested cannot claim",
);
assertEqual(
  jobs.canClaim(
    { status: jobs.STATUS.PROCESSING, lease_until: Date.now() - 1000 },
    Date.now(),
    60000,
  ),
  true,
  "expired processing can claim",
);
assertEqual(
  jobs.canClaim(
    { status: jobs.STATUS.PROCESSING, lease_until: Date.now() + 60000 },
    Date.now(),
    60000,
  ),
  false,
  "leased processing cannot claim",
);

assertEqual(
  jobs.shouldSweep(
    { status: jobs.STATUS.FAILED, attempts: 1 },
    Date.now(),
    3,
  ),
  true,
  "failed under max attempts sweeps",
);
assertEqual(
  jobs.shouldSweep(
    { status: jobs.STATUS.FAILED, attempts: 3 },
    Date.now(),
    3,
  ),
  false,
  "failed at max attempts stops",
);

assertEqual(
  ids.shipmentTypeFromClientOrderId("ORD1-CM-uidA"),
  "custom",
  "CM with designer is custom",
);
assertEqual(ids.baseOrderId("ORD1-CM-uidA"), "ORD1", "base strips -CM-uid");
assertEqual(ids.baseOrderId("ORD1-CM"), "ORD1", "base strips trailing -CM");
assertEqual(ids.baseOrderId("ORD1-RM"), "ORD1", "base strips -RM");
assertEqual(
  ids.shipmentTypeFromClientOrderId("ORD1-RM-DSN-KWT-0001"),
  "ready",
  "RM with designer is ready",
);
assertEqual(
  ids.externalRequestId("ORD1-CM-uidA"),
  "PKP-ORD1-CM-uidA",
  "pickup external id",
);

const pickupItems = jobs.pickupItemsForDesigner(mixed, "uidA");
assertEqual(pickupItems.length, 1, "only designer A items");
assertEqual(pickupItems[0].product_id, "CUSTOM1", "custom product");

const became = jobs.itemBecameReadyToPickup(
  [{ ...customItem, product_pickup_info: { status: "" } }],
  customItem,
);
assertEqual(became, true, "transition to Ready to Pickup");
assertEqual(
  jobs.itemBecameReadyToPickup([customItem], customItem),
  false,
  "already ready is not a new transition",
);

assertEqual(
  jobs.shouldEnqueueCustomOnWrite(
    { payment_status: "Initialization", order_items: { cart_items: [customItem] } },
    { payment_status: "CAPTURED", order_items: { cart_items: [customItem] } },
  ),
  true,
  "enqueue custom when capture and already ready",
);
assertEqual(
  jobs.shouldEnqueueCustomOnWrite(
    { payment_status: "Initialization", order_items: { cart_items: [customItem] } },
    {
      payment_status: "Initialization",
      order_items: { cart_items: [customItem] },
    },
  ),
  false,
  "ready before pay does not enqueue",
);

assertEqual(
  ids.logisticsClientOrderId({ external_request_id: "PKP-ORD1-CM-uidA" }),
  "ORD1-CM-uidA",
  "strips PKP prefix",
);
assertEqual(
  ids.baseOrderId(
    ids.logisticsClientOrderId({ external_request_id: "PKP-ORD1-CM-uidA" }),
  ),
  "ORD1",
  "webhook maps pickup id to order",
);

console.log("store_valley_delivery_jobs.test.js ok");
