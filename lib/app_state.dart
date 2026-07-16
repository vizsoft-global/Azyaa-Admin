import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _menuExpandValue = prefs.getInt('ff_menuExpandValue') ?? _menuExpandValue;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_adminFlow')) {
        try {
          final serializedData = prefs.getString('ff_adminFlow') ?? '{}';
          _adminFlow =
              AdminFlowStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _currentUserPermission =
          prefs.getStringList('ff_currentUserPermission') ??
              _currentUserPermission;
    });
    _safeInit(() {
      _currentUserRoleKey =
          prefs.getString('ff_currentUserRoleKey') ?? _currentUserRoleKey;
    });
    _safeInit(() {
      _customerExpand = prefs.getString('ff_customerExpand') ?? _customerExpand;
    });
    _safeInit(() {
      _standardSizechart = prefs
              .getStringList('ff_standardSizechart')
              ?.map((x) {
                try {
                  return DesignerSizeChartsStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _standardSizechart;
    });
    _safeInit(() {
      _currentUserSettingWidget = prefs
              .getStringList('ff_currentUserSettingWidget')
              ?.map((x) {
                try {
                  return MenuSettingsPageWidgetListStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _currentUserSettingWidget;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_theme')) {
        try {
          final serializedData = prefs.getString('ff_theme') ?? '{}';
          _theme =
              ThemeInfoStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _dummy = false;
  bool get dummy => _dummy;
  set dummy(bool value) {
    _dummy = value;
  }

  int _menuExpandValue = 225;
  int get menuExpandValue => _menuExpandValue;
  set menuExpandValue(int value) {
    _menuExpandValue = value;
    prefs.setInt('ff_menuExpandValue', value);
  }

  AdminFlowStruct _adminFlow = AdminFlowStruct();
  AdminFlowStruct get adminFlow => _adminFlow;
  set adminFlow(AdminFlowStruct value) {
    _adminFlow = value;
    prefs.setString('ff_adminFlow', value.serialize());
  }

  void updateAdminFlowStruct(Function(AdminFlowStruct) updateFn) {
    updateFn(_adminFlow);
    prefs.setString('ff_adminFlow', _adminFlow.serialize());
  }

  String _partnerMenu = '';
  String get partnerMenu => _partnerMenu;
  set partnerMenu(String value) {
    _partnerMenu = value;
  }

  List<String> _currentUserPermission = [];
  List<String> get currentUserPermission => _currentUserPermission;
  set currentUserPermission(List<String> value) {
    _currentUserPermission = value;
    prefs.setStringList('ff_currentUserPermission', value);
  }

  void addToCurrentUserPermission(String value) {
    currentUserPermission.add(value);
    prefs.setStringList('ff_currentUserPermission', _currentUserPermission);
  }

  void removeFromCurrentUserPermission(String value) {
    currentUserPermission.remove(value);
    prefs.setStringList('ff_currentUserPermission', _currentUserPermission);
  }

  void removeAtIndexFromCurrentUserPermission(int index) {
    currentUserPermission.removeAt(index);
    prefs.setStringList('ff_currentUserPermission', _currentUserPermission);
  }

  void updateCurrentUserPermissionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    currentUserPermission[index] = updateFn(_currentUserPermission[index]);
    prefs.setStringList('ff_currentUserPermission', _currentUserPermission);
  }

  void insertAtIndexInCurrentUserPermission(int index, String value) {
    currentUserPermission.insert(index, value);
    prefs.setStringList('ff_currentUserPermission', _currentUserPermission);
  }

  String _currentUserRoleKey = '';
  String get currentUserRoleKey => _currentUserRoleKey;
  set currentUserRoleKey(String value) {
    _currentUserRoleKey = value;
    prefs.setString('ff_currentUserRoleKey', value);
  }

  String _customerExpand = '';
  String get customerExpand => _customerExpand;
  set customerExpand(String value) {
    _customerExpand = value;
    prefs.setString('ff_customerExpand', value);
  }

  String _appLanguage = '';
  String get appLanguage => _appLanguage;
  set appLanguage(String value) {
    _appLanguage = value;
  }

  AdminPromotionFlowStruct _prmotionflow = AdminPromotionFlowStruct();
  AdminPromotionFlowStruct get prmotionflow => _prmotionflow;
  set prmotionflow(AdminPromotionFlowStruct value) {
    _prmotionflow = value;
  }

  void updatePrmotionflowStruct(Function(AdminPromotionFlowStruct) updateFn) {
    updateFn(_prmotionflow);
  }

  int _totalstockinHand = 0;
  int get totalstockinHand => _totalstockinHand;
  set totalstockinHand(int value) {
    _totalstockinHand = value;
  }

  InvitemListStruct _item = InvitemListStruct.fromSerializableMap(jsonDecode(
      '{\"quantity\":\"1\",\"name\":\" \",\"weight\":\"1.0\",\"skuNumber\":\" \",\"description\":\" \"}'));
  InvitemListStruct get item => _item;
  set item(InvitemListStruct value) {
    _item = value;
  }

  void updateItemStruct(Function(InvitemListStruct) updateFn) {
    updateFn(_item);
  }

  List<String> _brandIds = [];
  List<String> get brandIds => _brandIds;
  set brandIds(List<String> value) {
    _brandIds = value;
  }

  void addToBrandIds(String value) {
    brandIds.add(value);
  }

  void removeFromBrandIds(String value) {
    brandIds.remove(value);
  }

  void removeAtIndexFromBrandIds(int index) {
    brandIds.removeAt(index);
  }

  void updateBrandIdsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    brandIds[index] = updateFn(_brandIds[index]);
  }

  void insertAtIndexInBrandIds(int index, String value) {
    brandIds.insert(index, value);
  }

  DeliveryFlowStruct _deliveryflow = DeliveryFlowStruct();
  DeliveryFlowStruct get deliveryflow => _deliveryflow;
  set deliveryflow(DeliveryFlowStruct value) {
    _deliveryflow = value;
  }

  void updateDeliveryflowStruct(Function(DeliveryFlowStruct) updateFn) {
    updateFn(_deliveryflow);
  }

  List<DesignerSizeChartsStruct> _standardSizechart = [
    DesignerSizeChartsStruct.fromSerializableMap(jsonDecode(
        '{\"chart_id\":\"0\",\"chart_name\":\"sizeChart-UK\",\"chart_type\":\"UK\",\"chart_metrics\":\"Inch\",\"chart_image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/32gimwa9lxhe/Frame_2087324874_(1).jpg\"}')),
    DesignerSizeChartsStruct.fromSerializableMap(jsonDecode(
        '{\"chart_id\":\"1\",\"chart_name\":\"sizeChart-US\",\"chart_type\":\"US\",\"chart_metrics\":\"Inch\",\"chart_image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/azyaa-admin-panel-vjmihj/assets/4s6oowix0rww/Frame_2087324875.jpg\"}'))
  ];
  List<DesignerSizeChartsStruct> get standardSizechart => _standardSizechart;
  set standardSizechart(List<DesignerSizeChartsStruct> value) {
    _standardSizechart = value;
    prefs.setStringList(
        'ff_standardSizechart', value.map((x) => x.serialize()).toList());
  }

  void addToStandardSizechart(DesignerSizeChartsStruct value) {
    standardSizechart.add(value);
    prefs.setStringList('ff_standardSizechart',
        _standardSizechart.map((x) => x.serialize()).toList());
  }

  void removeFromStandardSizechart(DesignerSizeChartsStruct value) {
    standardSizechart.remove(value);
    prefs.setStringList('ff_standardSizechart',
        _standardSizechart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromStandardSizechart(int index) {
    standardSizechart.removeAt(index);
    prefs.setStringList('ff_standardSizechart',
        _standardSizechart.map((x) => x.serialize()).toList());
  }

  void updateStandardSizechartAtIndex(
    int index,
    DesignerSizeChartsStruct Function(DesignerSizeChartsStruct) updateFn,
  ) {
    standardSizechart[index] = updateFn(_standardSizechart[index]);
    prefs.setStringList('ff_standardSizechart',
        _standardSizechart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInStandardSizechart(
      int index, DesignerSizeChartsStruct value) {
    standardSizechart.insert(index, value);
    prefs.setStringList('ff_standardSizechart',
        _standardSizechart.map((x) => x.serialize()).toList());
  }

  List<MenuSettingsPageWidgetListStruct> _currentUserSettingWidget = [];
  List<MenuSettingsPageWidgetListStruct> get currentUserSettingWidget =>
      _currentUserSettingWidget;
  set currentUserSettingWidget(List<MenuSettingsPageWidgetListStruct> value) {
    _currentUserSettingWidget = value;
    prefs.setStringList('ff_currentUserSettingWidget',
        value.map((x) => x.serialize()).toList());
  }

  void addToCurrentUserSettingWidget(MenuSettingsPageWidgetListStruct value) {
    currentUserSettingWidget.add(value);
    prefs.setStringList('ff_currentUserSettingWidget',
        _currentUserSettingWidget.map((x) => x.serialize()).toList());
  }

  void removeFromCurrentUserSettingWidget(
      MenuSettingsPageWidgetListStruct value) {
    currentUserSettingWidget.remove(value);
    prefs.setStringList('ff_currentUserSettingWidget',
        _currentUserSettingWidget.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCurrentUserSettingWidget(int index) {
    currentUserSettingWidget.removeAt(index);
    prefs.setStringList('ff_currentUserSettingWidget',
        _currentUserSettingWidget.map((x) => x.serialize()).toList());
  }

  void updateCurrentUserSettingWidgetAtIndex(
    int index,
    MenuSettingsPageWidgetListStruct Function(MenuSettingsPageWidgetListStruct)
        updateFn,
  ) {
    currentUserSettingWidget[index] =
        updateFn(_currentUserSettingWidget[index]);
    prefs.setStringList('ff_currentUserSettingWidget',
        _currentUserSettingWidget.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCurrentUserSettingWidget(
      int index, MenuSettingsPageWidgetListStruct value) {
    currentUserSettingWidget.insert(index, value);
    prefs.setStringList('ff_currentUserSettingWidget',
        _currentUserSettingWidget.map((x) => x.serialize()).toList());
  }

  List<UserCartItemsStruct> _orderCartItems = [];
  List<UserCartItemsStruct> get orderCartItems => _orderCartItems;
  set orderCartItems(List<UserCartItemsStruct> value) {
    _orderCartItems = value;
  }

  void addToOrderCartItems(UserCartItemsStruct value) {
    orderCartItems.add(value);
  }

  void removeFromOrderCartItems(UserCartItemsStruct value) {
    orderCartItems.remove(value);
  }

  void removeAtIndexFromOrderCartItems(int index) {
    orderCartItems.removeAt(index);
  }

  void updateOrderCartItemsAtIndex(
    int index,
    UserCartItemsStruct Function(UserCartItemsStruct) updateFn,
  ) {
    orderCartItems[index] = updateFn(_orderCartItems[index]);
  }

  void insertAtIndexInOrderCartItems(int index, UserCartItemsStruct value) {
    orderCartItems.insert(index, value);
  }

  ThemeInfoStruct _theme = ThemeInfoStruct.fromSerializableMap(
      jsonDecode('{\"theme_main\":\"{\\\"theme_id\\\":\\\"0\\\"}\"}'));
  ThemeInfoStruct get theme => _theme;
  set theme(ThemeInfoStruct value) {
    _theme = value;
    prefs.setString('ff_theme', value.serialize());
  }

  void updateThemeStruct(Function(ThemeInfoStruct) updateFn) {
    updateFn(_theme);
    prefs.setString('ff_theme', _theme.serialize());
  }

  List<InvitemListStruct> _itemsList = [];
  List<InvitemListStruct> get itemsList => _itemsList;
  set itemsList(List<InvitemListStruct> value) {
    _itemsList = value;
  }

  void addToItemsList(InvitemListStruct value) {
    itemsList.add(value);
  }

  void removeFromItemsList(InvitemListStruct value) {
    itemsList.remove(value);
  }

  void removeAtIndexFromItemsList(int index) {
    itemsList.removeAt(index);
  }

  void updateItemsListAtIndex(
    int index,
    InvitemListStruct Function(InvitemListStruct) updateFn,
  ) {
    itemsList[index] = updateFn(_itemsList[index]);
  }

  void insertAtIndexInItemsList(int index, InvitemListStruct value) {
    itemsList.insert(index, value);
  }

  List<DeliveryInfoStruct> _orderDeliveryInfoList = [];
  List<DeliveryInfoStruct> get orderDeliveryInfoList => _orderDeliveryInfoList;
  set orderDeliveryInfoList(List<DeliveryInfoStruct> value) {
    _orderDeliveryInfoList = value;
  }

  void addToOrderDeliveryInfoList(DeliveryInfoStruct value) {
    orderDeliveryInfoList.add(value);
  }

  void removeFromOrderDeliveryInfoList(DeliveryInfoStruct value) {
    orderDeliveryInfoList.remove(value);
  }

  void removeAtIndexFromOrderDeliveryInfoList(int index) {
    orderDeliveryInfoList.removeAt(index);
  }

  void updateOrderDeliveryInfoListAtIndex(
    int index,
    DeliveryInfoStruct Function(DeliveryInfoStruct) updateFn,
  ) {
    orderDeliveryInfoList[index] = updateFn(_orderDeliveryInfoList[index]);
  }

  void insertAtIndexInOrderDeliveryInfoList(
      int index, DeliveryInfoStruct value) {
    orderDeliveryInfoList.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
