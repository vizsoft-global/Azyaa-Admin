import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? DashboardWidget() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? DashboardWidget() : LoginWidget(),
        ),
        FFRoute(
          name: CustomerDetailsWidget.routeName,
          path: CustomerDetailsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CustomerDetailsWidget(
            customer: params.getParam(
              'customer',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: UsersWidget.routeName,
          path: UsersWidget.routePath,
          builder: (context, params) => UsersWidget(),
        ),
        FFRoute(
          name: CreatorsWidget.routeName,
          path: CreatorsWidget.routePath,
          builder: (context, params) => CreatorsWidget(),
        ),
        FFRoute(
          name: DesignersWidget.routeName,
          path: DesignersWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DesignersWidget(),
        ),
        FFRoute(
          name: DesignerPendingWidget.routeName,
          path: DesignerPendingWidget.routePath,
          builder: (context, params) => DesignerPendingWidget(
            designer: params.getParam(
              'designer',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: CreatorPendingWidget.routeName,
          path: CreatorPendingWidget.routePath,
          builder: (context, params) => CreatorPendingWidget(
            creator: params.getParam(
              'creator',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: CreatorActiveWidget.routeName,
          path: CreatorActiveWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CreatorActiveWidget(
            creator: params.getParam(
              'creator',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: RegisterWidget.routeName,
          path: RegisterWidget.routePath,
          builder: (context, params) => RegisterWidget(),
        ),
        FFRoute(
          name: DesignerActiveWidget.routeName,
          path: DesignerActiveWidget.routePath,
          builder: (context, params) => DesignerActiveWidget(
            designer: params.getParam(
              'designer',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: DashboardWidget.routeName,
          path: DashboardWidget.routePath,
          requireAuth: true,
          builder: (context, params) => DashboardWidget(),
        ),
        FFRoute(
          name: ProductsWidget.routeName,
          path: ProductsWidget.routePath,
          builder: (context, params) => ProductsWidget(),
        ),
        FFRoute(
          name: ProductAddWidget.routeName,
          path: ProductAddWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProductAddWidget(),
        ),
        FFRoute(
          name: OrdersWidget.routeName,
          path: OrdersWidget.routePath,
          requireAuth: true,
          builder: (context, params) => OrdersWidget(),
        ),
        FFRoute(
          name: OrderDetailsWidget.routeName,
          path: OrderDetailsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => OrderDetailsWidget(
            orderRef: params.getParam(
              'orderRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['orders'],
            ),
          ),
        ),
        FFRoute(
          name: OrderShippingLabelWidget.routeName,
          path: OrderShippingLabelWidget.routePath,
          builder: (context, params) => OrderShippingLabelWidget(),
        ),
        FFRoute(
          name: CreateShippingLabelWidget.routeName,
          path: CreateShippingLabelWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CreateShippingLabelWidget(
            orderRef: params.getParam(
              'orderRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['orders'],
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            cartIndex: params.getParam(
              'cartIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: InventoryBackupWidget.routeName,
          path: InventoryBackupWidget.routePath,
          builder: (context, params) => InventoryBackupWidget(),
        ),
        FFRoute(
          name: MediaWidget.routeName,
          path: MediaWidget.routePath,
          builder: (context, params) => MediaWidget(),
        ),
        FFRoute(
          name: CustomerSupportListWidget.routeName,
          path: CustomerSupportListWidget.routePath,
          builder: (context, params) => CustomerSupportListWidget(),
        ),
        FFRoute(
          name: DiscountsWidget.routeName,
          path: DiscountsWidget.routePath,
          asyncParams: {
            'coupon': getDoc(['coupon'], CouponRecord.fromSnapshot),
          },
          builder: (context, params) => DiscountsWidget(
            coupon: params.getParam(
              'coupon',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DesignerRejectedWidget.routeName,
          path: DesignerRejectedWidget.routePath,
          builder: (context, params) => DesignerRejectedWidget(
            designer: params.getParam(
              'designer',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: CreatorRejectedWidget.routeName,
          path: CreatorRejectedWidget.routePath,
          builder: (context, params) => CreatorRejectedWidget(
            creator: params.getParam(
              'creator',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: CreateShippingDiscountsWidget.routeName,
          path: CreateShippingDiscountsWidget.routePath,
          builder: (context, params) => CreateShippingDiscountsWidget(),
        ),
        FFRoute(
          name: NewPromotionWidget.routeName,
          path: NewPromotionWidget.routePath,
          builder: (context, params) => NewPromotionWidget(),
        ),
        FFRoute(
          name: AnalyticsWidget.routeName,
          path: AnalyticsWidget.routePath,
          builder: (context, params) => AnalyticsWidget(),
        ),
        FFRoute(
          name: FinanceWidget.routeName,
          path: FinanceWidget.routePath,
          builder: (context, params) => FinanceWidget(),
        ),
        FFRoute(
          name: SettingsWidget.routeName,
          path: SettingsWidget.routePath,
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: ProductEditWidget.routeName,
          path: ProductEditWidget.routePath,
          builder: (context, params) => ProductEditWidget(
            product: params.getParam(
              'product',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['products'],
            ),
          ),
        ),
        FFRoute(
          name: CustomerWaiterListWidget.routeName,
          path: CustomerWaiterListWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CustomerWaiterListWidget(),
        ),
        FFRoute(
          name: RoleWidget.routeName,
          path: RoleWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RoleWidget(),
        ),
        FFRoute(
          name: Error404Widget.routeName,
          path: Error404Widget.routePath,
          builder: (context, params) => Error404Widget(),
        ),
        FFRoute(
          name: CategoryWidget.routeName,
          path: CategoryWidget.routePath,
          builder: (context, params) => CategoryWidget(),
        ),
        FFRoute(
          name: TagsWidget.routeName,
          path: TagsWidget.routePath,
          builder: (context, params) => TagsWidget(),
        ),
        FFRoute(
          name: AttributesWidget.routeName,
          path: AttributesWidget.routePath,
          builder: (context, params) => AttributesWidget(),
        ),
        FFRoute(
          name: TermsWidget.routeName,
          path: TermsWidget.routePath,
          builder: (context, params) => TermsWidget(
            attribute: params.getParam(
              'attribute',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['attributes'],
            ),
          ),
        ),
        FFRoute(
          name: TranslationWidget.routeName,
          path: TranslationWidget.routePath,
          asyncParams: {
            'product': getDoc(['products'], ProductsRecord.fromSnapshot),
            'category': getDoc(['category'], CategoryRecord.fromSnapshot),
            'tag': getDoc(['tags'], TagsRecord.fromSnapshot),
            'attribute': getDoc(['attributes'], AttributesRecord.fromSnapshot),
            'brand': getDoc(['brands'], BrandsRecord.fromSnapshot),
          },
          builder: (context, params) => TranslationWidget(
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            product: params.getParam(
              'product',
              ParamType.Document,
            ),
            category: params.getParam(
              'category',
              ParamType.Document,
            ),
            tag: params.getParam(
              'tag',
              ParamType.Document,
            ),
            attribute: params.getParam(
              'attribute',
              ParamType.Document,
            ),
            brand: params.getParam(
              'brand',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: RestockReturnsWidget.routeName,
          path: RestockReturnsWidget.routePath,
          builder: (context, params) => RestockReturnsWidget(),
        ),
        FFRoute(
          name: InventoryPMWidget.routeName,
          path: InventoryPMWidget.routePath,
          requireAuth: true,
          builder: (context, params) => InventoryPMWidget(),
        ),
        FFRoute(
          name: InventoryProductViewWidget.routeName,
          path: InventoryProductViewWidget.routePath,
          builder: (context, params) => InventoryProductViewWidget(
            inventoryReference: params.getParam(
              'inventoryReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['inventory'],
            ),
          ),
        ),
        FFRoute(
          name: AddInventoryEntryWidget.routeName,
          path: AddInventoryEntryWidget.routePath,
          builder: (context, params) => AddInventoryEntryWidget(),
        ),
        FFRoute(
          name: InventorySMWidget.routeName,
          path: InventorySMWidget.routePath,
          builder: (context, params) => InventorySMWidget(),
        ),
        FFRoute(
          name: SendNotificationWidget.routeName,
          path: SendNotificationWidget.routePath,
          builder: (context, params) => SendNotificationWidget(),
        ),
        FFRoute(
          name: RolePermissionNewWidget.routeName,
          path: RolePermissionNewWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RolePermissionNewWidget(
            role: params.getParam(
              'role',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['roles'],
            ),
          ),
        ),
        FFRoute(
          name: RolePermissionoldWidget.routeName,
          path: RolePermissionoldWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RolePermissionoldWidget(
            role: params.getParam(
              'role',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['roles'],
            ),
          ),
        ),
        FFRoute(
          name: DeliveryPartnerWidget.routeName,
          path: DeliveryPartnerWidget.routePath,
          builder: (context, params) => DeliveryPartnerWidget(),
        ),
        FFRoute(
          name: DeliveryPartnerActiveWidget.routeName,
          path: DeliveryPartnerActiveWidget.routePath,
          builder: (context, params) => DeliveryPartnerActiveWidget(
            designer: params.getParam(
              'designer',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: RefundWidget.routeName,
          path: RefundWidget.routePath,
          builder: (context, params) => RefundWidget(
            orderRef: params.getParam(
              'orderRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['orders'],
            ),
          ),
        ),
        FFRoute(
          name: CreateNewCouponWidget.routeName,
          path: CreateNewCouponWidget.routePath,
          builder: (context, params) => CreateNewCouponWidget(),
        ),
        FFRoute(
          name: DiscountWidget.routeName,
          path: DiscountWidget.routePath,
          builder: (context, params) => DiscountWidget(),
        ),
        FFRoute(
          name: LoyaltyProgramTiersWidget.routeName,
          path: LoyaltyProgramTiersWidget.routePath,
          builder: (context, params) => LoyaltyProgramTiersWidget(),
        ),
        FFRoute(
          name: HomeSettingWidget.routeName,
          path: HomeSettingWidget.routePath,
          builder: (context, params) => HomeSettingWidget(),
        ),
        FFRoute(
          name: TryOnWidget.routeName,
          path: TryOnWidget.routePath,
          builder: (context, params) => TryOnWidget(),
        ),
        FFRoute(
          name: ReturnOrdersWidget.routeName,
          path: ReturnOrdersWidget.routePath,
          builder: (context, params) => ReturnOrdersWidget(),
        ),
        FFRoute(
          name: CreatorPromotionsWidget.routeName,
          path: CreatorPromotionsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CreatorPromotionsWidget(),
        ),
        FFRoute(
          name: TranslationBannerWidget.routeName,
          path: TranslationBannerWidget.routePath,
          builder: (context, params) => TranslationBannerWidget(
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            settingHomeBanner: params.getParam(
              'settingHomeBanner',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['settings'],
            ),
            index: params.getParam(
              'index',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: InventoryShippingLabelWidget.routeName,
          path: InventoryShippingLabelWidget.routePath,
          builder: (context, params) => InventoryShippingLabelWidget(
            invmovemntRef: params.getParam(
              'invmovemntRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['inventorymovementlog'],
            ),
            type: params.getParam(
              'type',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ProductSettingsWidget.routeName,
          path: ProductSettingsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProductSettingsWidget(),
        ),
        FFRoute(
          name: CustomersWidget.routeName,
          path: CustomersWidget.routePath,
          builder: (context, params) => CustomersWidget(),
        ),
        FFRoute(
          name: ShippingOrdersWidget.routeName,
          path: ShippingOrdersWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ShippingOrdersWidget(),
        ),
        FFRoute(
          name: TranslationCreatorBannerWidget.routeName,
          path: TranslationCreatorBannerWidget.routePath,
          builder: (context, params) => TranslationCreatorBannerWidget(
            type: params.getParam(
              'type',
              ParamType.String,
            ),
            settingCreatorBanner: params.getParam(
              'settingCreatorBanner',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['settings'],
            ),
            index: params.getParam(
              'index',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: FilterordersWidget.routeName,
          path: FilterordersWidget.routePath,
          requireAuth: true,
          builder: (context, params) => FilterordersWidget(),
        ),
        FFRoute(
          name: FilterordersNopageWidget.routeName,
          path: FilterordersNopageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => FilterordersNopageWidget(),
        ),
        FFRoute(
          name: S1PayoutsWidget.routeName,
          path: S1PayoutsWidget.routePath,
          builder: (context, params) => S1PayoutsWidget(),
        ),
        FFRoute(
          name: S2CreatePayoutWidget.routeName,
          path: S2CreatePayoutWidget.routePath,
          builder: (context, params) => S2CreatePayoutWidget(),
        ),
        FFRoute(
          name: S3DetailsWidget.routeName,
          path: S3DetailsWidget.routePath,
          builder: (context, params) => S3DetailsWidget(),
        ),
        FFRoute(
          name: SalesHistoryWidget.routeName,
          path: SalesHistoryWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SalesHistoryWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/azyaa-signin';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/Azyaa-logoblack.jpg',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
