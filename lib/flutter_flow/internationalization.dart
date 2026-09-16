import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Customer-details
  {
    'xl3khts7': {
      'en': 'Notify',
      'ar': 'اشعار ',
    },
    'd1oksc8b': {
      'en': 'Multiple Notifications',
      'ar': 'اشعارات متعددة',
    },
    'muo89q20': {
      'en': 'Export',
      'ar': 'تصدير',
    },
    '2d3y3grt': {
      'en': 'More Actions',
      'ar': 'المزيد من الاجراءات',
    },
    'twggidhw': {
      'en': 'C',
      'ar': '',
    },
    'wvve7om5': {
      'en': 'More Actions',
      'ar': 'المزيد من الاجراءات',
    },
    '3odri5d8': {
      'en': 'Wallet Balance',
      'ar': 'رصيد المحفظة',
    },
    'iehv17tq': {
      'en': '0 KD',
      'ar': '0 KD',
    },
    '2vjo3qm9': {
      'en': 'Membership Status',
      'ar': 'حالة العضوية',
    },
    'r0ldrjqa': {
      'en': '250',
      'ar': '',
    },
    'dgdlp1v9': {
      'en': 'Total Orders',
      'ar': 'اجمالي الطلبات',
    },
    'c2mjqnb5': {
      'en': 'Total Expenses',
      'ar': 'اجمالي المصروفات',
    },
    'f82u8xet': {
      'en': 'Loyalty Points',
      'ar': 'نقاط الولاء',
    },
    '4ek1t2kw': {
      'en': 'Personal Information',
      'ar': 'البيانات الشخصية',
    },
    'odafd4fy': {
      'en': 'Email',
      'ar': 'البريد الالكتروني',
    },
    'mtw7v3jg': {
      'en': 'Phone No',
      'ar': 'رقم الجوال ',
    },
    'vhm1pktg': {
      'en': 'Account Registration Date',
      'ar': 'تاريخ تسجيل الحساب',
    },
    'i7wxq5gq': {
      'en': 'Primary Address',
      'ar': 'العنوان الرئيسي',
    },
    'afth1b9m': {
      'en': 'kuwait',
      'ar': '',
    },
    '7iioq08m': {
      'en': 'Alternative Phone No',
      'ar': 'الرقم البديل',
    },
    '1tytn7xt': {
      'en': 'Alternative Email.',
      'ar': 'البريد الالكتروني البديل',
    },
    'i83goxnc': {
      'en': 'Order & Purchase History',
      'ar': 'سجل الطلبات والمشتريات',
    },
    't2h4xpx1': {
      'en': 'No. Cart item',
      'ar': 'عدد عناصر السلة',
    },
    'mukzu3hl': {
      'en': 'Product ID',
      'ar': 'معرف المنتج',
    },
    '3sfc0rtb': {
      'en': 'Order Date',
      'ar': 'تاريخ الطلب',
    },
    'sbz8bd79': {
      'en': 'Total Amount',
      'ar': 'المبلغ الإجمالي',
    },
    'qxakvzwt': {
      'en': 'Payment Method',
      'ar': 'طريقة الدفع',
    },
    'vqno2icd': {
      'en': 'Payment Status',
      'ar': 'حالة الدفع',
    },
    'qlq4ofq8': {
      'en': 'Actions',
      'ar': 'خيارات',
    },
    '06k2j8sf': {
      'en': 'View Details',
      'ar': 'عرض التفاصيل',
    },
    'u7uvppmx': {
      'en': 'You haven’t placed any orders yet',
      'ar': 'لم تقم بتقديم أي طلبات حتى الآن',
    },
    'm6gab2dt': {
      'en': ' when you do, they’ll show up here!',
      'ar': 'عندما تفعل ذلك، سيظهرون هنا!',
    },
    'm9pz52aq': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Users
  {
    '4fdhgoml': {
      'en': 'Users',
      'ar': 'المستخدمون',
    },
    'dkctwo5m': {
      'en': 'Export',
      'ar': 'تصدير',
    },
    'zmilao9q': {
      'en': 'More Actions',
      'ar': 'خيارات إضافية',
    },
    'kjt18s54': {
      'en': 'Search...',
      'ar': 'بحث',
    },
    'n465kqd2': {
      'en': 'More Actions',
      'ar': 'خيارات إضافية',
    },
    '68nd1h5g': {
      'en': 'New Customers This Month',
      'ar': 'عملاء جدد هذا الشهر',
    },
    'w2rpspw7': {
      'en': 'Active Customers',
      'ar': 'العملاء النشطين',
    },
    'j0rns2at': {
      'en': 'Deactive Customers',
      'ar': 'العملاء غير النشطين',
    },
    'u1ejwn3o': {
      'en': '250',
      'ar': '',
    },
    'b2d74rhl': {
      'en': 'Total Customer',
      'ar': 'اجمالي العملاء',
    },
    '27o80i4j': {
      'en': 'All Users',
      'ar': 'جميع المستخدمين',
    },
    '2l4lcri3': {
      'en': 'Auto-Approval',
      'ar': 'الموافقة التلقائية',
    },
    'g5kzay95': {
      'en': 'Search...',
      'ar': 'بحث...',
    },
    'd9lynjcu': {
      'en': ' Customer ID',
      'ar': 'معرف العميل',
    },
    '4395elji': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    'w0hs7d1p': {
      'en': 'Email',
      'ar': 'البريد الالكتروني',
    },
    'gg9ur1cq': {
      'en': 'Phone',
      'ar': 'الهاتف',
    },
    'g93louv9': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'xj72utoe': {
      'en': 'Actions',
      'ar': 'الخيارات',
    },
    'x8gbj0ij': {
      'en': 'View Details',
      'ar': 'عرض التفاصيل',
    },
    'duz8w319': {
      'en': 'Your account looks neat and fresh.',
      'ar': 'حسابك يبدو أنيقا وجديدا',
    },
    '1xplf1t9': {
      'en': 'Everything you need is right at your fingertips.',
      'ar': 'كل ما تحتاجه في متناولك',
    },
    '9wcvcdfy': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Creators
  {
    'axqbkjzv': {
      'en': 'Creators',
      'ar': 'المبدع',
    },
    'cq9uhb65': {
      'en': 'Promotions',
      'ar': 'العروض الترويجية',
    },
    'qyjuy7dl': {
      'en': 'Add Creator',
      'ar': 'إضافة مبدع',
    },
    '609uht8p': {
      'en': 'More Actions',
      'ar': 'خيارات إضافية ',
    },
    'uokvmj36': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'sxcl7kl2': {
      'en': 'More Actions',
      'ar': 'خيارات إضافية ',
    },
    'wkmeocjc': {
      'en': 'Import',
      'ar': 'استيرد',
    },
    '5f1nzi8m': {
      'en': 'Export',
      'ar': 'تصدير',
    },
    'gfzd6qz5': {
      'en': 'Creators',
      'ar': 'المبدعون',
    },
    'ld30kob3': {
      'en': 'Promotions',
      'ar': 'العروض الترويجية',
    },
    'e8r92b4t': {
      'en': 'Creators',
      'ar': 'المبدعون',
    },
    '9flj83kc': {
      'en': 'Pending Requests',
      'ar': 'الطلبات المعلقة',
    },
    'vdet5b42': {
      'en': 'Active Creators',
      'ar': 'المبدعون النشطون',
    },
    'wf3w59o4': {
      'en': 'Rejected Creators',
      'ar': 'المبدعون المرفوضون',
    },
    'thtvcu0m': {
      'en': 'Archived Creators',
      'ar': 'المبدعون المؤرشفون',
    },
    'nkrool8d': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'avdyr267': {
      'en': 'Active',
      'ar': 'نشط',
    },
    'wsjumooc': {
      'en': 'Rejected',
      'ar': 'مرفوض',
    },
    'v6dq2j7l': {
      'en': 'Archived',
      'ar': 'مؤرشفة',
    },
    '9k424gwi': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'xconuzej': {
      'en': 'Request ID',
      'ar': 'معرف الطلب',
    },
    '4rp4aiyn': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'hinr1p5h': {
      'en': 'Status',
      'ar': 'حالة',
    },
    '1chvv3kv': {
      'en': 'Portfolio',
      'ar': 'مَلَفّ',
    },
    'mlsc0n4k': {
      'en': 'Category',
      'ar': 'فئة',
    },
    '2qwc82pp': {
      'en': '-',
      'ar': '',
    },
    'yei2er9y': {
      'en': 'Action',
      'ar': 'اجراء',
    },
    'gh2viny2': {
      'en': 'View Details',
      'ar': 'عرض التفاصيل',
    },
    'vwrjqa9r': {
      'en': 'No creators shining in this space yet!',
      'ar': 'لا يوجد لاعبون متألقون في هذا المجال حتي الان',
    },
    'f5k3m7ab': {
      'en': 'Keep an eye out—your next rising star could appear here soon!',
      'ar': 'ترقبوا قد يظهر نجمك الصاعد القادم هنا قريبا ',
    },
    'ns1l5k0o': {
      'en': 'Reject',
      'ar': 'رفض',
    },
    'bu3g7iw0': {
      'en': 'Approve',
      'ar': 'الموافقة ',
    },
    'f1cmkmxj': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Designers
  {
    'zvvtom4z': {
      'en': 'Designers',
      'ar': '',
    },
    'y1qz1msp': {
      'en': 'Pending Designer Requests',
      'ar': 'طلبات المصمم المعلقة',
    },
    'wrj8wuc3': {
      'en': 'Active Designer',
      'ar': 'مصمم نشط',
    },
    '3u8tog8l': {
      'en': 'Rejected Designers',
      'ar': 'المصممون المرفوضون',
    },
    'z86yx5mj': {
      'en': 'Archived Designers',
      'ar': 'المصممون المؤرشفون',
    },
    'v0qocs7n': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'gdzh0rk4': {
      'en': 'Active',
      'ar': 'نشيط',
    },
    '9vniovc9': {
      'en': 'Rejected',
      'ar': 'مرفوض',
    },
    '4lsdn2mu': {
      'en': 'Archived',
      'ar': 'مؤرشف',
    },
    '0nez6oox': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'scad3t3v': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'l58fhrr8': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'a78j00mb': {
      'en': ' ',
      'ar': '',
    },
    '2i6vylg6': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    'uh521gl4': {
      'en': 'Location',
      'ar': 'الموقع',
    },
    'jrta1o0r': {
      'en': 'Portfolio',
      'ar': 'الملف الشخصي',
    },
    'somr2yfu': {
      'en': 'Category',
      'ar': 'الفئة',
    },
    'iyd67mr9': {
      'en': 'Experience',
      'ar': 'الخبرة',
    },
    'u8plstyv': {
      'en': 'Years',
      'ar': 'أعوام',
    },
    '9mpgn3j9': {
      'en': 'KNET',
      'ar': 'كينت',
    },
    'phf018yw': {
      'en': 'Linked Designs',
      'ar': 'التصاميم المرتبطة',
    },
    'ohj5rgkd': {
      'en': 'Action',
      'ar': 'اجراء',
    },
    '7y9ep1la': {
      'en': 'View details',
      'ar': 'عرض التفاصيل',
    },
    '8whmjwpf': {
      'en': 'No data with the applied filters',
      'ar': 'لاتوجد بيانات حسب الفلاتر الحالية',
    },
    'aewebx36': {
      'en': 'Try changing the filters or search terms for this view.',
      'ar': 'حاول تغيير الفلاترأو مصطلحات البحث لهذا العرض ',
    },
    'd9sfr51i': {
      'en': ' ',
      'ar': '',
    },
    '0jednatv': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'e6ptu77y': {
      'en': 'Location',
      'ar': 'الموقع',
    },
    'szbrot8a': {
      'en': 'Portfolio',
      'ar': 'الملف الشخصي',
    },
    'o1hsfkp9': {
      'en': 'Category',
      'ar': 'الفئة',
    },
    'xozl9rzx': {
      'en': 'Experience',
      'ar': 'الخبرة',
    },
    '1fvz3fjd': {
      'en': 'Years',
      'ar': 'أعوام',
    },
    't7k32o47': {
      'en': 'KNET',
      'ar': 'كينت',
    },
    'kkstmn63': {
      'en': 'Linked Designs',
      'ar': 'التصاميم المرتبطة',
    },
    'yqml9s6s': {
      'en': 'Action',
      'ar': 'اجراء',
    },
    '8349oj3b': {
      'en': 'View details',
      'ar': 'عرض التفاصيل',
    },
    'yrqm5wwx': {
      'en': '2 Desingers selected',
      'ar': 'تم اختيار 2 مصممين',
    },
    'd0gutn7t': {
      'en': 'Reject',
      'ar': 'رفض',
    },
    '2cpcvbt2': {
      'en': 'Approve',
      'ar': 'الموافقة',
    },
    '1q2llt8n': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Designer-Pending
  {
    'mvcidtte': {
      'en': 'Location / City',
      'ar': 'الموقع \\المدينة',
    },
    '3semeryu': {
      'en': 'Phone No',
      'ar': 'رقم الجوال ',
    },
    '53rzoud1': {
      'en': 'Approve',
      'ar': 'مواففقة',
    },
    'vlvdltyg': {
      'en': 'Reject',
      'ar': 'رفض',
    },
    'vpcfc6xv': {
      'en': 'Location / City',
      'ar': 'الموقع \\المدينة',
    },
    'wu6ylkm1': {
      'en': 'Phone No',
      'ar': 'رقم الجوال ',
    },
    'i5ktt8bq': {
      'en': 'Approve',
      'ar': 'مواففقة',
    },
    'wf3kmhem': {
      'en': 'Reject',
      'ar': 'رفض',
    },
    'bkfr19nk': {
      'en': 'Personal Information',
      'ar': 'البيانات الشخصية',
    },
    'i94yum04': {
      'en': 'Experience',
      'ar': 'الخبرة',
    },
    'lh3odiay': {
      'en': 'Email',
      'ar': 'البريد الالكتروني',
    },
    'p0xc5dk6': {
      'en': 'Preferred Styles',
      'ar': 'الانماط المفضلة',
    },
    'h39h8f67': {
      'en': 'Availability for Custom Orders',
      'ar': 'توافر الطلبات المخصصة',
    },
    '7vbnknwk': {
      'en': 'Alternative Phone',
      'ar': 'رقم الهاتف البديل',
    },
    '9bj9j9ka': {
      'en': 'Alternative Email',
      'ar': 'البريد الالكتروني البديل',
    },
    'ki7f8hxi': {
      'en': 'Production Capacity',
      'ar': 'القدرة الإنتاجية ',
    },
    'aoug7lpa': {
      'en': 'Portfolio',
      'ar': 'الملف الشخصي',
    },
    '1ph5wznr': {
      'en': 'Open for Events/Collaborations',
      'ar': 'مفتوح للأحداث/التعاون',
    },
    'cz2v8gsc': {
      'en': 'References / Testimonials',
      'ar': 'المراجع / الشهادات',
    },
    'vtxgcxm5': {
      'en': 'Professional Insights',
      'ar': 'رؤى مهنية',
    },
    'wlebv4vo': {
      'en': 'Portfolio / Work Samples / Additional Certifications',
      'ar': 'المحفظة / نماذج الأعمال / الشهادات الإضافية',
    },
    'xc2qyi04': {
      'en': 'Images ',
      'ar': 'الصور',
    },
    'vlsg2diu': {
      'en': 'IMG',
      'ar': 'الصور الشخصية',
    },
    'gwfdxynw': {
      'en': 'PDF',
      'ar': 'ملف',
    },
    'gt5i4kn6': {
      'en': 'PDF',
      'ar': 'ملف',
    },
    'magip3lu': {
      'en': 'Identity Verification',
      'ar': 'التحقق من الهوية',
    },
    '6rulcykr': {
      'en': 'IMG',
      'ar': 'الصور الشخصية',
    },
    '9t83q9dv': {
      'en': 'IMG',
      'ar': 'الصور الشخصية',
    },
    'k89o0ffo': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Login
  {
    '77kugnq5': {
      'en': 'Welcome Back, Admin',
      'ar': 'مرحباً بك مجدداً، أيها المدير',
    },
    'el5k2ydb': {
      'en':
          'Access your Azyaa dashboard to manage designers, orders, payouts & more.',
      'ar':
          'يمكنك الوصول إلى لوحة معلومات Azyaa الخاصة بك لإدارة المصممين والطلبات والمدفوعات والمزيد.',
    },
    'zxrgmff9': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    '9nsqyp0c': {
      'en': '',
      'ar': '',
    },
    'bu841taz': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'vmi9xeiu': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '48w91i9z': {
      'en': '',
      'ar': '',
    },
    'b4tjvi2r': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'vl413lyw': {
      'en': 'Remember for 30 days',
      'ar': 'تذكر لمدة 30 يوما ',
    },
    'wzrils8f': {
      'en': 'Forgot your password?',
      'ar': 'نسيت كلمة السر؟',
    },
    'we3rvn9d': {
      'en': 'Sign in',
      'ar': 'تسجيل الدخول',
    },
    '59y8tpe9': {
      'en': 'Need login help? ',
      'ar': 'هل تحتاج إلى مساعدة في تسجيل الدخول؟',
    },
    '683vop5p': {
      'en': 'Contact the Dev Team',
      'ar': 'اتصل بفريق التطوير',
    },
    'ugc671t2': {
      'en': '© Azyaa | Built with ',
      'ar': 'جميع الحقوق محفوظة  ©',
    },
    'tlnng6il': {
      'en': '❤︎ ',
      'ar': '',
    },
    '9ovm9erw': {
      'en': 'by ',
      'ar': 'عن طريق',
    },
    'ngh4nc3p': {
      'en': 'websiteK',
      'ar': 'موقع ويب k',
    },
    'gk5eta1e': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب ',
    },
    'uciyy617': {
      'en': 'Invalid Mail Address',
      'ar': 'عنوان بريد غير صالح',
    },
    't3ci6ut3': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة',
    },
    'valeie8p': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب ',
    },
    'jxay3d02': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة',
    },
    '8gia03zz': {
      'en': '\"Feel the luxury, own the moment.\"',
      'ar': 'اشعر بالفخامة وامتلك اللحظة ',
    },
    'bw82cx0g': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Creator-Pending
  {
    'reqv1tt3': {
      'en': 'Experince in Content Creation',
      'ar': 'خبرة في انشاء المحتوي',
    },
    'jn6jrfzo': {
      'en': 'Date Applied',
      'ar': 'تاريخ التقديم',
    },
    '29vlz91d': {
      'en': 'Approve',
      'ar': 'مواففقة',
    },
    'loblsge9': {
      'en': 'Reject',
      'ar': 'رفض',
    },
    'uhguite6': {
      'en': 'Personal Information',
      'ar': 'معلومات شخصية',
    },
    'er991g4m': {
      'en': 'Email',
      'ar': 'البريد الالكتروني',
    },
    '91gisy55': {
      'en': 'Phone Number',
      'ar': 'رقم الهاتف',
    },
    'e7dpekus': {
      'en': 'Preferred Niche',
      'ar': 'المجال المفضلالمجال المفضل',
    },
    'ahwv6xp0': {
      'en': 'Experience ',
      'ar': 'الخبرةالخبرة',
    },
    's6qmvbeh': {
      'en': 'Portfolio',
      'ar': 'ملف الأعمال',
    },
    '1fbjnq9r': {
      'en': 'References / Testimonials',
      'ar': 'المراجع \\الشهادات',
    },
    'ig339qp4': {
      'en': 'Engagement Rate ',
      'ar': 'معدل التفاعل',
    },
    'l31qb7it': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'b6z1zro3': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'z3xp9b4h': {
      'en': 'Alternate Phone No',
      'ar': 'رقم الهاتف البديل',
    },
    '5tnse26c': {
      'en': 'Alternate Email',
      'ar': 'البريد الالكتروني البديل',
    },
    'hbhdzwgm': {
      'en': 'References / Testimonials',
      'ar': 'المراجع \\الشهادات',
    },
    'vbq4lcaw': {
      'en': 'Insta by @fashionista_kuwait',
      'ar': 'حساب الانستغرام @fashionista_kuwait',
    },
    'ikbo9zpx': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'xsqo1in8': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    '9wfrpxud': {
      'en': 'Professional Insights',
      'ar': 'الرؤي المهنية',
    },
    'kh5bs3hx': {
      'en': 'Social Media & Portfolio',
      'ar': 'وسائل التواصل الاجتماعي والملف الشخصي',
    },
    'dhlltg73': {
      'en': 'Instagram Profile',
      'ar': 'الملف الشخصي علي الانستجرام',
    },
    'kxtd8cbu': {
      'en': 'TikTok Handle',
      'ar': 'اسم الحساب علي تيك توك',
    },
    'rh7x1f09': {
      'en': 'YouTube Channel',
      'ar': 'قناة اليوتيوب',
    },
    'yomswnag': {
      'en': 'Other Social Media',
      'ar': 'وسائل التواصل الاجتماعي الأخرى',
    },
    '6mjhnfv6': {
      'en': 'Facebook Handle',
      'ar': 'فيسبوك',
    },
    '8z6be1cq': {
      'en': 'Follower Count',
      'ar': 'عدد المتابعين',
    },
    'g4h45gl4': {
      'en': 'Engagement Rate',
      'ar': 'معدل التفاعل',
    },
    'kjth6fde': {
      'en': 'IG: 8.5%, TikTok: 12%, YT: 5%',
      'ar': 'انستجرام:8.5% ,تيك توك:12%,يوتيوب: 5%',
    },
    'vfel5f9b': {
      'en': 'Thumbnail images',
      'ar': 'صور مصغرة',
    },
    '6r4lqb2f': {
      'en': 'Identity Verification',
      'ar': 'التحقق من الهوية',
    },
    'n6x6crro': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Creator-Active
  {
    'jysbxn65': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    '4keo8soa': {
      'en': 'Phone',
      'ar': 'هاتف',
    },
    'b91sqt8q': {
      'en': '250',
      'ar': '',
    },
    '9t6isb7d': {
      'en': 'Portfolio',
      'ar': 'مَلَفّ',
    },
    'ucdgp3yz': {
      'en': 'Brand Collabration',
      'ar': 'التعاون مع العلامات التجارية',
    },
    'iappkury': {
      'en': 'Personal-Details',
      'ar': 'البيانات الشخصية',
    },
    '4rb2hzzh': {
      'en': 'Promotions',
      'ar': 'العروض الترويجية',
    },
    '02zi3grr': {
      'en': 'Earnings & Payouts',
      'ar': 'الأرباح والمدفوعات',
    },
    'ghg1p2x8': {
      'en': 'Personal-Details',
      'ar': 'البيانات الشخصية',
    },
    '9fpo1wpf': {
      'en': 'Add Contract',
      'ar': 'إضافة المنتج',
    },
    '4gb09nnp': {
      'en': 'Personal Information',
      'ar': 'معلومات شخصية',
    },
    'd017uhgx': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'nngx6ked': {
      'en': 'Experience ',
      'ar': 'خبرة',
    },
    'ifxyocab': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'opw22yio': {
      'en': 'Portfolio',
      'ar': 'مَلَفّ',
    },
    '2dy0stwg': {
      'en': 'Preffered Niche',
      'ar': 'مكانة مفضلة',
    },
    'zc3fq7o9': {
      'en': 'Brand Collabration',
      'ar': 'التعاون مع العلامات التجارية',
    },
    'kbjipli7': {
      'en': 'Production Capacity',
      'ar': 'القدرة الإنتاجية',
    },
    '7w3iatm4': {
      'en': '10 posts per month',
      'ar': '',
    },
    'ofazxtgx': {
      'en': 'Location / City',
      'ar': 'الموقع / المدينة',
    },
    '8eptzbjf': {
      'en': 'ALternate Phone No',
      'ar': 'رقم الهاتف البديل',
    },
    'tfwp1ces': {
      'en': 'Alternate Email',
      'ar': 'البريد الإلكتروني البديل',
    },
    'pt317gil': {
      'en': 'Professional Insights',
      'ar': 'رؤى مهنية',
    },
    '6992639x': {
      'en': 'Contract Type',
      'ar': 'رؤى مهنية',
    },
    'a7dk54lx': {
      'en': 'Contract Start Date',
      'ar': 'رؤى مهنية',
    },
    'ke7h0ry6': {
      'en': 'Contract End Date',
      'ar': 'رؤى مهنية',
    },
    'xyevf68l': {
      'en': 'Contract End Date',
      'ar': 'رؤى مهنية',
    },
    'urh647tc': {
      'en': 'Social Media & Portfolio',
      'ar': 'وسائل التواصل الاجتماعي والمحفظة',
    },
    'da65cafo': {
      'en': 'Instagram Profile',
      'ar': 'الملف الشخصي على الانستغرام',
    },
    '5ozk99vz': {
      'en': 'TikTok Handle',
      'ar': 'مقبض تيك توك',
    },
    '0jbw2sz6': {
      'en': 'YouTube Channel',
      'ar': 'قناة اليوتيوب',
    },
    '5nwrbp4e': {
      'en': 'Other Social Media',
      'ar': 'وسائل التواصل الاجتماعي الأخرى',
    },
    'u2xml0cm': {
      'en': 'None',
      'ar': '',
    },
    '9kb2g9at': {
      'en': 'Follower Count',
      'ar': 'عدد المتابعين',
    },
    '8j3s0zgc': {
      'en': 'Engagement Rate',
      'ar': '',
    },
    'thdeeiz0': {
      'en': 'IG: 8.5%, TikTok: 12%, YT: 5%',
      'ar': '',
    },
    'us2awi90': {
      'en': 'Thumbnail images',
      'ar': 'صور مصغرة',
    },
    'dk2vprpr': {
      'en': 'Identity Verification',
      'ar': 'التحقق من الهوية',
    },
    '89cirxky': {
      'en': 'Active Promotions ',
      'ar': 'العروض الترويجية النشطة',
    },
    '3a5mo4h8': {
      'en': 'All',
      'ar': '',
    },
    'hvs7rzpq': {
      'en': 'ID: ',
      'ar': '',
    },
    'xsig71wd': {
      'en': 'https://instagram.com/loislane',
      'ar': '',
    },
    '5z2ffyge': {
      'en': '150',
      'ar': '',
    },
    'i420zip7': {
      'en': ' KD',
      'ar': '',
    },
    'mxfxn9d4': {
      'en': 'Hello World',
      'ar': '',
    },
    'tsprg43u': {
      'en': '4.8',
      'ar': '',
    },
    'xc6n3h8s': {
      'en': '(87)',
      'ar': '',
    },
    'ggvwaidc': {
      'en': '1,360',
      'ar': '',
    },
    '3p6lapd9': {
      'en': ' Sales',
      'ar': '',
    },
    'zvp279rw': {
      'en': '37.8',
      'ar': '',
    },
    'h0nfn2ot': {
      'en': '%',
      'ar': '',
    },
    'e0cx1etm': {
      'en': 'Performance',
      'ar': '',
    },
    'uwwtzx3d': {
      'en': 'Active Campaigns ',
      'ar': '',
    },
    '3y2hek8k': {
      'en': '15 ongoing collaborations',
      'ar': '',
    },
    'ahy3gxgo': {
      'en': 'Total Clicks Generated',
      'ar': '',
    },
    'bqhtax59': {
      'en': '175,000 clicks',
      'ar': '',
    },
    'z4la8t5f': {
      'en': 'Conversion Rate',
      'ar': '',
    },
    'ta2km609': {
      'en': '8.5% (Sales generated from clicks)',
      'ar': '',
    },
    '9f1e5syw': {
      'en': 'Total Sales from Promotions',
      'ar': '',
    },
    'pd82pgro': {
      'en': '85,000 KD in revenue',
      'ar': '',
    },
    'r27xrnui': {
      'en': 'Brand Collaboration History',
      'ar': '',
    },
    'bt8l5owa': {
      'en': 'Worked with 25+ brands',
      'ar': '',
    },
    'p0mwa43n': {
      'en': 'Brand Ratings',
      'ar': '',
    },
    'ryfhyu34': {
      'en': '4.7/5 (Based on 22 brand reviews)',
      'ar': '',
    },
    '4nphghkx': {
      'en': 'Flagged Content Violations',
      'ar': '',
    },
    'k8yggsg9': {
      'en': 'None',
      'ar': '',
    },
    'jovnbbj7': {
      'en': 'Recent Warnings',
      'ar': '',
    },
    '08cm4ljh': {
      'en': 'No warnings issued',
      'ar': '',
    },
    '0eshylmm': {
      'en': 'Pending Promotions',
      'ar': 'العروض الترويجية المعلقة',
    },
    'vg8vpoa6': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    '0ahgsk53': {
      'en': 'ID: ',
      'ar': '',
    },
    '97i0gnn5': {
      'en': 'https://instagram.com/loislane',
      'ar': '',
    },
    'b4yaezzt': {
      'en': '150',
      'ar': '',
    },
    'qe4i4jsx': {
      'en': ' KD',
      'ar': '',
    },
    'oum50qe5': {
      'en': 'Hello World',
      'ar': '',
    },
    'qcjhec1d': {
      'en': 'Payout Summary',
      'ar': '',
    },
    '1feynw0s': {
      'en': 'Total Earnings',
      'ar': '',
    },
    'okecnumb': {
      'en': ' KD',
      'ar': '',
    },
    '3m8kqqkp': {
      'en': '336 KD',
      'ar': '',
    },
    'ezpg4b1d': {
      'en': 'Pending Payouts',
      'ar': '',
    },
    'l1a9zwjl': {
      'en': ' KD',
      'ar': '',
    },
    'kgo65sd9': {
      'en': '85 KD',
      'ar': '',
    },
    'cbi97o26': {
      'en': 'Completed Payouts',
      'ar': '',
    },
    'pjifvmpz': {
      'en': ' KD',
      'ar': '',
    },
    'nersrszn': {
      'en': '250 KD',
      'ar': '',
    },
    'iqa1dhyv': {
      'en': 'Last Payout Date',
      'ar': '',
    },
    '08x75m73': {
      'en': 'Fee Structure Breakdown',
      'ar': '',
    },
    '5v5zrrqq': {
      'en': '5',
      'ar': '',
    },
    '15n70ztj': {
      'en': ' %',
      'ar': '',
    },
    'oaw4nq1k': {
      'en': 'Worked with 25+ brands',
      'ar': '',
    },
    'v3uro7px': {
      'en': 'Payment Processing Time',
      'ar': '',
    },
    'bgba93e4': {
      'en': '15 Days',
      'ar': '',
    },
    'jblkz9jw': {
      'en': 'Next Scheduled Payout',
      'ar': '',
    },
    'pebn1gwj': {
      'en': 'Feb 14, 2025',
      'ar': '',
    },
    '6jn3vi1l': {
      'en': 'Payment Details',
      'ar': '',
    },
    '7ocsm6mu': {
      'en': 'Bank Name',
      'ar': '',
    },
    'e2x0mtwg': {
      'en': 'Account No',
      'ar': '',
    },
    'mf2fmpmw': {
      'en': 'Account Holder Name',
      'ar': '',
    },
    '472hjw9f': {
      'en': 'IBAN Code',
      'ar': '',
    },
    'fbhjhi8b': {
      'en': 'Payout Transactions',
      'ar': '',
    },
    'fa3gk11n': {
      'en': 'Automated Payouts',
      'ar': '',
    },
    'axs5qooh': {
      'en': 'All',
      'ar': '',
    },
    'e60xhh5h': {
      'en': 'Add Amount',
      'ar': 'إضافة المنتج',
    },
    'c2b2j47n': {
      'en': 'Item Sold',
      'ar': '',
    },
    'kgtsvniv': {
      'en': 'Payout ID',
      'ar': '',
    },
    'wbiefful': {
      'en': 'Data Processed',
      'ar': '',
    },
    '62o17et5': {
      'en': 'White Dress, #65478',
      'ar': '',
    },
    'yaajr79g': {
      'en': '#20569',
      'ar': '',
    },
    'pnqva1qa': {
      'en': 'Feb 12, 2024 6:16 PM',
      'ar': '',
    },
    'm52by9qc': {
      'en': 'Amount',
      'ar': '',
    },
    'iiyqlgui': {
      'en': '100',
      'ar': '',
    },
    'gqai5kmg': {
      'en': ' KD',
      'ar': '',
    },
    'x4l7ikv8': {
      'en': 'johndesigns.com',
      'ar': '',
    },
    'vlk5g5vc': {
      'en': 'Payment Method',
      'ar': '',
    },
    '3acb7x0b': {
      'en': 'Bank Transfer',
      'ar': '',
    },
    'annlq2f5': {
      'en': 'Status',
      'ar': '',
    },
    'oawydydp': {
      'en': 'Pending',
      'ar': '',
    },
    'id3tlxv2': {
      'en': 'Admin Actions',
      'ar': '',
    },
    'e5hsjsdp': {
      'en': 'Proceed',
      'ar': '',
    },
    'kslxgj84': {
      'en': 'Invoice Download',
      'ar': '',
    },
    'dj948zzn': {
      'en': 'Download All',
      'ar': '',
    },
    'q4bkx0hq': {
      'en': 'Promotion ID',
      'ar': '',
    },
    'x6togsji': {
      'en': 'Images',
      'ar': '',
    },
    'v0xh45rx': {
      'en': 'Date',
      'ar': '',
    },
    'x5ukwb3n': {
      'en': 'Total Sales',
      'ar': '',
    },
    'axpqon29': {
      'en': 'Total Amount',
      'ar': '',
    },
    '4jqub2dg': {
      'en': 'Amount Given',
      'ar': '',
    },
    'z4h1rrl1': {
      'en': 'Add amount',
      'ar': '',
    },
    'be342bt9': {
      'en': '200',
      'ar': '',
    },
    'i1qu244g': {
      'en': 'Add',
      'ar': '',
    },
    '3ahy9czs': {
      'en': 'DRS-FS-102',
      'ar': '',
    },
    'hpihdwrk': {
      'en': 'Units Sold ',
      'ar': '',
    },
    't0sly7m0': {
      'en': '= ',
      'ar': '',
    },
    '8myon2oz': {
      'en': 'Promotion ID',
      'ar': '',
    },
    '4tpf7f9c': {
      'en': 'Total Amount ',
      'ar': '',
    },
    'iziqkpwg': {
      'en': '= ',
      'ar': '',
    },
    'ig6ycmpe': {
      'en': '1,400 KD ',
      'ar': '',
    },
    'zw1utcha': {
      'en': 'Promotion ID',
      'ar': '',
    },
    '47s8o9th': {
      'en': 'Floral Satin Evening Dress',
      'ar': '',
    },
    'mkt426h6': {
      'en': 'DRS-FS-102',
      'ar': '',
    },
    'ptnr1ybc': {
      'en': 'Units Sold ',
      'ar': '',
    },
    's97fmouj': {
      'en': '= ',
      'ar': '',
    },
    '4rve6kmo': {
      'en': '120',
      'ar': '',
    },
    'eifvy2gz': {
      'en': 'Promotion ID',
      'ar': '',
    },
    'eltkz6st': {
      'en': 'Total Amount ',
      'ar': '',
    },
    '8s6y8gmi': {
      'en': '= ',
      'ar': '',
    },
    '5poosdjq': {
      'en': '1,400 KD ',
      'ar': '',
    },
    'uciv1038': {
      'en': 'Promotion ID',
      'ar': '',
    },
    'w0x7vbs6': {
      'en': 'Floral Satin Evening Dress',
      'ar': '',
    },
    '5pmabm8z': {
      'en': 'DRS-FS-102',
      'ar': '',
    },
    '13q15n6v': {
      'en': 'Units Sold ',
      'ar': '',
    },
    '5wssaevi': {
      'en': '= ',
      'ar': '',
    },
    '61js6yp5': {
      'en': '120',
      'ar': '',
    },
    'ua0imail': {
      'en': 'Promotion ID',
      'ar': '',
    },
    '5t5klvxx': {
      'en': 'Total Amount ',
      'ar': '',
    },
    'jy23ez5u': {
      'en': '= ',
      'ar': '',
    },
    'l9i7z5hf': {
      'en': '1,400 KD ',
      'ar': '',
    },
    '07n5x5wm': {
      'en': 'Promotion ID',
      'ar': '',
    },
    'usbyoyqy': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Register
  {
    'dhlvbz1k': {
      'en': 'Create an Account',
      'ar': 'انشاء حساب',
    },
    '79uu6m40': {
      'en':
          'Access your Azyaa dashboard to manage designers, orders, payouts & more.',
      'ar':
          'يمكنك الوصول الي لوحة أزياء الخاصة بك لادارة المصممين والطلبات والمدفوعات والي اخره',
    },
    'vuz9lz2h': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'cj2tejrh': {
      'en': '',
      'ar': '',
    },
    'yq5wj478': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'bpa17hpa': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'zkvfomt2': {
      'en': '',
      'ar': '',
    },
    '1yr541hh': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'rd96xras': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    'c2h4onsj': {
      'en': '',
      'ar': '',
    },
    'q211wxol': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    'xsyqdhjb': {
      'en': 'By continuing you accept our Privacy Policy and Term of Use',
      'ar':
          'من خلال الاستمرار فإنك توافق على سياسة الخصوصية وشروط الاستخدام الخاصة بنا',
    },
    '7gukmk1x': {
      'en': 'Register',
      'ar': 'يسجل',
    },
    'oungu4ms': {
      'en': 'Already have an account? ',
      'ar': 'هل لديك حساب بالفعل؟',
    },
    '75616tus': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
    },
    '64qrui6e': {
      'en': '© Azyaa | Built with ',
      'ar': '',
    },
    'jcpp0xxk': {
      'en': '❤︎ ',
      'ar': '',
    },
    'u0r9w8e0': {
      'en': 'by ',
      'ar': '',
    },
    'arhapri4': {
      'en': 'websiteK',
      'ar': '',
    },
    'slagjmyj': {
      'en': 'Field is required',
      'ar': 'هذا الحقل مطلوب ',
    },
    '2k0o83zu': {
      'en': 'Invalid Mail Address',
      'ar': 'عنوان بريد غير صالح',
    },
    'fkt31ef8': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    'hd735nic': {
      'en': 'Field is required',
      'ar': 'هذا الحقل مطلوب ',
    },
    'ji4mhfx6': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    '8wfawp8n': {
      'en': '\"Feel the luxury, own the moment.\"',
      'ar': 'اشعر بالفخامة وامتلك اللحظة ',
    },
    'zoiutxg5': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Designer-Active
  {
    'o94rntvc': {
      'en': 'Preferred Styles',
      'ar': 'الأنماط المفضلة',
    },
    'p2g1ih6n': {
      'en': 'Total Sales',
      'ar': 'إجمالي المبيعات',
    },
    '35jycp2q': {
      'en': '500 ',
      'ar': '',
    },
    'rgubz9un': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    'yzzvzak3': {
      'en': '30',
      'ar': '',
    },
    'c3lvrkc8': {
      'en': 'Balance ',
      'ar': 'توازن',
    },
    'jc45a9hg': {
      'en': '30 KD',
      'ar': '',
    },
    'zkuo6e44': {
      'en': 'Personal-Details ',
      'ar': 'البيانات الشخصية',
    },
    '043fx0r5': {
      'en': 'Products',
      'ar': 'منتجات',
    },
    '5aiays1j': {
      'en': 'Payout',
      'ar': 'الدفع',
    },
    'rzr8e95l': {
      'en': 'Personal-Details ',
      'ar': 'البيانات الشخصية',
    },
    'ugmlx4tf': {
      'en': 'Add Contract',
      'ar': 'إضافة المنتج',
    },
    '0an0t1sd': {
      'en': 'Personal Information',
      'ar': 'معلومات شخصية',
    },
    'uwg9mh9p': {
      'en': 'Brand Type',
      'ar': 'نوع العلامة التجارية',
    },
    '5ukfx8b1': {
      'en': 'Brand Name',
      'ar': 'اسم العلامة التجارية',
    },
    '4gg609c3': {
      'en': 'Location / City',
      'ar': 'الموقع / المدينة',
    },
    'wxy27d4y': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'lp7q7y3v': {
      'en': 'Phone No',
      'ar': 'رقم الهاتف',
    },
    '7cr8jlbn': {
      'en': 'Experience ',
      'ar': 'خبرة',
    },
    'x96wnefw': {
      'en': 'Availability for Custom Orders',
      'ar': 'التوفر للطلبات المخصصة',
    },
    '3dkjwcru': {
      'en': 'Platform Rate',
      'ar': 'سعر المنصة',
    },
    'lj21yz6i': {
      'en': '18% per sale',
      'ar': '',
    },
    'gcs43ocd': {
      'en': 'Open for Events/Collaborations',
      'ar': 'مفتوح للأحداث\\التعاون',
    },
    'tebv9o45': {
      'en': 'Production Capacity',
      'ar': 'القدرة الإنتاجية ',
    },
    'mbeqdq2s': {
      'en': 'Portfolio',
      'ar': 'الملف الشخصي',
    },
    'ujf9s4ck': {
      'en': 'References / Testimonials',
      'ar': 'المراجع / الشهادات',
    },
    't7whdxg0': {
      'en': 'Alternative Email',
      'ar': 'البريد الإلكتروني البديل',
    },
    'bvhm3amz': {
      'en': 'Alternative Phone',
      'ar': 'هاتف بديل',
    },
    '2foyl18s': {
      'en': 'Professional Insights',
      'ar': 'رؤى مهنية',
    },
    '78zps30q': {
      'en': 'Contract Type',
      'ar': 'رؤى مهنية',
    },
    'zisau1vq': {
      'en': 'Contract Start Date',
      'ar': 'رؤى مهنية',
    },
    'i3tqlf5v': {
      'en': 'Contract End Date',
      'ar': 'رؤى مهنية',
    },
    'jvftv89u': {
      'en': 'Portfolio / Work Samples / Additional Certifications',
      'ar': 'المحفظة / نماذج الأعمال / الشهادات الإضافية',
    },
    'zpcihfgg': {
      'en': 'Images ',
      'ar': 'الصور',
    },
    'scjbt0ui': {
      'en': 'IMG',
      'ar': 'اي ام جي',
    },
    'xxkcvsyo': {
      'en': 'PDF',
      'ar': 'ملف بي دي إف',
    },
    '5b2a4hhl': {
      'en': 'PDF',
      'ar': 'ملف بي دي إف',
    },
    '3a14hhwk': {
      'en': 'Identity Verification',
      'ar': 'التحقق من الهوية',
    },
    '9i78qhuy': {
      'en': 'Pending Product\'s ',
      'ar': 'المنتجات المعلقة',
    },
    '1wrzb5il': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'kfrmgrsc': {
      'en': 'Designer Dress ',
      'ar': '',
    },
    'el1tojon': {
      'en': '250 KD',
      'ar': '',
    },
    '926512x9': {
      'en':
          'A best-selling outfit made from sustainable fabric with a modern design touch.',
      'ar': 'أكثر اطلالة مبيعا مصنوعة من قماشة مستدامة مع لمسة تصميم عصرية ',
    },
    'pkn3e34p': {
      'en': 'Active Product’s',
      'ar': 'المنتجات النشطة',
    },
    'fizrr4du': {
      'en': 'Order Summary',
      'ar': 'ملخص الطلب',
    },
    'nj90tazm': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    'uxqwyql8': {
      'en': 'Pending Orders',
      'ar': 'الطلبات المعلقة',
    },
    'lhnm87w5': {
      'en': 'Completed Orders',
      'ar': 'الطلبات المكتملة',
    },
    'xof5ke3u': {
      'en': 'Refund Requests',
      'ar': 'طلبات استرداد الأموال',
    },
    'wo05icuc': {
      'en': '########',
      'ar': '',
    },
    'seqqfrck': {
      'en': 'Return & Refund Rate',
      'ar': 'معدل الإرجاع والاسترداد',
    },
    '47s9xo97': {
      'en': '2.5%',
      'ar': '',
    },
    'uha1pmr0': {
      'en': 'Order Fulfillment Time',
      'ar': 'وقت تنفيذ الطلب',
    },
    'y2t3p3ui': {
      'en': '4 Days',
      'ar': '',
    },
    'il9gfnmz': {
      'en': 'Refund Requests',
      'ar': 'طلبات استرداد الأموال',
    },
    'zk870lxq': {
      'en': '(',
      'ar': '',
    },
    'pljz8wlv': {
      'en': '4.2',
      'ar': '',
    },
    'qei53zt4': {
      'en': '/',
      'ar': '',
    },
    'o1kr617j': {
      'en': '5',
      'ar': '',
    },
    '4x651bpx': {
      'en': ')',
      'ar': '',
    },
    'wjaquw3j': {
      'en': 'Designer Reliability Score',
      'ar': 'درجة موثوقية المصمم',
    },
    '03smiwwg': {
      'en': '90%',
      'ar': '',
    },
    'rnziyln5': {
      'en': 'Transaction',
      'ar': 'عملية',
    },
    'rxg5j4v1': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'spcfl5tp': {
      'en': ' ',
      'ar': '',
    },
    '0bnk64bq': {
      'en': 'Order ID',
      'ar': 'معرف الطلب',
    },
    'xdw1owm3': {
      'en': 'Customer ',
      'ar': 'عميل',
    },
    'jb078wsa': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    '697oc3ox': {
      'en': 'Total Amount',
      'ar': 'المبلغ الإجمالي',
    },
    '7k5qrtds': {
      'en': 'Payment Status',
      'ar': 'حالة الدفع',
    },
    '75jcttrc': {
      'en': 'Order Status',
      'ar': 'حالة الطلب',
    },
    'n8zmbom3': {
      'en': 'Action',
      'ar': '',
    },
    '67g7ih4l': {
      'en': 'View Details',
      'ar': '',
    },
    'utebwkov': {
      'en': 'Return Request',
      'ar': '',
    },
    'tnjm6n21': {
      'en': 'Yes',
      'ar': '',
    },
    '19p3r9zi': {
      'en': 'Total Amount',
      'ar': '',
    },
    '9wgrzd0d': {
      'en': '150 KD',
      'ar': '',
    },
    'h0a1z6zg': {
      'en': '2 Desingers selected',
      'ar': '',
    },
    '7qhgjol2': {
      'en': 'Reject',
      'ar': '',
    },
    '4wwe9lyr': {
      'en': 'Approve',
      'ar': '',
    },
    'dnk44y3p': {
      'en': 'Payout Summary',
      'ar': '',
    },
    'bpmk6aus': {
      'en': 'Total Earnings',
      'ar': '',
    },
    '1xh9avvb': {
      'en': '200 KD',
      'ar': '',
    },
    'l5q0xpxs': {
      'en': 'Pending Payouts',
      'ar': '',
    },
    'fsfm4vft': {
      'en': '20 KD',
      'ar': '',
    },
    'mb7cjo5n': {
      'en': 'Completed Payouts',
      'ar': '',
    },
    'i1atzdt7': {
      'en': '20 KD',
      'ar': '',
    },
    'n0xwqnqu': {
      'en': 'Last Payout Date',
      'ar': '',
    },
    'usage4xx': {
      'en': 'Feb 12, 2025',
      'ar': '',
    },
    'urvqq8hk': {
      'en': 'Fee Structure Breakdown',
      'ar': '',
    },
    'ipedxwpt': {
      'en': '16%',
      'ar': '',
    },
    'zkm5n0vg': {
      'en': 'Payment Processing Time',
      'ar': '',
    },
    '0xsjvy2u': {
      'en': '15 Days',
      'ar': '',
    },
    'lv828kts': {
      'en': 'Next Scheduled Payout',
      'ar': '',
    },
    'rejq4dkf': {
      'en': 'Feb 14, 2025',
      'ar': '',
    },
    '64wjxbt9': {
      'en': 'Payment Details',
      'ar': '',
    },
    'vazey0ya': {
      'en': 'Bank Name',
      'ar': '',
    },
    'yfy4vfpm': {
      'en': '###########',
      'ar': '',
    },
    'tsd8zcwy': {
      'en': 'Account No',
      'ar': '',
    },
    't65s6ivl': {
      'en': '###########',
      'ar': '',
    },
    '2xogo2z8': {
      'en': 'IBAN Code',
      'ar': '',
    },
    'o0ynxli2': {
      'en': '#############',
      'ar': '',
    },
    'ualdlvxe': {
      'en': 'Payout Transactions',
      'ar': '',
    },
    'j82k1pvq': {
      'en': 'Automated Payouts',
      'ar': '',
    },
    '9b1vgly3': {
      'en': 'All',
      'ar': '',
    },
    'qvkcryx3': {
      'en': 'Add Amount',
      'ar': 'إضافة المنتج',
    },
    'p9tbtn8j': {
      'en': 'Product ID',
      'ar': '',
    },
    '4qn94q4o': {
      'en': 'Images',
      'ar': '',
    },
    'i3hik8z6': {
      'en': 'Date',
      'ar': '',
    },
    'y71dfceu': {
      'en': 'Total Sales',
      'ar': '',
    },
    'of462aul': {
      'en': 'Total Amount',
      'ar': '',
    },
    '7gx4g1e7': {
      'en': 'Amount Given',
      'ar': '',
    },
    '3yo6msmm': {
      'en': 'Add amount',
      'ar': '',
    },
    '87wle38e': {
      'en': '200',
      'ar': '',
    },
    'wxqs5n6l': {
      'en': 'Add',
      'ar': '',
    },
    'knll2mp6': {
      'en': 'DRS-FS-102',
      'ar': '',
    },
    'rhtmi5gv': {
      'en': 'Units Sold ',
      'ar': '',
    },
    'z17uefu8': {
      'en': '= ',
      'ar': '',
    },
    'mdtkjbbj': {
      'en': 'Promotion ID',
      'ar': '',
    },
    'zl9othgz': {
      'en': 'Total Amount ',
      'ar': '',
    },
    'zy9e277u': {
      'en': '= ',
      'ar': '',
    },
    'kj1mxfj9': {
      'en': '1,400 KD ',
      'ar': '',
    },
    '5p8snd6a': {
      'en': 'Promotion ID',
      'ar': '',
    },
    'evohv0uc': {
      'en': '2 Desingers selected',
      'ar': '',
    },
    'svgfjv39': {
      'en': 'Download All',
      'ar': '',
    },
    'hgi1a1yp': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Dashboard
  {
    'y6ifwauv': {
      'en': 'Total Revenue',
      'ar': 'إجمالي الإيرادات',
    },
    'gjkqnvmw': {
      'en': '4.8%',
      'ar': '',
    },
    'rt5zk2oj': {
      'en': 'from yesterday',
      'ar': '',
    },
    'tqgq9rye': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    'ksn8klss': {
      'en': '4.8%',
      'ar': '',
    },
    '21kumrsw': {
      'en': 'from yesterday',
      'ar': '',
    },
    '9rp711zh': {
      'en': 'Total Users ',
      'ar': 'إجمالي المستخدمين',
    },
    '3tss0avq': {
      'en': '4.8%',
      'ar': '',
    },
    'm6mtvnsf': {
      'en': 'from yesterday',
      'ar': '',
    },
    '6rl2j4sa': {
      'en': 'User App Secret Key',
      'ar': '',
    },
    'au4ujsst': {
      'en': 'Generate',
      'ar': '',
    },
    '8tp9rmyv': {
      'en': 'Users',
      'ar': 'Users',
    },
    '4blmcl17': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'f802z5ar': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'xos6zujw': {
      'en': ' ',
      'ar': '',
    },
    'yv1vlkek': {
      'en': 'ID',
      'ar': 'بطاقة تعريف',
    },
    '9ds9mhj5': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'sp1t7rby': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'fvdde7mq': {
      'en': 'Phone',
      'ar': 'هاتف',
    },
    's3ecw3ew': {
      'en': 'Role',
      'ar': 'دور',
    },
    'xwi0l876': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'ehz3gi0k': {
      'en': 'Actions',
      'ar': 'الإجراءات',
    },
    'w0refxv3': {
      'en': 'View Details',
      'ar': 'عرض التفاصيل',
    },
    'oiayamn2': {
      'en': 'Order ID',
      'ar': 'معرف الطلب',
    },
    '3q2wetk3': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    '9lvi87dx': {
      'en': 'Customer',
      'ar': 'عميل',
    },
    'e2u73881': {
      'en': 'Items',
      'ar': 'أغراض',
    },
    'te6l61su': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    'lt8b49ix': {
      'en': 'Payment Status',
      'ar': 'حالة الدفع',
    },
    '4sbmufo2': {
      'en': 'Still searching…',
      'ar': 'لا زلت أبحث…',
    },
    'amje2xpt': {
      'en': 'No orders found. Time to spark some action!',
      'ar': 'لم يتم العثور على أي طلبات. حان وقت الإثارة!',
    },
    'kon15yp0': {
      'en': 'Dashboard',
      'ar': 'لوحة التحكم',
    },
    'bwudp41m': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    'uygdmwm6': {
      'en': '4.8%',
      'ar': '',
    },
    'x429gjir': {
      'en': 'from yesterday',
      'ar': '',
    },
    'ag44k63q': {
      'en': 'Total followers',
      'ar': 'إجمالي المتابعين',
    },
    'iwgd6ve5': {
      'en': '4.8%',
      'ar': '',
    },
    'm9et850k': {
      'en': 'from yesterday',
      'ar': '',
    },
    's4l6vhq6': {
      'en': 'Orders',
      'ar': 'Orders',
    },
    'kdgtcde0': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    '2i5zo8yz': {
      'en': 'Search...',
      'ar': '',
    },
    'qb2swkgp': {
      'en': 'Order ID',
      'ar': 'معرف الطلب',
    },
    '75aa56d4': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'kxvmlxte': {
      'en': 'Customer',
      'ar': 'عميل',
    },
    '9n1ab0c1': {
      'en': 'Items',
      'ar': 'أغراض',
    },
    'o1nr9kju': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    'qg6mc0yf': {
      'en': 'Payment Status',
      'ar': 'حالة الدفع',
    },
    'tlafdlgz': {
      'en': 'Still searching…',
      'ar': 'لا زلت أبحث…',
    },
    '7gzqm71f': {
      'en': 'No orders found. Time to spark some action!',
      'ar': 'لم يتم العثور على أي طلبات. حان وقت الإثارة!',
    },
    '1rjv5fia': {
      'en': 'Pending Custom Orders',
      'ar': 'الطلبات الخاصة قيد الانتظار',
    },
    '1tqrwiau': {
      'en': 'Pending Custom Orders',
      'ar': 'الطلبات الخاصة قيد الانتظار',
    },
    'tawkxs9d': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'umnia152': {
      'en': 'Search...',
      'ar': '',
    },
    'omij1ndc': {
      'en': 'Order ID',
      'ar': 'معرف الطلب',
    },
    'fiol70cl': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'xbwhgxbg': {
      'en': 'Customer',
      'ar': 'عميل',
    },
    'pnp2r99w': {
      'en': 'Still searching…',
      'ar': 'لا زلت أبحث…',
    },
    '0b2n9tnn': {
      'en': 'No orders found. Time to spark some action!',
      'ar': 'لم يتم العثور على أي طلبات. حان وقت الإثارة!',
    },
    '16z8a2lw': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Products
  {
    'mgkb2a6w': {
      'en': 'Products',
      'ar': 'منتجات',
    },
    'nvlfqcf6': {
      'en': 'Export',
      'ar': 'تصدير',
    },
    'gem65ef4': {
      'en': 'Import',
      'ar': 'استيراد',
    },
    'teqm0fyb': {
      'en': 'More Actions',
      'ar': 'المزيد من الاجراءات',
    },
    'njir0h8a': {
      'en': 'Search...',
      'ar': 'بحث',
    },
    '4upvteil': {
      'en': 'More Actions',
      'ar': 'المزيد من الاجراءات',
    },
    'kyym8c56': {
      'en': 'Add Product',
      'ar': 'إضافة المنتج',
    },
    '6fv01eqh': {
      'en': 'Total Products Listed',
      'ar': 'إجمالي المنتجات المدرجة',
    },
    'h60igavd': {
      'en': 'Pending Product Approvals',
      'ar': 'موافقات المنتج المعلقة',
    },
    '07t80w3n': {
      'en': 'Low Stock Alerts',
      'ar': 'تنبيهات انخفاض المخزون',
    },
    'qa1dptx0': {
      'en': 'Elegant Satin Gown (2 Costumers)',
      'ar': 'فستان ساتان أنيق (2 من الزبائن)',
    },
    'iaxrx2tc': {
      'en': '250',
      'ar': '',
    },
    '3sd6ddks': {
      'en': 'Best-Selling Product',
      'ar': 'المنتج الأكثر مبيعا',
    },
    '2p0kruhq': {
      'en': 'All',
      'ar': 'الجميع',
    },
    '1o6znrc0': {
      'en': 'Active',
      'ar': 'نشيط',
    },
    'b974f0q8': {
      'en': 'Inactive',
      'ar': 'غير نشط',
    },
    'b7gsdgle': {
      'en': 'Draft',
      'ar': 'مسودة',
    },
    '3dm26jhd': {
      'en': 'Archived',
      'ar': 'مؤرشف',
    },
    'niuw05ig': {
      'en': 'Auto-Approval',
      'ar': 'الموافقة التلقائية',
    },
    '09k6sb6f': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'dtiuwcz8': {
      'en': ' ',
      'ar': '',
    },
    '03b1tvxq': {
      'en': 'ID',
      'ar': 'بطاقة تعريف',
    },
    'wqa7x7jp': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'lo4u3rix': {
      'en': 'Price',
      'ar': 'سعر',
    },
    'r00746ch': {
      'en': 'Stock',
      'ar': 'مخزون',
    },
    'rlfwb7gq': {
      'en': 'Total Sales',
      'ar': 'إجمالي المبيعات',
    },
    'wg7dlsg4': {
      'en': 'Designer',
      'ar': 'مصمم',
    },
    '4znmn35z': {
      'en': 'Rating',
      'ar': 'تصنيف',
    },
    'az8bkrt1': {
      'en': '(',
      'ar': '',
    },
    '8odegyd6': {
      'en': ')',
      'ar': '',
    },
    'rtp6sgvr': {
      'en': ' -',
      'ar': '',
    },
    'p30azj7z': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'drayj93l': {
      'en': ' ',
      'ar': '',
    },
    'kfevypns': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Product-Add
  {
    'hir2bttu': {
      'en': 'Add Product',
      'ar': 'إضافة المنتج',
    },
    'xw67jl17': {
      'en': 'Product Details',
      'ar': 'تفاصيل المنتج',
    },
    'eumx7gig': {
      'en': 'Ready Made',
      'ar': 'جاهز',
    },
    '8xj4nytq': {
      'en': 'Pre-made item, no tailoring needed',
      'ar': 'منتج جاهز لا يحتاج الي خياطة',
    },
    'km7r8wk5': {
      'en': 'Ready Made',
      'ar': 'حفظ ومتابعة',
    },
    'zxhsxeqc': {
      'en': 'Custom Made',
      'ar': 'يغلق',
    },
    'q3c9pqnk': {
      'en': 'Product Title',
      'ar': 'عنوان المنتج',
    },
    'cd15kaxl': {
      'en': 'Maximum 100 characters. No HTML or emoji allowed',
      'ar': 'الحد الأقصى 100حرف ممنوع استخدام HTML أو الرموز التعبيرية',
    },
    'dvqhtm7y': {
      'en': '',
      'ar': '',
    },
    'y7tsouoj': {
      'en': 'Enter product name',
      'ar': 'أدخل اسم المنتج',
    },
    'w23x71rn': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'w3r790q7': {
      'en': 'Only characters. No HTML or emoji allowed',
      'ar': 'أحرف فقط ممنوع استخدام HTML أو الرموز التعبيرية  ',
    },
    'w1nzj5b9': {
      'en': '',
      'ar': '',
    },
    'e59wnx1v': {
      'en': 'Enter product description',
      'ar': 'أدخل النص الخاص بك',
    },
    'nr0yad8w': {
      'en': 'Short Description',
      'ar': 'وصف مختصر',
    },
    'nlvldes1': {
      'en': 'Only characters. No HTML or emoji allowed',
      'ar': '',
    },
    'mb24kcim': {
      'en': '',
      'ar': '',
    },
    '8r3hrwbl': {
      'en': 'E.g. Premium handcrafted silk dress',
      'ar': 'أدخل النص الخاص بك',
    },
    '4tql9aog': {
      'en': 'Select Designer',
      'ar': 'اختر المصمم',
    },
    'ech980is': {
      'en': 'Select Designer of the product.',
      'ar': 'اختر مصمم المنتج',
    },
    'ddw8gotf': {
      'en': 'Select...',
      'ar': 'اختيار',
    },
    '3ygobn0u': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    '3l5uffa5': {
      'en': 'Option 1',
      'ar': '',
    },
    'k5sbwaf7': {
      'en': 'SKU',
      'ar': 'رمز المنتج',
    },
    'ae1c7593': {
      'en': 'SKU of the product',
      'ar': 'رمز المنتج',
    },
    'jlf95wbe': {
      'en': '',
      'ar': '',
    },
    '3r0ovjbn': {
      'en': 'LUX-GOWN-2024',
      'ar': 'أدخل النص الخاص بك',
    },
    '1n3o44xd': {
      'en': 'Reload',
      'ar': 'حفظ ومتابعة',
    },
    'z2lizyqs': {
      'en': 'Cost',
      'ar': 'التكلفة',
    },
    'uyrsyxiz': {
      'en': 'Cost price of the product',
      'ar': 'سعرتكلفة المنتج',
    },
    '0y5m0w7r': {
      'en': '',
      'ar': '',
    },
    'r1px0sme': {
      'en': 'Enter cost price (internal)',
      'ar': 'أدخل سعر التكلعة (داخليا)',
    },
    'cj0s7jt3': {
      'en': 'Price',
      'ar': 'السعر',
    },
    'v7g7is43': {
      'en': 'Selling price of the product',
      'ar': 'سعر بيع المنتج',
    },
    '2xvimyp9': {
      'en': '',
      'ar': '',
    },
    '4ogi65zw': {
      'en': 'Enter selling price (visible)',
      'ar': 'أدخل سعر البيع (المرئي)',
    },
    '0isr4a8o': {
      'en': 'Estimate Shipping No. Days (If Ordered)',
      'ar': 'تقدير عدد أيام الشحن(اذا تم الطلب)',
    },
    '1a8ln8ts': {
      'en': 'Number of days in which order might be delivered',
      'ar': 'عدد الأيام التي قد يتم تسليم الطلب خلالها ',
    },
    'u350oszz': {
      'en': '',
      'ar': '',
    },
    '552awwkf': {
      'en': 'Input your number of days',
      'ar': 'أدخل عدد أيام التوصيل',
    },
    'xftcc0y2': {
      'en': '4',
      'ar': '',
    },
    'gpv6tcrv': {
      'en': 'Alert Threshold for Restock',
      'ar': 'تقدير عدد أيام الشحن(اذا تم الطلب)',
    },
    'orb1orla': {
      'en': 'Alert to restock the product when its low stocked',
      'ar': 'تنبيه لإعادة تخزين المنتج عندما يكون مخزونه منخفضاً',
    },
    '337x8ot0': {
      'en': '',
      'ar': '',
    },
    'orqjwbu0': {
      'en': 'Input your number of days',
      'ar': 'أدخل عدد أيام التوصيل',
    },
    'v6apg0z6': {
      'en': '10',
      'ar': '',
    },
    '8oqbpcq2': {
      'en': 'Notify Designer if Alert Threshold reached',
      'ar': 'قم بإخطار المصمم في حال الوصول إلى عتبة التنبيه',
    },
    'c1454loy': {
      'en': 'Yes',
      'ar': 'مفعل',
    },
    'v7vs2rjw': {
      'en': 'No',
      'ar': 'لا',
    },
    'v860eenu': {
      'en': 'Virtual Tryon',
      'ar': 'ترايون الافنراضي',
    },
    'dxkfjc5o': {
      'en': 'On',
      'ar': 'مفعل',
    },
    '1uc56ddu': {
      'en': 'Off',
      'ar': 'معطل',
    },
    'xh6tuibv': {
      'en': 'Virtual Tryon',
      'ar': 'ترايون الافنراضي',
    },
    '4wo75zdd': {
      'en': 'Pricing Details',
      'ar': 'التسعير والمخزون',
    },
    'eg1ow5ko': {
      'en': 'Stock Managed by Designer',
      'ar': 'الأسهم التي يديرها المصمم',
    },
    'ssmqz833': {
      'en': 'Stock Managed by Azyaa',
      'ar': 'الأسهم التي تديرها شركة أزياء',
    },
    'ln6aogn4': {
      'en': 'Stock Managed by Azyaa',
      'ar': 'الأسهم التي تديرها شركة أزياء',
    },
    '5230kjwh': {
      'en': 'Product Price',
      'ar': 'سعر المنتج',
    },
    '2hqco1nc': {
      'en': 'Product Price',
      'ar': '',
    },
    'y5pkrj42': {
      'en': '',
      'ar': '',
    },
    '1x44qag3': {
      'en': '0',
      'ar': '0',
    },
    'piptgw31': {
      'en': 'Compare at Price (Optional)',
      'ar': 'مقارنة السعر (اختياري)',
    },
    'n8bjsg7i': {
      'en': 'Compare price',
      'ar': 'مقرنة بالسعر',
    },
    '8axyd3w4': {
      'en': '',
      'ar': '',
    },
    'glbpdavc': {
      'en': '0',
      'ar': '0',
    },
    'o7sk7byk': {
      'en': 'Weight (gm)',
      'ar': 'الوزن (جم)',
    },
    'zgjdoid7': {
      'en': 'Product weight',
      'ar': 'وزن المنتج',
    },
    'y15bch4h': {
      'en': '',
      'ar': '',
    },
    'ldgpe6a1': {
      'en': 'weight (gm)',
      'ar': 'الوزن (جم)',
    },
    'kgrds90q': {
      'en': 'Stock Alert (Min Level)',
      'ar': 'تنبيه الأسهم (المستوى الأدنى)',
    },
    'x1r0a59m': {
      'en': 'Minimum stock alert',
      'ar': 'تنبيه الحدالأدني للمخزون',
    },
    'cypb8iie': {
      'en': '',
      'ar': '',
    },
    'etiuixye': {
      'en': 'Number Input',
      'ar': 'ادخال الرقم',
    },
    '1enwt7ps': {
      'en': 'Return Details',
      'ar': 'تفاصيل الارجاع',
    },
    '126fxxcd': {
      'en': 'is this product returnable ?',
      'ar': 'هل هذا المنتج قابل للارجاع ؟',
    },
    'jdnhpfbx': {
      'en': 'Is the product currently in the return process?',
      'ar': 'هل المنتج حاليا في عملية الارجاع ؟',
    },
    'okqd9ij2': {
      'en': 'Is return allowed?',
      'ar': 'هل يسمح بالارجاع ؟',
    },
    'h6funpnb': {
      'en': 'Is return allowed?',
      'ar': 'هل يسمح بالارجاع ؟',
    },
    'vxd6o188': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    '9ozthz80': {
      'en': 'No',
      'ar': 'لا',
    },
    '3yg11vsa': {
      'en': 'Return within Days after purchase',
      'ar': 'مقارنة السعر (اختياري)',
    },
    '9unx1z41': {
      'en':
          'The product must be returned within the specified return period after delivery.',
      'ar': 'يجب إرجاع المنتج خلال فترة الإرجاع المحددة بعد التسليم.',
    },
    'z6dyyqhi': {
      'en': '',
      'ar': '',
    },
    'p8wewgq8': {
      'en': '0',
      'ar': '0',
    },
    'ncgrkw9y': {
      'en': 'Non Refund Details',
      'ar': 'تفاصيل غير قابلة للاسترداد',
    },
    '7opmnwz5': {
      'en': 'Is refund allowed?',
      'ar': 'هل يسمح باسترجاع المبلغ ؟',
    },
    '77iow79o': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    'c1z9k5wj': {
      'en': 'No',
      'ar': 'لا',
    },
    'bclrc0l9': {
      'en': 'Attributes ',
      'ar': 'الخصائص',
    },
    'ado85kd9': {
      'en': 'Add Attribute',
      'ar': 'إضافة خاصية',
    },
    'iqids588': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'ruboymsa': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'n2eropmn': {
      'en': 'Variations ',
      'ar': 'الاختيارات',
    },
    'f1vkzuwt': {
      'en': 'ID 01001',
      'ar': '',
    },
    'qb6m1q3s': {
      'en': 'Ready Made',
      'ar': 'جاهز',
    },
    'kgbuoxtq': {
      'en': 'Select...',
      'ar': '',
    },
    '8xc4h7uo': {
      'en': 'Search...',
      'ar': '',
    },
    '29e5q4wd': {
      'en': 'Ready Made',
      'ar': 'جاهز',
    },
    'hcxarw2e': {
      'en': 'Custom Made',
      'ar': '',
    },
    'lfzhxca8': {
      'en': 'Ready Made',
      'ar': 'جاهز',
    },
    'mul7swct': {
      'en': 'Select...',
      'ar': '',
    },
    'o4i839mb': {
      'en': 'Search...',
      'ar': '',
    },
    'ikwgnebb': {
      'en': 'Ready Made',
      'ar': 'جاهز',
    },
    '6hern69g': {
      'en': 'Custom Made',
      'ar': '',
    },
    'qo7c8jdv': {
      'en': 'Edit',
      'ar': 'تعديل',
    },
    '9xptkud1': {
      'en': 'Media ',
      'ar': 'الوسائط',
    },
    '1dtz6288': {
      'en': 'Add Media',
      'ar': 'اصافة وسائط',
    },
    'ugysq09s': {
      'en': 'SKU',
      'ar': '',
    },
    'iasngtm0': {
      'en': '',
      'ar': '',
    },
    'rwnzz3by': {
      'en': '',
      'ar': '',
    },
    'k25b1pqv': {
      'en': 'Input your number of days',
      'ar': 'أدخل عدد أيام التوصيل',
    },
    'rftfutjy': {
      'en': '4',
      'ar': '',
    },
    'ygcnrp85': {
      'en': 'Price',
      'ar': 'السعر',
    },
    'ue2kcraw': {
      'en': '',
      'ar': '',
    },
    'pzkd8yln': {
      'en': '',
      'ar': '',
    },
    'm0tv9ls7': {
      'en': 'Input your number of days',
      'ar': 'أدخل عدد أيام التوصيل',
    },
    'tolsbk6c': {
      'en': '4',
      'ar': '',
    },
    'nqahnws0': {
      'en': 'Sale Price',
      'ar': '',
    },
    'be9xg968': {
      'en': '',
      'ar': '',
    },
    'yst5746v': {
      'en': '',
      'ar': '',
    },
    'primnaxf': {
      'en': 'Input your number of days',
      'ar': 'أدخل عدد أيام التوصيل',
    },
    '86v9x589': {
      'en': '4',
      'ar': '',
    },
    '5ebxk71k': {
      'en': 'Stock',
      'ar': '',
    },
    'kzgycagx': {
      'en': '',
      'ar': '',
    },
    'okcniqtf': {
      'en': '',
      'ar': '',
    },
    'hm2hyria': {
      'en': 'Input your number of days',
      'ar': 'أدخل عدد أيام التوصيل',
    },
    '3hp2pqxs': {
      'en': '4',
      'ar': '',
    },
    'qmn6zqkk': {
      'en': 'ID 01001',
      'ar': '',
    },
    'ynws9gn5': {
      'en': 'Ready Made',
      'ar': 'جاهز',
    },
    'xqkt5c6q': {
      'en': 'Select...',
      'ar': '',
    },
    'zef0llos': {
      'en': 'Search...',
      'ar': '',
    },
    '8aixr6ld': {
      'en': 'Ready Made',
      'ar': 'جاهز',
    },
    'mvnafdj3': {
      'en': 'Custom Made',
      'ar': 'مصنوع حسب الطلب',
    },
    'amxtdlyt': {
      'en': 'Ready Made',
      'ar': 'جاهز',
    },
    'ee74tr3y': {
      'en': 'Select...',
      'ar': '',
    },
    'o64v5dd1': {
      'en': 'Search...',
      'ar': '',
    },
    'gkziohtc': {
      'en': 'Ready Made',
      'ar': 'جاهز',
    },
    'qw63yrc6': {
      'en': 'Custom Made',
      'ar': 'مصنوع حسب الطلب',
    },
    '9d3qhzyw': {
      'en': 'Edit',
      'ar': 'تعديل',
    },
    'uggf520h': {
      'en': 'Media ',
      'ar': 'الوسائط',
    },
    '0htvu7du': {
      'en': 'Add Media',
      'ar': 'اصافة وسائط',
    },
    'v0lccozx': {
      'en': 'Inventory',
      'ar': '',
    },
    'j5pna994': {
      'en': '',
      'ar': '',
    },
    '5j4c7e5j': {
      'en': 'Select...',
      'ar': '',
    },
    'eeykbe5a': {
      'en': 'Search...',
      'ar': '',
    },
    'f9uaaqts': {
      'en': 'Option 1',
      'ar': '',
    },
    '38h9n4wa': {
      'en': 'Option 2',
      'ar': '',
    },
    'acjidbjg': {
      'en': 'Option 3',
      'ar': 'inactive',
    },
    'oh4phwe3': {
      'en': 'Price',
      'ar': '',
    },
    'rk6qwxym': {
      'en': '',
      'ar': '',
    },
    'hg6tt2cb': {
      'en': '',
      'ar': '',
    },
    'g071m68m': {
      'en': 'Input your number of days',
      'ar': '',
    },
    'eotuakr9': {
      'en': '4',
      'ar': '',
    },
    '47p74130': {
      'en': '',
      'ar': '',
    },
    'gncuywdy': {
      'en': 'Variant',
      'ar': '',
    },
    'zmkc4hce': {
      'en': 'Price',
      'ar': '',
    },
    'i6shzxfm': {
      'en': '',
      'ar': '',
    },
    'mrr1umo7': {
      'en': 'Available',
      'ar': '',
    },
    'jgr05sfh': {
      'en': 'Close',
      'ar': 'يغلق',
    },
    '629oetbw': {
      'en': 'Save & Continue',
      'ar': 'حفظ ومتابعة',
    },
    'm8wieg9v': {
      'en': 'Featured Product',
      'ar': 'المنتج المميز',
    },
    '2lgkeoxf': {
      'en': 'Popular Product',
      'ar': 'منتج شائع',
    },
    'chxic0i7': {
      'en': 'Recommended Product',
      'ar': 'المنتج الموصى به',
    },
    'gw5h0ost': {
      'en': 'Visibility Status',
      'ar': 'حالة الرؤية',
    },
    'xtd8ohqv': {
      'en': '',
      'ar': '',
    },
    'j17kv0tb': {
      'en': 'active',
      'ar': '',
    },
    '82ez9u6j': {
      'en': 'Select...',
      'ar': '',
    },
    'tnazm1u3': {
      'en': 'Search...',
      'ar': '',
    },
    't4qb6hbc': {
      'en': 'Active',
      'ar': 'نشيط',
    },
    'uufdyeqk': {
      'en': 'Inactive',
      'ar': '',
    },
    'cnuovrl3': {
      'en': 'Draft',
      'ar': '',
    },
    'dexvipov': {
      'en': 'Request',
      'ar': '',
    },
    'u6q7xkym': {
      'en': 'Media ',
      'ar': 'وسائط',
    },
    'bfg9vd1d': {
      'en': 'Add Media',
      'ar': 'إضافة الوسائط',
    },
    '6pmffghe': {
      'en': 'Once an image is added, click on it to set as featured image.',
      'ar': 'وسائط',
    },
    'hcuj7n8x': {
      'en': 'Size Chart',
      'ar': 'جدول المقاسات',
    },
    'r4ebxf38': {
      'en': 'UK',
      'ar': 'المملكة المتحدة',
    },
    'n9i2igh4': {
      'en': 'Upload',
      'ar': 'رفع',
    },
    'bbnsq8qg': {
      'en': 'USA',
      'ar': 'الولايات المتحدة الأمريكية',
    },
    '7kl5phyz': {
      'en': 'Upload',
      'ar': 'رفع',
    },
    'aw4ptcgk': {
      'en': 'Size Chart',
      'ar': 'جدول المقاسات',
    },
    '4ztigp8c': {
      'en': 'Upload Chart',
      'ar': 'رفع',
    },
    'dmiprve3': {
      'en': 'Create New',
      'ar': 'رفع',
    },
    'o2119mgj': {
      'en': 'Recent Charts',
      'ar': 'جدول المقاسات',
    },
    'si33tao3': {
      'en': 'UK Size Chart',
      'ar': 'جدول المقاسات',
    },
    'p01i6n3k': {
      'en': 'Dress_size_chart_UK.jpeg',
      'ar': '',
    },
    '2zyqqfxb': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'k2ci12ny': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'n25yl6up': {
      'en': 'Dress_size_chart_UK.jpeg',
      'ar': '',
    },
    'k9qpx3xj': {
      'en': 'Dress_size_chart_US.jpeg',
      'ar': '',
    },
    'udnmjh69': {
      'en': 'US Size Chart',
      'ar': 'جدول المقاسات',
    },
    'do8j8qkk': {
      'en': 'Dress_size_chart_UK.jpeg',
      'ar': '',
    },
    '4dd5utaj': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'a504m2pi': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'l2crthch': {
      'en': 'Dress_size_chart_UK.jpeg',
      'ar': '',
    },
    'fxfirxg9': {
      'en': 'Dress_size_chart_US.jpeg',
      'ar': '',
    },
    'nq7n2y7y': {
      'en': 'Product Categories',
      'ar': 'فئات المنتجات',
    },
    'bqla3vrc': {
      'en': 'Product Tags',
      'ar': 'علامات المنتج',
    },
    'w4s3tbrg': {
      'en': 'Affiliation',
      'ar': 'انتساب',
    },
    'fchi435e': {
      'en': 'On',
      'ar': 'على',
    },
    'fsxw0mgg': {
      'en': 'Off',
      'ar': 'عن',
    },
    'fpmojqei': {
      'en': 'Affiliation',
      'ar': 'انتساب',
    },
    '332dpatm': {
      'en': 'Commission Rate',
      'ar': 'معدل العمولة',
    },
    'kwd24r2v': {
      'en': 'Set the commission as a percentage of the total order amount.',
      'ar': '',
    },
    '4o9wark5': {
      'en': '',
      'ar': '',
    },
    'c94vxcu5': {
      'en': 'Input your text',
      'ar': '',
    },
    'wrpdlwsu': {
      'en': '0',
      'ar': '0',
    },
    'm9fq9avz': {
      'en': 'Commission Points',
      'ar': 'نقاط العمولة',
    },
    'q4ezu54c': {
      'en': 'Set a fixed number of commission points earned per order.',
      'ar': '',
    },
    'gfslido1': {
      'en': '',
      'ar': '',
    },
    'p4vgm2hs': {
      'en': 'Input your text',
      'ar': '',
    },
    'az36plih': {
      'en': '0',
      'ar': '0',
    },
    '4i8xe5t3': {
      'en': 'End Date',
      'ar': 'نقاط العمولة',
    },
    'dy707jdl': {
      'en': '',
      'ar': '',
    },
    '48xxw6n5': {
      'en': 'Step Guidelines',
      'ar': '',
    },
    'dq1d56o3': {
      'en': '30%',
      'ar': '',
    },
    'f9vyflo2': {
      'en': 'Enter product title !!',
      'ar': 'أدخل اسم المنتج!',
    },
    'tl488p30': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1v3jsb8g': {
      'en': 'Input your text is required',
      'ar': '',
    },
    'zhw45c72': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'juxrag32': {
      'en': 'Input your text is required',
      'ar': '',
    },
    'vuduueju': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'y2hetj4g': {
      'en': 'Click refresh button to set  product SKU',
      'ar': 'انقر فوق زر التحديث لتعيين رمز المنتج',
    },
    'pptghnqf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '62pa2w9b': {
      'en': 'Enter cost price (internal) is required',
      'ar': '',
    },
    'i27l3j9x': {
      'en': 'Invalid input.',
      'ar': '',
    },
    'e25sfck9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '2xo3nxed': {
      'en': 'Enter selling price (visible) is required',
      'ar': '',
    },
    'qcnfmovh': {
      'en': 'Invalid input.',
      'ar': '',
    },
    '8yok58s8': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'seohpa3y': {
      'en': 'Enter estimated shipping date.',
      'ar': 'أدخل تاريخ الشحن المتوقع.',
    },
    '4d804syp': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'de3lrja0': {
      'en': 'Ener threshold limit for restocki',
      'ar': '',
    },
    'rsmbu88z': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xvh5l1t8': {
      'en': 'Add Product price !!',
      'ar': 'أضف سعر المنتج!',
    },
    'srbrh37g': {
      'en': 'Invalid input.',
      'ar': '',
    },
    'zqvju6jj': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'cn5w3d5i': {
      'en': 'Input your text is required',
      'ar': '',
    },
    'viap2h4a': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ueaib4p4': {
      'en': 'Enter product weight(gm)',
      'ar': 'أدخل وزن المنتج (جم)',
    },
    '5y58xixw': {
      'en': 'Invalid input.',
      'ar': '',
    },
    'loj7lkzj': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    'ssf1seb7': {
      'en': 'Input your text is required',
      'ar': '',
    },
    'pg3h242t': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    '9jj86x1h': {
      'en': '0 is required',
      'ar': '',
    },
    'pczw78wr': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    '8xguhz2l': {
      'en': '4 is required',
      'ar': '',
    },
    'jsuj5ejk': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    'uralyow6': {
      'en': '4 is required',
      'ar': '',
    },
    'vcnhbbnh': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    'i0s0lamn': {
      'en': '4 is required',
      'ar': '',
    },
    'f5dy5ysy': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    'vcmzd2gv': {
      'en': '4 is required',
      'ar': '',
    },
    '8psr0a9z': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    'rt8qbliu': {
      'en': '4 is required',
      'ar': '',
    },
    'ek6tr3wt': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    'pw0oxied': {
      'en': 'Input your text is required',
      'ar': '',
    },
    '2tepakvd': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    'yp7v77kl': {
      'en': 'Input your text is required',
      'ar': '',
    },
    '3dmmsljd': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    'b5ea3abm': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Orders
  {
    'cadko3fr': {
      'en': 'Orders',
      'ar': 'طلبات',
    },
    'zqpayald': {
      'en': 'Export',
      'ar': 'تصدير',
    },
    'za2425bn': {
      'en': 'More Actions',
      'ar': 'مزيد من الإجراءات',
    },
    'zssim88w': {
      'en': 'Search...',
      'ar': '',
    },
    'uiiyf2vl': {
      'en': 'More Actions',
      'ar': 'مزيد من الإجراءات',
    },
    '2tv7ymec': {
      'en': 'Filterable Orders',
      'ar': 'الطلبات القابلة للتصفية',
    },
    'lb3j1iik': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'mjnbo2xb': {
      'en': 'Search...',
      'ar': '',
    },
    '9ehe1nhf': {
      'en': 'Order ID',
      'ar': 'معرف الطلب',
    },
    'jmcjgepk': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    '0787bj4k': {
      'en': 'Customer',
      'ar': 'عميل',
    },
    'wxrmt409': {
      'en': 'Items',
      'ar': 'أغراض',
    },
    '27zaw3v2': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    '88sl7wa1': {
      'en': 'Payment Status',
      'ar': 'حالة الدفع',
    },
    'bf0knboq': {
      'en': 'All caught up!',
      'ar': 'لا توجد عناصر جديدة',
    },
    'wlqhmaex': {
      'en':
          'There are no pending payments right now—everything looks good on your end.',
      'ar':
          'لا توجد أي مدفوعات معلقة في الوقت الحالي - كل شيء يبدو جيدًا من جانبك.',
    },
    'uc67ikft': {
      'en': 'Order ID',
      'ar': 'معرف الطلب',
    },
    '5465504q': {
      'en': 'Customer',
      'ar': 'عميل',
    },
    'xsvhlqkm': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'rb359bio': {
      'en': 'products',
      'ar': '',
    },
    '8yjgqbef': {
      'en': 'Raise Shipping Request',
      'ar': 'رفع طلب الشحن',
    },
    'ffprqdyv': {
      'en': 'Delivered',
      'ar': 'تم التوصيل',
    },
    'vf5zy7q6': {
      'en': 'All caught up!',
      'ar': 'تم اللحاق بالجميع!',
    },
    'o2mcbbdy': {
      'en':
          'There are no pending payments right now—everything looks good on your end.',
      'ar':
          'لا توجد أي مدفوعات معلقة في الوقت الحالي - كل شيء يبدو جيدًا من جانبك.',
    },
    'zj1z33f4': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Order-Details
  {
    '84sv9hmf': {
      'en': 'Coupon',
      'ar': 'قسيمة خصم',
    },
    'mnn2gga6': {
      'en': 'Add Shipping details',
      'ar': 'إضافة تفاصيل الشحن',
    },
    'aic3klsn': {
      'en': 'Payment related comment',
      'ar': 'تعليق متعلق بالدفع',
    },
    'fxewxo9m': {
      'en': 'Payment related comment',
      'ar': 'تعليق متعلق بالدفع',
    },
    'z2arxl5e': {
      'en': 'Fulfilled',
      'ar': '',
    },
    'fhsy2nm2': {
      'en': 'Fulfilled',
      'ar': '',
    },
    'fspcb35m': {
      'en': 'January 8, 2025',
      'ar': '',
    },
    'h7h0trgy': {
      'en': 'Kuwait Post',
      'ar': '',
    },
    'yyk0u7b9': {
      'en': 'A4568791AZ',
      'ar': '',
    },
    '6wkoc51c': {
      'en': 'Select products to create shipping request.',
      'ar': 'حدد المنتجات لإنشاء طلب الشحن.',
    },
    'pfelt7ft': {
      'en': ' - ',
      'ar': '',
    },
    'r6aqox7k': {
      'en': 'Urban Style Dress ',
      'ar': '',
    },
    'v6sqy0z3': {
      'en': ' KD',
      'ar': '',
    },
    '968bt425': {
      'en': ' x ',
      'ar': '',
    },
    'hk00xd0o': {
      'en': 'To Customer - Shipping details',
      'ar': '',
    },
    'yytewfjv': {
      'en': 'Cancel Shipping',
      'ar': 'الاستلام من المصمم',
    },
    'jhpbn4ti': {
      'en': 'From Designer to Customer - Shipping details',
      'ar': '',
    },
    '1c63cged': {
      'en': 'Pickup from Designer',
      'ar': 'الاستلام من المصمم',
    },
    'js02m3hq': {
      'en': 'Recevied',
      'ar': 'الاستلام من المصمم',
    },
    'fyersqrq': {
      'en': 'Ready to Pickup ',
      'ar': 'جاهز للاستلام',
    },
    'w2knp7g4': {
      'en': 'Designer Processing',
      'ar': 'معالجة المصمم',
    },
    '7mgl65wi': {
      'en': 'Retry Delivery Request',
      'ar': 'طلب إعادة تسليم الطلب',
    },
    's6nudl3e': {
      'en': 'Cancel Shipping',
      'ar': 'الاستلام من المصمم',
    },
    '14ulbqfz': {
      'en': 'Subtotal',
      'ar': 'المجموع الفرعي',
    },
    'sh15kexj': {
      'en': ' Items',
      'ar': 'أغراض',
    },
    'yltezs3m': {
      'en': 'Shipping',
      'ar': 'تخفيض',
    },
    'ernzt72f': {
      'en': ' ',
      'ar': ' ',
    },
    'o641f7gs': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    '6ql8gucy': {
      'en': 'Paid by customer',
      'ar': '',
    },
    'mtykwqbr': {
      'en': 'KWD 0.000',
      'ar': '',
    },
    '7hdtlbfx': {
      'en': 'Payment due when invoice is sent',
      'ar': '',
    },
    '47ahmnci': {
      'en': 'Edit',
      'ar': '',
    },
    '92mv9svd': {
      'en': 'Send Invoice',
      'ar': '',
    },
    'efwqjy0x': {
      'en': 'Collect payment',
      'ar': '',
    },
    'uwyfs7ov': {
      'en': 'Return',
      'ar': 'يعود',
    },
    'dq9fiq9v': {
      'en': ' - ',
      'ar': '',
    },
    '6zqgsq4f': {
      'en': 'Urban Style Dress ',
      'ar': '',
    },
    '2s7wav58': {
      'en': ' KD',
      'ar': ' KD',
    },
    '3k8s4vd3': {
      'en': ' x ',
      'ar': 'x',
    },
    'obt6clvo': {
      'en': 'Total Quantity ',
      'ar': 'سبب العودة',
    },
    'ujvoeu2x': {
      'en': ':',
      'ar': '',
    },
    '2wxjrxht': {
      'en': 'Total Refund Amount ',
      'ar': 'سبب العودة',
    },
    '93w96vz7': {
      'en': ':',
      'ar': '',
    },
    'wkglcojd': {
      'en': 'Reason for Return ',
      'ar': 'سبب العودة',
    },
    '25w1nz4z': {
      'en': ':',
      'ar': '',
    },
    'km60wltd': {
      'en': 'Additional Comments ',
      'ar': 'تعليقات إضافية',
    },
    'xbfrwzkb': {
      'en': ':',
      'ar': '',
    },
    '1ivav6fe': {
      'en': 'Total Quantity : ',
      'ar': '',
    },
    'vj2jf0ma': {
      'en': 'Additional Comments ',
      'ar': 'تعليقات إضافية',
    },
    'npwrqn5d': {
      'en': 'Total Refund Amount: ',
      'ar': '',
    },
    'wn0au7nt': {
      'en': 'Additional Comments ',
      'ar': 'تعليقات إضافية',
    },
    'n94hrxf9': {
      'en': 'Approve',
      'ar': 'يعتمد',
    },
    'p13b2xri': {
      'en': 'Reject',
      'ar': 'يرفض',
    },
    'ijwwc5z8': {
      'en': 'Timeline',
      'ar': 'الجدول الزمني',
    },
    'xod57py0': {
      'en': 'Save ',
      'ar': 'يحفظ',
    },
    'wdeyf60s': {
      'en': '',
      'ar': '',
    },
    'o9yyed0t': {
      'en': 'Leave Comment',
      'ar': 'اترك تعليقا',
    },
    'v02rbm97': {
      'en': 'Track Order',
      'ar': 'تتبع الطلب',
    },
    'ov7gm458': {
      'en': 'Today',
      'ar': 'اليوم',
    },
    'g0v1xtfr': {
      'en': 'Your complaint as been raised at 9:42 AM',
      'ar': 'لقد تم تقديم شكواك في الساعة 9:42 صباحًا',
    },
    '8p1tj2j8': {
      'en': 'Your complaint as been raised at 9:42 AM',
      'ar': 'لقد تم تقديم شكواك في الساعة 9:42 صباحًا',
    },
    '39wlfilo': {
      'en': 'Today',
      'ar': 'اليوم',
    },
    'zjwkqpov': {
      'en': 'Your complaint as been raised at 9:42 AM',
      'ar': 'لقد تم تقديم شكواك في الساعة 9:42 صباحًا',
    },
    'jobqj7za': {
      'en': 'Your complaint as been raised at 9:42 AM',
      'ar': 'لقد تم تقديم شكواك في الساعة 9:42 صباحًا',
    },
    'pv9ed7sz': {
      'en': 'Customer',
      'ar': 'عميل',
    },
    '8kfrxasq': {
      'en': '1 order',
      'ar': '',
    },
    'pcq0z22e': {
      'en': 'Customer is tax-exempt',
      'ar': '',
    },
    '168smwrj': {
      'en': 'Contact information ',
      'ar': 'معلومات الاتصال',
    },
    '1djm79y9': {
      'en': 'Shipping address',
      'ar': 'عنوان الشحن',
    },
    '12m6vygc': {
      'en': 'Billing address',
      'ar': 'عنوان الفاتورة',
    },
    'kg8rf5ie': {
      'en': 'Same as shipping address',
      'ar': 'نفس عنوان الشحن',
    },
    'ehgap6th': {
      'en': 'Designer',
      'ar': 'مصمم',
    },
    'l3t63aq7': {
      'en': 'Bridal Wear ',
      'ar': '',
    },
    'pqx6slhm': {
      'en': 'Contact information ',
      'ar': 'معلومات الاتصال',
    },
    'eot2c5jf': {
      'en': 'Address',
      'ar': '',
    },
    '1swkiegn': {
      'en': 'Emma Williams',
      'ar': '',
    },
    '0mj03xi1': {
      'en': 'Kuwait City, Dubai, Riyadh',
      'ar': '',
    },
    '8qsfpemd': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Order-Shipping-Label
  {
    '7cuegrn1': {
      'en': 'Order Shipping labels',
      'ar': 'طلب ملصقات الشحن',
    },
    '3jar1yy4': {
      'en': 'Export',
      'ar': 'يصدّر',
    },
    'fga63upf': {
      'en': 'More Actions',
      'ar': '',
    },
    'lk2t0qmz': {
      'en': 'Search...',
      'ar': '',
    },
    'qcgrx2xt': {
      'en': 'More Actions',
      'ar': 'المزيد من الإجراءات',
    },
    'sgwt8yfg': {
      'en': 'Today',
      'ar': 'اليوم',
    },
    'k04monf9': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    'z4mulqhk': {
      'en': '3',
      'ar': '',
    },
    'v8cnrzxl': {
      'en': 'Ordered items over time',
      'ar': 'العناصر المطلوبة بمرور الوقت',
    },
    'wu9oxt7p': {
      'en': '6',
      'ar': '',
    },
    'hbu540o1': {
      'en': '250',
      'ar': '',
    },
    'xnjb8bkf': {
      'en': 'Returns',
      'ar': 'الإرجاعات',
    },
    '2le3cuwq': {
      'en': '0',
      'ar': '',
    },
    'q4kig6q0': {
      'en': 'Fulfilled orders over time',
      'ar': 'الطلبات المنجزة بمرور الوقت',
    },
    'mbjzrr7n': {
      'en': '0',
      'ar': '',
    },
    '9l8d7ds5': {
      'en': '250',
      'ar': '',
    },
    'zpt0exke': {
      'en': 'Delivered orders over time',
      'ar': 'تم تسليم الطلبات بمرور الوقت',
    },
    '8scoloim': {
      'en': '0',
      'ar': '',
    },
    'ed3skmfj': {
      'en': '250',
      'ar': '',
    },
    'kfpn47ne': {
      'en': 'Today',
      'ar': 'اليوم',
    },
    'jvm0ak8j': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    's8y70ajl': {
      'en': '3',
      'ar': '',
    },
    '18hs0vk2': {
      'en': 'Ordered items over time',
      'ar': 'العناصر المطلوبة بمرور الوقت',
    },
    'pgz6hn7j': {
      'en': '6',
      'ar': '',
    },
    '0njk5n7m': {
      'en': '250',
      'ar': '',
    },
    'expp05na': {
      'en': 'Returns',
      'ar': 'الإرجاعات',
    },
    'zjpvafux': {
      'en': '0',
      'ar': '',
    },
    '8dt9ybdw': {
      'en': 'Fulfilled orders over time',
      'ar': 'الطلبات المنجزة بمرور الوقت',
    },
    'bub3k014': {
      'en': '0',
      'ar': '',
    },
    'iztpgnjj': {
      'en': '250',
      'ar': '',
    },
    'p091p662': {
      'en': 'Delivered orders over time',
      'ar': 'تم تسليم الطلبات بمرور الوقت',
    },
    'zkgky0p9': {
      'en': '0',
      'ar': '',
    },
    '6ws9c7xr': {
      'en': '250',
      'ar': '',
    },
    'v0jp3ygo': {
      'en': 'All',
      'ar': '',
    },
    'mfwivq1k': {
      'en': 'Unfulfilled',
      'ar': '',
    },
    'cg2vkvfp': {
      'en': 'Delivered',
      'ar': '',
    },
    'u3tc7r1q': {
      'en': 'Open',
      'ar': '',
    },
    '9juo99jv': {
      'en': 'Closed',
      'ar': '',
    },
    's5x0h8sc': {
      'en': 'All',
      'ar': '',
    },
    'kv4hku27': {
      'en': 'All',
      'ar': 'الجميع',
    },
    '2p60rnyy': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'fhbyj4mi': {
      'en': 'Order',
      'ar': 'طلب',
    },
    's3uoky5u': {
      'en': '#4566',
      'ar': '',
    },
    'rmdfv3gw': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'b8vq8e7n': {
      'en': 'Today at 9:53 PM',
      'ar': 'اليوم الساعة 9:53 مساءً',
    },
    'qt7au8nw': {
      'en': 'Customer',
      'ar': 'عميل',
    },
    'dqovozih': {
      'en': 'Emma Williams',
      'ar': 'إيما ويليامز',
    },
    'sct5ioj0': {
      'en': 'Order Status',
      'ar': 'حالة الطلب',
    },
    'ruunsz51': {
      'en': 'Fulfilled',
      'ar': 'تم تحقيقها',
    },
    '8dmwwkm0': {
      'en': 'Actions',
      'ar': 'الإجراءات',
    },
    'd6s4behy': {
      'en': 'Create Shipping Label',
      'ar': 'إنشاء ملصق الشحن',
    },
    'fdplrzv5': {
      'en': 'Reject',
      'ar': '',
    },
    'p9t46ary': {
      'en': 'Approve',
      'ar': '',
    },
    '62q0zoq6': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Create-Shipping-Label
  {
    'd2txfogs': {
      'en': 'Create Shipping Labels',
      'ar': 'إنشاء ملصقات الشحن',
    },
    'v9dsx1ns': {
      'en': 'Order : ',
      'ar': 'طلب',
    },
    '3ugec36v': {
      'en': 'Create shipping labels',
      'ar': '',
    },
    'tz3gabol': {
      'en': 'Create shipping labels',
      'ar': '',
    },
    'rep1oqlz': {
      'en': 'Print packing slip',
      'ar': 'طباعة ورقة التعبئة والتغليف',
    },
    'oxa7k7vb': {
      'en': 'Notes',
      'ar': '',
    },
    'bmh3mnyb': {
      'en': 'First customer and order!',
      'ar': '',
    },
    'p2guo0mr': {
      'en': '',
      'ar': '',
    },
    'mcx3mmpy': {
      'en': 'First customer and order!',
      'ar': '',
    },
    'loo6kj16': {
      'en': 'Shipping address',
      'ar': '',
    },
    't8gc7f2s': {
      'en': 'Emma Williams',
      'ar': '',
    },
    '3vd6qe1v': {
      'en': 'Kuwait City, Dubai, Riyadh',
      'ar': '',
    },
    't3bbv33w': {
      'en': 'Pickup address',
      'ar': '',
    },
    'emidh1kg': {
      'en': ', ',
      'ar': '',
    },
    'bjdrux2j': {
      'en': ', ',
      'ar': '',
    },
    'yy8jdlau': {
      'en': ', ',
      'ar': '',
    },
    'bgx0jnoe': {
      'en': 'Kuwait City, Dubai, Riyadh',
      'ar': '',
    },
    'qkdjge1m': {
      'en': 'Drop address',
      'ar': '',
    },
    'oqot502k': {
      'en': ', ',
      'ar': '',
    },
    'y1ukwgzd': {
      'en': ', ',
      'ar': '',
    },
    'd8y4b8cl': {
      'en': ', ',
      'ar': '',
    },
    'vnxmamjt': {
      'en': 'Kuwait City, Dubai, Riyadh',
      'ar': '',
    },
    'yabyux4i': {
      'en': 'Selected by customer',
      'ar': '',
    },
    'ahu97m5e': {
      'en': 'Free shipping',
      'ar': '',
    },
    '6pv50e82': {
      'en': 'KWD 0.00',
      'ar': '',
    },
    '3l6nh163': {
      'en': 'Shipping service',
      'ar': '',
    },
    'f14aejs3': {
      'en': 'Sort by ',
      'ar': '',
    },
    'wdqcbvnu': {
      'en': '40.00 KWD',
      'ar': '',
    },
    '85x7gh8n': {
      'en': 'FedEx Home Delivery® by Shippo',
      'ar': '',
    },
    'i2ujki9o': {
      'en': 'KWD 10.00',
      'ar': '',
    },
    'cst9nyoc': {
      'en': 'Including insurance (up to KWD 100.00), tracking',
      'ar': '',
    },
    'zd8rzc7w': {
      'en': '1 business day',
      'ar': '',
    },
    'm6lm57mg': {
      'en': 'Item',
      'ar': '',
    },
    'wf93u9xf': {
      'en': 'Edit weight',
      'ar': '',
    },
    '842pn45f': {
      'en': 'White',
      'ar': '',
    },
    '5uuxrle5': {
      'en': ' / ',
      'ar': '',
    },
    '60zvdmd2': {
      'en': 'Urban Style Dress ',
      'ar': '',
    },
    '2akxf4q8': {
      'en': ' - ',
      'ar': '',
    },
    'sa89gcef': {
      'en': 'Urban Style Dress ',
      'ar': '',
    },
    'jiqzlprz': {
      'en': 'Quantity',
      'ar': '',
    },
    'uqmnn2pe': {
      'en': 'Package and weight',
      'ar': '',
    },
    'tx14g9sq': {
      'en': 'Add package',
      'ar': '',
    },
    'lhomwv7j': {
      'en': 'Select Package and weight',
      'ar': '',
    },
    'r3zoxn3k': {
      'en': 'Collapsed body text',
      'ar': '',
    },
    'pc9z54ql': {
      'en': 'Expanded body text',
      'ar': '',
    },
    'gyyqiq6x': {
      'en': 'Total Weight',
      'ar': '',
    },
    'eahvfvbo': {
      'en': '500',
      'ar': '',
    },
    '80cidqxl': {
      'en': 'gm',
      'ar': '',
    },
    '41ok5bpf': {
      'en': 'gm',
      'ar': '',
    },
    'znfmtutm': {
      'en': 'Search...',
      'ar': '',
    },
    'vk8t0eae': {
      'en': 'gm',
      'ar': '',
    },
    'ohylgb8t': {
      'en': 'kg',
      'ar': '',
    },
    '54ystbrz': {
      'en': 'Package Count',
      'ar': '',
    },
    'r2jwov2s': {
      'en': '1',
      'ar': '',
    },
    'mzdp2xi7': {
      'en': 'Summary',
      'ar': '',
    },
    'pat3icb5': {
      'en': 'Subtotal',
      'ar': '',
    },
    'hbvydgia': {
      'en': 'KWD 20.00',
      'ar': '',
    },
    'xjjcbie7': {
      'en': 'Azyaa plan discount ',
      'ar': '',
    },
    '7falfn55': {
      'en': 'KWD 20.00',
      'ar': '',
    },
    '00wb4y8b': {
      'en': 'Total',
      'ar': '',
    },
    'lk9ll464': {
      'en': 'KWD 20.00',
      'ar': '',
    },
    '5ziyl13b': {
      'en': 'Shipping date',
      'ar': '',
    },
    'ufw8bz6o': {
      'en': 'Today',
      'ar': '',
    },
    'v7o7yxnl': {
      'en': 'Collapsed body text',
      'ar': '',
    },
    'bnq5pxwp': {
      'en': 'Expanded body text',
      'ar': '',
    },
    'tuwgowp0': {
      'en': 'Send a ',
      'ar': '',
    },
    'netijh1v': {
      'en': 'shipping information',
      'ar': '',
    },
    '7o7xr71t': {
      'en': ' to the customer now.',
      'ar': '',
    },
    'bn41qqnk': {
      'en': 'Shipping date',
      'ar': '',
    },
    'fevt7lkv': {
      'en': 'By buying this Azyaa shipping label, I agree to the ',
      'ar': '',
    },
    'u4t5xg75': {
      'en': 'terms of services ',
      'ar': '',
    },
    'w5hxqu1m': {
      'en': 'Shipping date',
      'ar': 'تاريخ الشحن',
    },
    'd54zf9ld': {
      'en': 'Create shipping order',
      'ar': '',
    },
    'd23t4lr9': {
      'en': 'Create pickup order',
      'ar': 'إنشاء طلب الاستلام',
    },
    'k4w2vape': {
      'en': 'First customer and order! is required',
      'ar': '',
    },
    'rsmbu88z': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jfs7vn9r': {
      'en': '500 is required',
      'ar': '',
    },
    '5032htg0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '07ygomi4': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '2kmsaagi': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'semixund': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Inventory-backup
  {
    'zuixxfvb': {
      'en': 'Inventory',
      'ar': '',
    },
    '4p6jx49y': {
      'en': 'Export',
      'ar': '',
    },
    'jhlyxy3s': {
      'en': 'Import',
      'ar': '',
    },
    'om2t0sr0': {
      'en': 'View Inventory',
      'ar': '',
    },
    '8xu8kdft': {
      'en': 'All',
      'ar': '',
    },
    '83qzmfwg': {
      'en': 'Stock Managed by Designer',
      'ar': '',
    },
    'r498uuhq': {
      'en': 'Stock Managed by Azyaa',
      'ar': '',
    },
    'op1g4qvr': {
      'en': 'Low Stock Alert',
      'ar': '',
    },
    '67ksrqji': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'zp4lcem4': {
      'en': 'Search...',
      'ar': '',
    },
    '2z5iopt0': {
      'en': ' ',
      'ar': '',
    },
    'xo6zs1j4': {
      'en': 'Product',
      'ar': '',
    },
    '0n50fip7': {
      'en': 'SKU',
      'ar': '',
    },
    'zkn0y2yq': {
      'en': 'Restock ETA',
      'ar': '',
    },
    'h92pyixo': {
      'en': 'Name',
      'ar': '',
    },
    'qqvlbqhr': {
      'en': 'White / XS ',
      'ar': '',
    },
    'h9fs85o0': {
      'en': 'Total Stock',
      'ar': '',
    },
    'za1tkyu8': {
      'en': 'Alert Threshold',
      'ar': '',
    },
    'bbue5qqd': {
      'en': 'Current Status',
      'ar': '',
    },
    '6uwpysd7': {
      'en': ' In Stock',
      'ar': '',
    },
    'fot28am6': {
      'en': 'Restock',
      'ar': '',
    },
    '6yovq5yu': {
      'en': 'Restocked',
      'ar': '',
    },
    'yhoawt1q': {
      'en': ' ',
      'ar': '',
    },
    'hj4exdot': {
      'en': 'Product',
      'ar': '',
    },
    '16nkraqa': {
      'en': 'SKU',
      'ar': '',
    },
    '91dehp7m': {
      'en': 'Restock ETA',
      'ar': '',
    },
    'bnj7g9bq': {
      'en': 'Name',
      'ar': '',
    },
    'z3yeeizq': {
      'en': 'White / XS ',
      'ar': '',
    },
    'zwfc2knj': {
      'en': 'Total Stock',
      'ar': '',
    },
    'q7x6883v': {
      'en': 'KNET',
      'ar': '',
    },
    '72ro8bgu': {
      'en': 'Alert Threshold',
      'ar': '',
    },
    '63cp2bm0': {
      'en': 'KNET',
      'ar': '',
    },
    'guer3t5b': {
      'en': 'Current Status',
      'ar': '',
    },
    '5xs4ckc0': {
      'en': ' In Stock',
      'ar': '',
    },
    'y2d90xoq': {
      'en': ' ',
      'ar': '',
    },
    'zup8l235': {
      'en': 'Product',
      'ar': '',
    },
    'lcnxchfa': {
      'en': 'SKU',
      'ar': '',
    },
    'x66oohmc': {
      'en': 'Restock ETA',
      'ar': '',
    },
    '4k51jg4k': {
      'en': 'Name',
      'ar': '',
    },
    'yxpg9d4v': {
      'en': 'White / XS ',
      'ar': '',
    },
    '7dmafsgf': {
      'en': 'Total Stock',
      'ar': '',
    },
    'kvujruc8': {
      'en': 'KNET',
      'ar': '',
    },
    '7fupq4cd': {
      'en': 'Alert Threshold',
      'ar': '',
    },
    'ou1zuzdx': {
      'en': 'KNET',
      'ar': '',
    },
    'hfwp7qg0': {
      'en': 'Current Status',
      'ar': '',
    },
    'mezs62gt': {
      'en': ' In Stock',
      'ar': '',
    },
    '32d9t46u': {
      'en': ' ',
      'ar': '',
    },
    'yav3lp8z': {
      'en': 'Product',
      'ar': '',
    },
    'p6ypg61s': {
      'en': 'SKU',
      'ar': '',
    },
    's2ctxw3j': {
      'en': 'Restock ETA',
      'ar': '',
    },
    '84nap640': {
      'en': 'Name',
      'ar': '',
    },
    'qd5ihm88': {
      'en': 'White / XS ',
      'ar': '',
    },
    '2h41w7v0': {
      'en': 'Total Stock',
      'ar': '',
    },
    '8zp3f0nc': {
      'en': 'KNET',
      'ar': '',
    },
    '7hmh7zb5': {
      'en': 'Alert Threshold',
      'ar': '',
    },
    'ck0ojzx1': {
      'en': 'KNET',
      'ar': '',
    },
    'bhjipbeu': {
      'en': 'Current Status',
      'ar': '',
    },
    'kpj9azy5': {
      'en': ' In Stock',
      'ar': '',
    },
    'nhor3aox': {
      'en': 'Restock',
      'ar': '',
    },
    'l5kpvpuj': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Media
  {
    'x8xi72oz': {
      'en': 'Media',
      'ar': 'الوسائط',
    },
    'heupmbpg': {
      'en': 'Media Management',
      'ar': 'إدارة وسائل الإعلام',
    },
    'kzbr93m4': {
      'en': 'Export',
      'ar': 'تصدير',
    },
    'e2r6x0zo': {
      'en': 'Import',
      'ar': 'استيراد',
    },
    '09ytpu0c': {
      'en': 'More Actions',
      'ar': 'مزيد من الإجراءات',
    },
    'merefrwi': {
      'en': 'Search...',
      'ar': '',
    },
    'oajkpdvt': {
      'en': 'More Actions',
      'ar': 'مزيد من الإجراءات',
    },
    'uox34e18': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'jt3031mt': {
      'en': 'Pictures',
      'ar': 'الصور',
    },
    'xiiwuns0': {
      'en': 'Pictures',
      'ar': 'الصور',
    },
    '4fh60bui': {
      'en': 'Auto-Approval',
      'ar': 'الموافقة التلقائية',
    },
    '54l82njw': {
      'en': 'Search...',
      'ar': '',
    },
    '28uqjsmy': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Customer-support-list
  {
    'chkzqa1n': {
      'en': 'Customer & Support',
      'ar': 'خدمة العملاء والدعم',
    },
    'si66i3yw': {
      'en': 'More Actions',
      'ar': 'مزيد من الإجراءات',
    },
    'iurda8ka': {
      'en': 'Search...',
      'ar': '',
    },
    'khqkuczj': {
      'en': 'More Actions',
      'ar': 'مزيد من الإجراءات',
    },
    'knr68m7s': {
      'en': 'Total Support Requests',
      'ar': 'طلبات الدعم الإجمالية',
    },
    'a4qtjctd': {
      'en': '450 Open Tickets',
      'ar': '',
    },
    '7ytemcmm': {
      'en': 'Pending Support Tickets',
      'ar': '',
    },
    'zhal6nkx': {
      'en': '450 Open Tickets',
      'ar': '',
    },
    'i9k5lrzp': {
      'en': 'Resolved Cases This Month',
      'ar': 'القضايا التي تم حلها هذا الشهر',
    },
    'ben3zxzf': {
      'en': '320 Issues Fixed',
      'ar': '',
    },
    'e2merb3o': {
      'en': 'Average Response Time',
      'ar': 'متوسط ​​وقت الاستجابة',
    },
    'im3k9b51': {
      'en': '1.5 Hours',
      'ar': '',
    },
    '306u1930': {
      'en': 'Escalated Cases',
      'ar': '',
    },
    '3cnlmjk3': {
      'en': '15 Urgent Issues',
      'ar': '',
    },
    'kamnit37': {
      'en': 'Total Support Requests',
      'ar': '',
    },
    '0o3ewrl1': {
      'en': '450 Open Tickets',
      'ar': '',
    },
    's4lq6yxm': {
      'en': 'Pending Support Tickets',
      'ar': '',
    },
    'rwimqxs7': {
      'en': '450 Open Tickets',
      'ar': '',
    },
    'f6upev4e': {
      'en': 'Resolved Cases This Month',
      'ar': '',
    },
    'xkrtohtj': {
      'en': '320 Issues Fixed',
      'ar': '',
    },
    'g04154zp': {
      'en': 'Average Response Time',
      'ar': '',
    },
    '21mceezr': {
      'en': '1.5 Hours',
      'ar': '',
    },
    'e7et5rgj': {
      'en': 'Escalated Cases',
      'ar': '',
    },
    'q2pmuwhg': {
      'en': '15 Urgent Issues',
      'ar': '',
    },
    'fm8pyvxy': {
      'en': 'Support Tickets',
      'ar': '',
    },
    'kf0povtq': {
      'en': 'Live Chat Support',
      'ar': '',
    },
    'mtcnwond': {
      'en': 'Refund & Dispute Resolution',
      'ar': '',
    },
    'glu14jwh': {
      'en': 'Support Tickets',
      'ar': '',
    },
    '4s9z97n3': {
      'en': 'Export',
      'ar': '',
    },
    'jkm3t1nb': {
      'en': 'Ticket ID',
      'ar': '',
    },
    'u236ivdy': {
      'en': '',
      'ar': '',
    },
    '2tg8rza5': {
      'en': 'Name',
      'ar': '',
    },
    '50cnte5c': {
      'en': '',
      'ar': '',
    },
    'ztttqs9g': {
      'en': 'Status',
      'ar': '',
    },
    '6uwwu8oe': {
      'en': '',
      'ar': '',
    },
    'b0j7obgd': {
      'en': 'Portfolio',
      'ar': '',
    },
    'emjhzgmx': {
      'en': '',
      'ar': '',
    },
    '70ba6ckh': {
      'en': 'Niche Category',
      'ar': '',
    },
    'wutfu0dk': {
      'en': 'Fashion',
      'ar': '',
    },
    'hu72z94r': {
      'en': '',
      'ar': '',
    },
    'njsm7e3w': {
      'en': 'Action',
      'ar': '',
    },
    '0kxvqtea': {
      'en': 'View Details',
      'ar': '',
    },
    'wtbygxwf': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Discounts
  {
    '6n08w9wv': {
      'en': 'Discounts',
      'ar': 'الخصومات',
    },
    'giewrjih': {
      'en': 'Set Promotional Banners',
      'ar': 'تعيين لافتات ترويجية',
    },
    'ivl6spfd': {
      'en': 'Manage Loyalty Program',
      'ar': 'إدارة برنامج الولاء',
    },
    '6xedlayi': {
      'en': 'More Actions',
      'ar': 'مزيد من الإجراءات',
    },
    'f5fl3x78': {
      'en': 'Search...',
      'ar': '',
    },
    'rcj1r3ut': {
      'en': 'More Actions',
      'ar': 'مزيد من الإجراءات',
    },
    '96joy86b': {
      'en': 'Create New Coupon',
      'ar': '',
    },
    'odic1ur4': {
      'en': 'Add New Promotion',
      'ar': '',
    },
    '60c3diz1': {
      'en': 'Add Creator',
      'ar': '',
    },
    '5lnabik7': {
      'en': 'Total Loyalty Members',
      'ar': 'أعضاء الولاء الكامل',
    },
    '7b25ckb4': {
      'en': '2000',
      'ar': '',
    },
    '2n2htogq': {
      'en': 'Gold Level Users',
      'ar': 'مستخدمو المستوى الذهبي',
    },
    '9kxlpfxb': {
      'en': '5000',
      'ar': '',
    },
    'nbpxr1ps': {
      'en': 'Points Redeemed',
      'ar': 'النقاط المستبدلة',
    },
    'skmvshpf': {
      'en': '2.5M',
      'ar': '',
    },
    'lqheclci': {
      'en': '250',
      'ar': '',
    },
    'qg8t2k4a': {
      'en': 'Coupons Redeemed',
      'ar': 'القسائم المستبدلة',
    },
    'ntjq0y1u': {
      'en': '1200',
      'ar': '',
    },
    '2ptgu6fy': {
      'en': 'Expiring Coupons',
      'ar': 'القسائم منتهية الصلاحية',
    },
    'ltn47eo9': {
      'en': '15 Offers',
      'ar': '',
    },
    'iu99nxxo': {
      'en': '250',
      'ar': '',
    },
    'f13ax9et': {
      'en': 'Active Promotions',
      'ar': 'العروض الترويجية النشطة',
    },
    'wtpmg6ba': {
      'en': '12 Campaigns',
      'ar': '',
    },
    'klh4b1c3': {
      'en': '250',
      'ar': '',
    },
    'r8ilzgt3': {
      'en': 'Total Loyalty Members',
      'ar': 'أعضاء الولاء الكامل',
    },
    'ijq515qr': {
      'en': '2000',
      'ar': '',
    },
    'vvkf6ck9': {
      'en': 'Gold Level Users',
      'ar': 'مستخدمو المستوى الذهبي',
    },
    '38qat37l': {
      'en': '5000',
      'ar': '',
    },
    'cwdt6998': {
      'en': 'Points Redeemed',
      'ar': 'النقاط المستبدلة',
    },
    'ar0hm2ad': {
      'en': '2.5M',
      'ar': '',
    },
    '3yl6uuqd': {
      'en': '250',
      'ar': '',
    },
    'agy5l77f': {
      'en': 'Coupons Redeemed',
      'ar': 'القسائم المستبدلة',
    },
    'mf8v2bz5': {
      'en': '1200',
      'ar': '',
    },
    '8c6bsfhw': {
      'en': 'Expiring Coupons',
      'ar': 'القسائم منتهية الصلاحية',
    },
    'xx5vshx9': {
      'en': '15 Offers',
      'ar': '',
    },
    'f5phauj3': {
      'en': '250',
      'ar': '',
    },
    'qu6weg3k': {
      'en': 'Active Promotions',
      'ar': 'العروض الترويجية النشطة',
    },
    'dxg2hfg4': {
      'en': '12 Campaigns',
      'ar': '',
    },
    '0hu5zc3a': {
      'en': '250',
      'ar': '',
    },
    '0oyrhwc6': {
      'en': 'Loyalty Rewards',
      'ar': 'مكافآت الولاء',
    },
    '0pp9vmhd': {
      'en': 'Coupons',
      'ar': 'كوبونات',
    },
    '71mpp3b9': {
      'en': 'Promotions',
      'ar': 'العروض الترويجية',
    },
    'ykw7uzq1': {
      'en': 'Coupons',
      'ar': 'كوبونات',
    },
    '080xudh1': {
      'en': 'Loyalty Program Management',
      'ar': 'إدارة برنامج الولاء',
    },
    'l9cp1wec': {
      'en': 'Silver',
      'ar': 'فضي',
    },
    'jip9pji0': {
      'en': 'Points Required',
      'ar': 'النقاط المطلوبة',
    },
    'djlv5wpj': {
      'en': '0 - 750 Points',
      'ar': '',
    },
    '2cypol7x': {
      'en': 'Benefits',
      'ar': 'الفوائد',
    },
    'g7oqp2y6': {
      'en': '1x Points, Free Shipping, Birthday Bonus',
      'ar': ' نقاط،1x  شحن مجاني، مكافأة عيد الميلاد',
    },
    'kj4g2mrj': {
      'en': 'Active Coupons',
      'ar': 'كوبونات نشطة',
    },
    '8jbe8w1k': {
      'en': 'Expired Coupons',
      'ar': 'القسائم منتهية الصلاحية',
    },
    '3cdxbsnd': {
      'en': 'Active Coupons',
      'ar': 'كوبونات نشطة',
    },
    'zkkfk4oi': {
      'en': 'Export',
      'ar': 'يصدّر',
    },
    'm9ctaohd': {
      'en': 'Monthly',
      'ar': '',
    },
    't1f7fr5n': {
      'en': 'Search...',
      'ar': '',
    },
    '31mh1lyb': {
      'en': 'Monthly',
      'ar': '',
    },
    'hmik1cc4': {
      'en': 'Weekly',
      'ar': '',
    },
    '3g7l2nwa': {
      'en': 'Day',
      'ar': '',
    },
    'icwak9zk': {
      'en': 'Coupon Code',
      'ar': 'كود القسيمة',
    },
    'hexgozo3': {
      'en': 'ADIDAS30',
      'ar': 'أديداس 30',
    },
    'evfmc74g': {
      'en': 'Discount',
      'ar': 'تخفيض',
    },
    'qxwc203s': {
      'en': '30% Off',
      'ar': 'خصم 30%',
    },
    'tb8fjw6n': {
      'en': 'Valid Until',
      'ar': 'صالحة حتى',
    },
    '1vvks187': {
      'en': 'Usage Limit',
      'ar': 'حد الاستخدام',
    },
    'njzbg6pk': {
      'en': 'Unlimited',
      'ar': 'غير محدود',
    },
    'mmbt6afw': {
      'en': 'Redeemed',
      'ar': 'مُخلّص',
    },
    'l8ov2tbk': {
      'en': '1,200 Uses',
      'ar': '1200 استخدام',
    },
    '0dm3s46e': {
      'en': 'Actions',
      'ar': 'الإجراءات',
    },
    'pq0zd8ks': {
      'en': 'Your coupon shelf is empty.',
      'ar': 'رف قسيمتك فارغ.',
    },
    'xzb9m8ay': {
      'en':
          'Once you create a discount, it’ll show up here and be ready to boost your sales.',
      'ar': 'بمجرد إنشاء خصم، سيظهر هنا وسيكون جاهزًا لتعزيز مبيعاتك.',
    },
    'hj766qid': {
      'en': 'Customer ID',
      'ar': '',
    },
    'dtn1d4dr': {
      'en': 'AYZ-345',
      'ar': '',
    },
    'k088qdgk': {
      'en': 'Date',
      'ar': '',
    },
    'e8rfxccz': {
      'en': 'Feb 12, 2025',
      'ar': '',
    },
    '5sklfjlx': {
      'en': 'Transaction',
      'ar': '',
    },
    'cj4wce8y': {
      'en': 'Order Purchase',
      'ar': '',
    },
    '5ttnh1en': {
      'en': 'Points Earned',
      'ar': '',
    },
    '2fz4b6te': {
      'en': '+150 Points',
      'ar': '',
    },
    '2e7wamxx': {
      'en': 'Points Used',
      'ar': '',
    },
    'r6z4hw9d': {
      'en': '-30 Points',
      'ar': '',
    },
    'ld3g3ju1': {
      'en': 'Status',
      'ar': '',
    },
    '1h7uh67y': {
      'en': '750 Points',
      'ar': '',
    },
    'av8dsss2': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Designer-Rejected
  {
    '8unib1jg': {
      'en': 'Location / City',
      'ar': 'الموقع / المدينة',
    },
    'k9w305py': {
      'en': 'Phone No',
      'ar': '',
    },
    'ucou9dup': {
      'en': 'Reevaluate',
      'ar': 'إعادة التقييم',
    },
    'doan7lkx': {
      'en': 'Delete',
      'ar': 'يمسح',
    },
    'fq05lx4x': {
      'en': '⚠  Reason for Rejection ',
      'ar': '⚠ سبب الرفض',
    },
    'e3vgjf4g': {
      'en': 'Reason for Rejection',
      'ar': 'سبب الرفض',
    },
    'fy3a8id7': {
      'en': 'Additional Comments (Optional)',
      'ar': 'تعليقات إضافية (اختياري)',
    },
    '3hdelel4': {
      'en': 'Personal Information',
      'ar': 'معلومات شخصية',
    },
    'frkv1btj': {
      'en': 'Experience',
      'ar': 'خبرة',
    },
    'kj1gyyzp': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'f3evikrq': {
      'en': 'Preferred Styles',
      'ar': 'الأنماط المفضلة',
    },
    'td0lgb1w': {
      'en': 'Availability for Custom Orders',
      'ar': 'التوفر للطلبات المخصصة',
    },
    'n6vr4ioz': {
      'en': 'Production Capacity',
      'ar': 'القدرة الإنتاجية',
    },
    'l51us481': {
      'en': 'Portfolio',
      'ar': 'مَلَفّ',
    },
    'r6k3gs8t': {
      'en': 'Alternative Phone',
      'ar': '',
    },
    'ukbjgma7': {
      'en': 'Alternative Email',
      'ar': 'البريد الإلكتروني البديل',
    },
    'j9py1sbe': {
      'en': 'Open for Events/Collaborations',
      'ar': 'مفتوح للأحداث/التعاون',
    },
    'bdjepe9v': {
      'en': 'References / Testimonials',
      'ar': 'المراجع / الشهادات',
    },
    'fwtz1yap': {
      'en': 'Professional Insights',
      'ar': '',
    },
    'wccialij': {
      'en': 'Portfolio / Work Samples / Additional Certifications',
      'ar': 'المحفظة / نماذج الأعمال / الشهادات الإضافية',
    },
    'gwymq79k': {
      'en': 'Images ',
      'ar': 'الصور',
    },
    'd7tsc4ds': {
      'en': 'IMG',
      'ar': 'اي ام جي',
    },
    '8gu01t51': {
      'en': 'PDF',
      'ar': 'ملف بي دي إف',
    },
    'hdk96g5y': {
      'en': 'PDF',
      'ar': 'ملف بي دي إف',
    },
    'j3qsamf9': {
      'en': 'Identity Verification',
      'ar': 'التحقق من الهوية',
    },
    'jvfwchmy': {
      'en': 'IMG',
      'ar': 'اي ام جي',
    },
    'ujv1ucks': {
      'en': 'IMG',
      'ar': '',
    },
    'fbb1wnc3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Creator-Rejected
  {
    '8sjngmre': {
      'en': 'Location / City',
      'ar': 'الموقع / المدينة',
    },
    '600phndc': {
      'en': 'Phone No',
      'ar': '',
    },
    '6gf8uvu1': {
      'en': 'Reevaluate',
      'ar': '',
    },
    '366z4yb1': {
      'en': 'Delete',
      'ar': '',
    },
    'vxpuxt65': {
      'en': 'Location / City',
      'ar': 'الموقع / المدينة',
    },
    'ss8zswsi': {
      'en': 'Phone No',
      'ar': '',
    },
    'qk7z3o6o': {
      'en': 'Reevaluate',
      'ar': '',
    },
    '6resb825': {
      'en': 'Delete',
      'ar': '',
    },
    '0z40jrhd': {
      'en': '⚠  Reason for Rejection ',
      'ar': '⚠ سبب الرفض',
    },
    'xfrm3c7s': {
      'en': 'Reason for Rejection',
      'ar': 'سبب الرفض',
    },
    's63dzvld': {
      'en': 'Additional Comments (Optional)',
      'ar': 'تعليقات إضافية (اختياري)',
    },
    '1kgrvkoi': {
      'en': 'Personal Information',
      'ar': 'معلومات شخصية',
    },
    '9acd4nmc': {
      'en': 'Experience',
      'ar': '',
    },
    'wode2s23': {
      'en': 'Email',
      'ar': '',
    },
    'mp956biy': {
      'en': 'Preferred Styles',
      'ar': '',
    },
    'kmsmdzkw': {
      'en': 'Availability for Custom Orders',
      'ar': '',
    },
    '669u4ja9': {
      'en': 'Production Capacity',
      'ar': '',
    },
    '5t394aw9': {
      'en': 'Portfolio',
      'ar': '',
    },
    'nnlq6894': {
      'en': 'Alternative Phone',
      'ar': '',
    },
    'e0kfxdip': {
      'en': 'Alternative Email',
      'ar': '',
    },
    'yygd47br': {
      'en': 'Open for Events/Collaborations',
      'ar': '',
    },
    's4gslqku': {
      'en': 'References / Testimonials',
      'ar': '',
    },
    '47rmcxz3': {
      'en': 'Professional Insights',
      'ar': '',
    },
    'hybfyqdt': {
      'en': 'Social Media & Portfolio',
      'ar': 'وسائل التواصل الاجتماعي والمحفظة',
    },
    'nbjek18i': {
      'en': 'Instagram Profile',
      'ar': 'الملف الشخصي على الانستغرام',
    },
    'wwmar1i4': {
      'en': 'TikTok Handle',
      'ar': 'مقبض تيك توك',
    },
    'p3ygsnn4': {
      'en': 'YouTube Channel',
      'ar': 'قناة اليوتيوب',
    },
    '3gin1il5': {
      'en': 'Other Social Media',
      'ar': '',
    },
    'qr66p3dt': {
      'en': 'Follower Count',
      'ar': '',
    },
    'lmfp888y': {
      'en': 'Engagement Rate',
      'ar': '',
    },
    'jrj7olir': {
      'en': 'IG: 8.5%, TikTok: 12%, YT: 5%',
      'ar': '',
    },
    't2o4ebah': {
      'en': 'Identity Verification',
      'ar': 'التحقق من الهوية',
    },
    '4xnw08l8': {
      'en': 'IMG',
      'ar': 'اي ام جي',
    },
    'tsf30pzf': {
      'en': 'IMG',
      'ar': '',
    },
    'jruxymx2': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Create-Shipping-Discounts
  {
    'yf3vj4g0': {
      'en': 'Create shipping Discounts',
      'ar': '',
    },
    '0mumkvl9': {
      'en': 'Duplicate',
      'ar': '',
    },
    'f8e9awcb': {
      'en': 'Deactivate',
      'ar': '',
    },
    'hvc1r3b6': {
      'en': 'Promote',
      'ar': '',
    },
    'nrcillef': {
      'en': 'More Actions',
      'ar': '',
    },
    'q76bu6yk': {
      'en': 'Search...',
      'ar': '',
    },
    'rhmojjqb': {
      'en': 'Promote',
      'ar': '',
    },
    'p99d6zhw': {
      'en': 'Create New Coupon',
      'ar': '',
    },
    'hldih3ye': {
      'en': 'Add New Promotion',
      'ar': '',
    },
    'v2bjxebt': {
      'en': 'FREESHIPPING10 was created successfully. What’s next?',
      'ar': '',
    },
    '99m03tdg': {
      'en':
          'Use a shareable link to promote your discount code via email or social media. This discount will be applied at checkout when customers use this link. ',
      'ar': '',
    },
    'qatyu14b': {
      'en': 'Get shareable link',
      'ar': '',
    },
    'vx9adkjq': {
      'en': 'Free shipping',
      'ar': '',
    },
    'bl0kg1gi': {
      'en': 'Shipping discount',
      'ar': '',
    },
    '68drnp7v': {
      'en': 'Method',
      'ar': '',
    },
    'ufzy4u3d': {
      'en': 'Discount Code',
      'ar': '',
    },
    'a5pzk4n0': {
      'en': 'Automatic Code',
      'ar': '',
    },
    '59zhyryz': {
      'en': 'Discount Code',
      'ar': '',
    },
    's4rxojfz': {
      'en': 'Discount Code',
      'ar': '',
    },
    '5xelnjdn': {
      'en': 'Generate random code',
      'ar': '',
    },
    'ajigj2ql': {
      'en': 'TextField',
      'ar': '',
    },
    'hd7fxdub': {
      'en': 'Customers must enter this code at checkout.',
      'ar': '',
    },
    'vwyt6w1a': {
      'en': 'Countries',
      'ar': '',
    },
    'pu0pkeos': {
      'en': 'All Countries',
      'ar': '',
    },
    'hmw7vgqr': {
      'en': 'All Countries',
      'ar': '',
    },
    'nhr33pdg': {
      'en': 'Selected countries',
      'ar': '',
    },
    'x0mnywty': {
      'en': 'Shipping rates',
      'ar': '',
    },
    'kfa1m3ye': {
      'en': 'Customers must enter this code at checkout.',
      'ar': '',
    },
    'h2b1bhal': {
      'en': 'Shipping date',
      'ar': '',
    },
    'zexdxzxm': {
      'en': 'Minimum purchase requirments',
      'ar': '',
    },
    '6lqtnnz6': {
      'en': 'No minimum requirements',
      'ar': '',
    },
    'pnyalnio': {
      'en': 'No minimum requirements',
      'ar': '',
    },
    'stsn8z18': {
      'en': 'Minimum purchase amount (KD)',
      'ar': '',
    },
    'zawix0fz': {
      'en': 'Minimum quantity of items',
      'ar': '',
    },
    'w036qpcj': {
      'en': 'Customer eligibility',
      'ar': '',
    },
    '6vueril8': {
      'en': 'All Customers',
      'ar': '',
    },
    'wi804g1n': {
      'en': 'All Customers',
      'ar': '',
    },
    '6zczf998': {
      'en': 'Specific customer segments',
      'ar': '',
    },
    'dwj94o57': {
      'en': 'specific customers',
      'ar': '',
    },
    '2hk42sn6': {
      'en': 'Maximum discount uses',
      'ar': '',
    },
    'umhrfqw8': {
      'en': 'Limit number of times this discount can be used in total',
      'ar': '',
    },
    'xh5db3o1': {
      'en': 'Shipping date',
      'ar': '',
    },
    'zlon7ygv': {
      'en': 'Limit to one use per customer',
      'ar': '',
    },
    'jbojldyk': {
      'en': 'Shipping date',
      'ar': '',
    },
    'dy2y7qla': {
      'en': 'Combinations',
      'ar': '',
    },
    'qbg7tufq': {
      'en': 'FREESHIPPING10',
      'ar': '',
    },
    'yidtfb1q': {
      'en': ' can be combined with:',
      'ar': '',
    },
    'ntfz8yi6': {
      'en': 'Combinations',
      'ar': '',
    },
    'b6p6qp60': {
      'en': 'Product discounts',
      'ar': '',
    },
    'gkd25w3g': {
      'en': 'Shipping date',
      'ar': '',
    },
    'xkfkp8bu': {
      'en': 'Order discounts',
      'ar': '',
    },
    '3mt0n24i': {
      'en': 'Shipping date',
      'ar': '',
    },
    'ur97a3ea': {
      'en':
          'No Order discounts are set to combined. To let customers use more than one discount, set up at least one order discount that combines with shipping discounts.',
      'ar': '',
    },
    'michtzip': {
      'en': 'Learn more',
      'ar': '',
    },
    '9vhantna': {
      'en': 'Free shipping',
      'ar': '',
    },
    'calzd3qe': {
      'en': 'Start date',
      'ar': '',
    },
    'xni4yb47': {
      'en': 'date',
      'ar': '',
    },
    'ekzfw4nf': {
      'en': 'Start time (AST)',
      'ar': '',
    },
    '38z0kxlg': {
      'en': 'date',
      'ar': '',
    },
    'slbtzuuu': {
      'en': 'Set end date',
      'ar': '',
    },
    '9m5qwzne': {
      'en': 'Shipping date',
      'ar': '',
    },
    'tuebfji2': {
      'en': 'Summary',
      'ar': '',
    },
    't5m09xe8': {
      'en': 'No discount code yet',
      'ar': '',
    },
    's2rffhid': {
      'en': 'Active',
      'ar': '',
    },
    'cnzfq3ij': {
      'en': 'Type and method',
      'ar': '',
    },
    'cehlmef1': {
      'en': 'Free shipping',
      'ar': '',
    },
    'yflv565p': {
      'en': 'Code',
      'ar': '',
    },
    '2n2ryzdt': {
      'en': 'Details',
      'ar': '',
    },
    'q1i8lcqp': {
      'en': 'Can’t combine with other discounts',
      'ar': '',
    },
    'w7wnqokm': {
      'en': 'Performance',
      'ar': '',
    },
    '4ibmkf4l': {
      'en': 'Discount is not active yet',
      'ar': '',
    },
    '3yrdq1yw': {
      'en': 'Home',
      'ar': '',
    },
  },
  // NewPromotion
  {
    '0yu1grr8': {
      'en': 'Add Promotion Banner',
      'ar': '',
    },
    'p5q8gitz': {
      'en': 'Duplicate',
      'ar': '',
    },
    'd5uafqxq': {
      'en': 'Deactivate',
      'ar': '',
    },
    '7zyujyus': {
      'en': 'Promote',
      'ar': '',
    },
    'xhe9tnsi': {
      'en': 'More Actions',
      'ar': '',
    },
    'axihqv6m': {
      'en': 'Search...',
      'ar': '',
    },
    'cg979ox8': {
      'en': 'Promote',
      'ar': '',
    },
    'tgw1tbwk': {
      'en': 'Create New Coupon',
      'ar': '',
    },
    'u6wyjhx5': {
      'en': 'Add New Promotion',
      'ar': '',
    },
    'sf38uhwl': {
      'en': 'FREESHIPPING10 was created successfully. What’s next?',
      'ar': '',
    },
    'mpa6md1z': {
      'en':
          'Use a shareable link to promote your discount code via email or social media. This discount will be applied at checkout when customers use this link. ',
      'ar': '',
    },
    'ab8dv6ql': {
      'en': 'Get shareable link',
      'ar': '',
    },
    'axq8uakz': {
      'en': 'Promotion Details',
      'ar': '',
    },
    'oma95yx2': {
      'en': 'Banner Title',
      'ar': '',
    },
    '8ewgwol3': {
      'en': 'Maximum 100 characters. No HTML or emoji allowed',
      'ar': '',
    },
    'cc5dgnra': {
      'en': 'Spring Sale - 30% Off Bridal Wear',
      'ar': '',
    },
    'kxpxhnmy': {
      'en': 'Display Section',
      'ar': '',
    },
    'q9x78rvg': {
      'en': 'Home Page',
      'ar': '',
    },
    'j9xrsns1': {
      'en': 'Select..',
      'ar': 'يختار..',
    },
    'qqmgfg4q': {
      'en': 'Search...',
      'ar': '',
    },
    '4tl2ud5i': {
      'en': 'Home Page',
      'ar': '',
    },
    '3h640lb5': {
      'en': 'Option 2',
      'ar': '',
    },
    'fhn56zo3': {
      'en': 'Option 3',
      'ar': '',
    },
    '74tbup1v': {
      'en': 'Start date',
      'ar': '',
    },
    'j2wja09n': {
      'en': 'date',
      'ar': '',
    },
    'g64c5iq4': {
      'en': 'Start time (AST)',
      'ar': '',
    },
    'vlosa21u': {
      'en': 'date',
      'ar': '',
    },
    'c709o0m9': {
      'en': 'Set end date',
      'ar': '',
    },
    'udoidpke': {
      'en': 'Shipping date',
      'ar': '',
    },
    '9zhdlmgf': {
      'en': 'Upload Image',
      'ar': '',
    },
    'q9a80nne': {
      'en': 'Png, Jpeg allowed.',
      'ar': '',
    },
    'kh16i9kq': {
      'en': 'Click or drop image',
      'ar': '',
    },
    'dqvqr8ja': {
      'en': 'Cancel',
      'ar': '',
    },
    'lsb84084': {
      'en': 'Save',
      'ar': '',
    },
    '0to95bkl': {
      'en': 'Preview',
      'ar': '',
    },
    'hyh25fzv': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Analytics
  {
    'fxevfkrp': {
      'en': 'Analytics',
      'ar': '',
    },
    '0fbv441q': {
      'en': 'Fulfilled',
      'ar': '',
    },
    '38xn5yye': {
      'en': 'Restock',
      'ar': '',
    },
    '5bvftmrw': {
      'en': 'Edit',
      'ar': '',
    },
    'zx90mlmj': {
      'en': 'More Actions',
      'ar': '',
    },
    'd7ca4v3x': {
      'en': 'Search...',
      'ar': '',
    },
    '46k08fa1': {
      'en': 'More Actions',
      'ar': '',
    },
    'jf92xoe9': {
      'en': 'Current Balance',
      'ar': '',
    },
    '3yylbh5h': {
      'en': 'More Actions',
      'ar': '',
    },
    'tcgl3z5m': {
      'en': 'Search...',
      'ar': '',
    },
    'nv8smwrr': {
      'en': 'All time',
      'ar': '',
    },
    'ed85nsnq': {
      'en': 'Earning',
      'ar': '',
    },
    'rohip98h': {
      'en': '500 KWD',
      'ar': '',
    },
    'qvi0vfac': {
      'en': '4.8%',
      'ar': '',
    },
    'jq62c8oa': {
      'en': 'from yesterday',
      'ar': '',
    },
    '5f2khht1': {
      'en': 'Customer',
      'ar': '',
    },
    'b6bw7sps': {
      'en': '500 KWD',
      'ar': '',
    },
    'nb34g9vg': {
      'en': '4.8%',
      'ar': '',
    },
    '0ndj06t4': {
      'en': 'from yesterday',
      'ar': '',
    },
    'bz8kiksp': {
      'en': 'Payouts',
      'ar': '',
    },
    '54pwpo7o': {
      'en': '500 KWD',
      'ar': '',
    },
    '6kz7la1x': {
      'en': '4.8%',
      'ar': '',
    },
    '3ifl1pnh': {
      'en': 'from yesterday',
      'ar': '',
    },
    'n0po08bo': {
      'en': 'Current Balance',
      'ar': '',
    },
    'mnc3fz8m': {
      'en': 'All time',
      'ar': '',
    },
    'dy50ptpe': {
      'en': 'Search...',
      'ar': '',
    },
    '21lru55t': {
      'en': 'All time',
      'ar': '',
    },
    'blm5nch4': {
      'en': 'Product',
      'ar': '',
    },
    '5t5a34j4': {
      'en': 'Designed by',
      'ar': '',
    },
    'mumi2m0w': {
      'en': '',
      'ar': '',
    },
    '58odcjq3': {
      'en': 'View Details',
      'ar': '',
    },
    'axpixwii': {
      'en': 'Products',
      'ar': '',
    },
    'ufa646a9': {
      'en': '124 KWD',
      'ar': '',
    },
    'sy5a1684': {
      'en': 'Views',
      'ar': '',
    },
    'kqch2sk3': {
      'en': '12',
      'ar': '',
    },
    'v6s41ob6': {
      'en': '4.8%',
      'ar': '',
    },
    'nm3c84k1': {
      'en': ' Comments',
      'ar': '',
    },
    'j2e70e9k': {
      'en': '123',
      'ar': '',
    },
    'js7gq5ug': {
      'en': '4.8%',
      'ar': '',
    },
    'r4d5yan4': {
      'en': 'Product views',
      'ar': '',
    },
    'psd1pdon': {
      'en': 'Products',
      'ar': '',
    },
    'sp2k14g6': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    '41lw89bc': {
      'en': 'Search...',
      'ar': '',
    },
    '4v69oevd': {
      'en': 'Market',
      'ar': '',
    },
    'b74wtaoe': {
      'en': 'Traffic sources',
      'ar': '',
    },
    '89wohmvv': {
      'en': 'Viewers',
      'ar': '',
    },
    'nz1deykc': {
      'en': 'Market',
      'ar': '',
    },
    'shendcfv': {
      'en': ' ',
      'ar': '',
    },
    'q2wa6qbj': {
      'en': 'Product',
      'ar': '',
    },
    'nqwnkei5': {
      'en': 'Status',
      'ar': '',
    },
    'pcon07x8': {
      'en': 'Price',
      'ar': '',
    },
    '3fs8eizw': {
      'en': '124 KWD',
      'ar': '',
    },
    'kkkf4fln': {
      'en': 'Sales',
      'ar': '',
    },
    '1kby56su': {
      'en': '1234',
      'ar': '',
    },
    '6nce3m19': {
      'en': '4.8%',
      'ar': '',
    },
    'gttd1chk': {
      'en': 'Views',
      'ar': '',
    },
    '0gtgeyxc': {
      'en': '1234',
      'ar': '',
    },
    'ctsjcwcn': {
      'en': '50%',
      'ar': '',
    },
    'pd5emcxh': {
      'en': 'Likes',
      'ar': '',
    },
    '8yafp8xs': {
      'en': '1234',
      'ar': '',
    },
    '2fvjsh3k': {
      'en': '50%',
      'ar': '',
    },
    'p4lssko6': {
      'en': 'Product',
      'ar': '',
    },
    '4vlmz6or': {
      'en': 'Instagram',
      'ar': '',
    },
    '2gusioj5': {
      'en': 'Facebook',
      'ar': '',
    },
    'saubjhci': {
      'en': 'Youtube',
      'ar': '',
    },
    'npptyo4l': {
      'en': 'Others',
      'ar': '',
    },
    '7bhjexcc': {
      'en': 'Product',
      'ar': '',
    },
    '0sr8lq7u': {
      'en': 'Product',
      'ar': '',
    },
    '67f4gqxr': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Finance
  {
    'vinhcfvp': {
      'en': 'Finances',
      'ar': '',
    },
    'qb6j1ed1': {
      'en': 'Fulfilled',
      'ar': '',
    },
    'hngxagcl': {
      'en': 'Net Sales',
      'ar': '',
    },
    'x91hn2ee': {
      'en': '250,000 KD',
      'ar': '',
    },
    'aof0oo2n': {
      'en': 'Gross Profit',
      'ar': '',
    },
    '13ugkrki': {
      'en': '120,000 KD',
      'ar': '',
    },
    'dyq2nu8p': {
      'en': 'Gross Margin',
      'ar': '',
    },
    'b61tw5vt': {
      'en': '48%',
      'ar': '',
    },
    'wzmfon8i': {
      'en': '250',
      'ar': '',
    },
    'tzgmqy39': {
      'en': 'Total Payouts',
      'ar': '',
    },
    '1jg90ul6': {
      'en': '120,000 KD',
      'ar': '',
    },
    '510vptvu': {
      'en': 'Order Revenue',
      'ar': '',
    },
    'kswupcab': {
      'en': '120,000 KD',
      'ar': '',
    },
    'oh42yg4s': {
      'en': 'Pending Payouts',
      'ar': '',
    },
    'h958dxmz': {
      'en': '120,000 KD',
      'ar': '',
    },
    'u0ox6ux6': {
      'en': 'Financial Breakdown',
      'ar': '',
    },
    'sr7wzc5n': {
      'en': 'Fulfilled',
      'ar': '',
    },
    'kh7jlkfk': {
      'en': 'Export',
      'ar': '',
    },
    'dymxt8ef': {
      'en': 'More Actions',
      'ar': '',
    },
    '1pvsxnyt': {
      'en': 'Search...',
      'ar': '',
    },
    'w0ospixa': {
      'en': 'More Actions',
      'ar': '',
    },
    'yvknsa3a': {
      'en': 'Earnings Breakdown',
      'ar': '',
    },
    '0jt21gky': {
      'en': 'Revenue from Orders',
      'ar': '',
    },
    't0ay6afb': {
      'en': '250,000 KD',
      'ar': '',
    },
    'q2qfxqe5': {
      'en': 'Designer Commission Earnings',
      'ar': '',
    },
    'vj4bwror': {
      'en': '250,000 KD',
      'ar': '',
    },
    'fzo1g0dr': {
      'en': 'Marketing Fees (Creators)',
      'ar': '',
    },
    'begbytr6': {
      'en': '250,000 KD',
      'ar': '',
    },
    'f5qrei92': {
      'en': 'Refunds Issued',
      'ar': '',
    },
    'pxa54uah': {
      'en': '250,000 KD',
      'ar': '',
    },
    'bn6twjnz': {
      'en': 'Expense Breakdown',
      'ar': '',
    },
    '61652z8k': {
      'en': 'Shipping Fees Paid',
      'ar': '',
    },
    'ws8usg3o': {
      'en': '250,000 KD',
      'ar': '',
    },
    '785e6fzw': {
      'en': 'Platform Fees Deducted',
      'ar': '',
    },
    'f9igp5e3': {
      'en': '250,000 KD',
      'ar': '',
    },
    '77oecms1': {
      'en': 'Promotional Discounts Given',
      'ar': '',
    },
    'bdjpfigu': {
      'en': '250,000 KD',
      'ar': '',
    },
    'lmpcvr2k': {
      'en': 'Earnings',
      'ar': '',
    },
    'y0gnar9h': {
      'en': 'Payouts',
      'ar': '',
    },
    '3lur2eou': {
      'en': 'Fees & Deductions',
      'ar': '',
    },
    'pv18prk0': {
      'en': 'Refunds & Chargebacks',
      'ar': '',
    },
    'gachp5pq': {
      'en': 'Earnings',
      'ar': '',
    },
    '77bzo09s': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    '4cyyxtaz': {
      'en': 'Search...',
      'ar': '',
    },
    'xcuy3bx4': {
      'en': 'Order ID',
      'ar': '',
    },
    'qht6q4nq': {
      'en': 'Date',
      'ar': '',
    },
    '1ug97gcw': {
      'en': '124 KWD',
      'ar': '',
    },
    'yxus42s9': {
      'en': 'Custoner',
      'ar': '',
    },
    '7yv5d9o2': {
      'en': '124 KWD',
      'ar': '',
    },
    'vplypss0': {
      'en': 'Refund Amount',
      'ar': '',
    },
    'c8bu18km': {
      'en': '124 KWD',
      'ar': '',
    },
    '8fxt9pv2': {
      'en': 'Status',
      'ar': '',
    },
    '8kzw5xa5': {
      'en': 'Reason',
      'ar': '',
    },
    'mam8954l': {
      'en': '124 KWD',
      'ar': '',
    },
    'z799eqt3': {
      'en': ' ',
      'ar': '',
    },
    'x2e7c8r1': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Settings
  {
    '3ncsbudp': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    'benacsko': {
      'en': 'Homepage options',
      'ar': 'خيارات الصفحة الرئيسية',
    },
    'ztxye4xw': {
      'en': 'Save changes',
      'ar': '',
    },
    '6ryidm9e': {
      'en': 'Payment Gateway',
      'ar': 'بوابة الدفع',
    },
    'lr89mr9b': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'kif4rmr1': {
      'en': 'Search...',
      'ar': '',
    },
    'srnpa2yh': {
      'en': 'Production Mode',
      'ar': 'وضع الإنتاج',
    },
    'i7ze7snj': {
      'en': 'Test Credentials',
      'ar': 'بيانات اعتماد الاختبار',
    },
    'mqj66f28': {
      'en': '',
      'ar': '',
    },
    '962ynedk': {
      'en': 'Test Credentials',
      'ar': '',
    },
    'c92mddwp': {
      'en': 'Production Credentials',
      'ar': 'بيانات اعتماد الإنتاج',
    },
    'c8y9qmfc': {
      'en': '',
      'ar': '',
    },
    'r2ndt6nq': {
      'en': 'Production Credentials',
      'ar': '',
    },
    '0itoqf3f': {
      'en': 'Company Settings',
      'ar': 'إعدادات الشركة',
    },
    'y5f4mo3t': {
      'en': 'Company Name',
      'ar': 'اسم الشركة',
    },
    's8h4g971': {
      'en': '',
      'ar': '',
    },
    'kbw9y4rt': {
      'en': 'Company Name',
      'ar': '',
    },
    '6mkuuyca': {
      'en': 'Website',
      'ar': 'موقع إلكتروني',
    },
    '61tt5mtg': {
      'en': '',
      'ar': '',
    },
    'fsiagouy': {
      'en': 'Website',
      'ar': '',
    },
    '670bap5o': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'jvgo80m3': {
      'en': '',
      'ar': '',
    },
    '36l26suy': {
      'en': 'Email',
      'ar': '',
    },
    'tw3kmugc': {
      'en': 'Form URL',
      'ar': 'عنوان URL للنموذج',
    },
    'wzx1zyv5': {
      'en': '',
      'ar': '',
    },
    'cm9orysk': {
      'en': 'Form URL',
      'ar': '',
    },
    'wvisod8n': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'ssir0h8w': {
      'en': '',
      'ar': '',
    },
    'oe2qeww4': {
      'en': 'Phone Number',
      'ar': '',
    },
    '92w8tw6b': {
      'en': 'Phone OTP Type',
      'ar': 'نوع OTP للهاتف',
    },
    'lmzrjuoq': {
      'en': '',
      'ar': '',
    },
    'xprir25z': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    'pqfkq2lx': {
      'en': '',
      'ar': '',
    },
    '9fw5k23w': {
      'en': 'Privacy Policy',
      'ar': '',
    },
    '7crkfr0w': {
      'en': 'Terms & Conditions',
      'ar': 'الشروط والأحكام',
    },
    'emja1t13': {
      'en': '',
      'ar': '',
    },
    'fv6g7pmz': {
      'en': 'Terms & Conditions',
      'ar': '',
    },
    'sxyvl6fk': {
      'en': 'Address',
      'ar': 'عنوان',
    },
    'tnd0q5cq': {
      'en': '',
      'ar': '',
    },
    'm12k8u12': {
      'en': 'Street, city',
      'ar': '',
    },
    'kdqfgw37': {
      'en': 'Disclaimer',
      'ar': 'تنصل',
    },
    'mjhaqhwr': {
      'en': '',
      'ar': '',
    },
    'g2y9enpb': {
      'en': 'Disclaimer',
      'ar': '',
    },
    'n06wl47p': {
      'en': 'Social Links',
      'ar': 'الروابط الاجتماعية',
    },
    'rqhpmn2o': {
      'en': 'Facebook',
      'ar': 'فيسبوك',
    },
    's4xfeeub': {
      'en': '',
      'ar': '',
    },
    'khun6cqx': {
      'en': 'Facebook',
      'ar': '',
    },
    'azsh9hir': {
      'en': 'Instagram',
      'ar': 'إنستغرام',
    },
    'tijckh00': {
      'en': '',
      'ar': '',
    },
    'o05yogjo': {
      'en': 'Instagram',
      'ar': '',
    },
    '3vzrpd1r': {
      'en': 'Linkedin',
      'ar': 'لينكدإن',
    },
    '9cx8ub8y': {
      'en': '',
      'ar': '',
    },
    'aaimifef': {
      'en': 'Linkedin',
      'ar': '',
    },
    '22z78y6l': {
      'en': 'Twitter',
      'ar': 'تغريد',
    },
    'wns4jsai': {
      'en': '',
      'ar': '',
    },
    'n2t601hg': {
      'en': 'Twitter',
      'ar': '',
    },
    'daxp0zbx': {
      'en': 'Whatsapp',
      'ar': 'واتساب',
    },
    'rf0m4dvz': {
      'en': '',
      'ar': '',
    },
    'fwzksmd2': {
      'en': 'Whatsapp',
      'ar': '',
    },
    'qfpbjqyb': {
      'en': 'Whatsapp',
      'ar': 'واتساب',
    },
    'm7bkxoke': {
      'en': '',
      'ar': '',
    },
    'p8mmhp6g': {
      'en': 'Azyaa Wherehouse Details',
      'ar': 'إعدادات الشركة',
    },
    'xbz5ut59': {
      'en': 'Contact name',
      'ar': 'اسم جهة الاتصال',
    },
    '3114l1wn': {
      'en': '',
      'ar': '',
    },
    'lgtlw3d2': {
      'en': 'Contact name',
      'ar': 'اسم جهة الاتصال',
    },
    'jq756i7f': {
      'en': 'Contact phone',
      'ar': 'هاتف التواصل',
    },
    'hoyt1p2i': {
      'en': '',
      'ar': '',
    },
    'wpmc0zgu': {
      'en': 'Contact phone',
      'ar': 'هاتف التواصل',
    },
    'smukgpvt': {
      'en': 'Street',
      'ar': 'الشارع',
    },
    'uv1cwc0r': {
      'en': '',
      'ar': '',
    },
    'pzj83iz7': {
      'en': 'Street,',
      'ar': 'شارع،',
    },
    'o3ssvbzg': {
      'en': 'City',
      'ar': 'عنوان',
    },
    '4tuuio4d': {
      'en': '',
      'ar': '',
    },
    '692mqzgf': {
      'en': 'City',
      'ar': 'مدينة',
    },
    'gmqdvcuw': {
      'en': 'Governorate',
      'ar': 'المحافظة',
    },
    'zga4dmmj': {
      'en': '',
      'ar': '',
    },
    'b5nm130n': {
      'en': 'Governorate',
      'ar': 'المحافظة',
    },
    '7yonh9ex': {
      'en': 'Country',
      'ar': 'عنوان',
    },
    'jm7gsscz': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'xitfqop7': {
      'en': 'Search...',
      'ar': '',
    },
    'ue4lp2du': {
      'en': 'Building',
      'ar': 'المبنى',
    },
    'bulqzbos': {
      'en': '',
      'ar': '',
    },
    'mp6hwge4': {
      'en': 'Building',
      'ar': 'المبنى',
    },
    'a9cr07d3': {
      'en': 'Location',
      'ar': 'عنوان',
    },
    '93142ib1': {
      'en': 'Logistics Details',
      'ar': 'إعدادات الشركة',
    },
    '2mv65l1m': {
      'en': 'Environmental',
      'ar': 'اسم الشركة',
    },
    'w8ealwc4': {
      'en': 'Production Mode',
      'ar': 'نمط الإنتاج',
    },
    'bj8h9i4h': {
      'en': 'Production Key',
      'ar': 'رقم التليفون',
    },
    '5ltdaitk': {
      'en': '',
      'ar': '',
    },
    '2xkmj9wc': {
      'en': 'Production Key',
      'ar': '',
    },
    '7av5rwzx': {
      'en': 'Test Key',
      'ar': 'عنوان',
    },
    'levthrag': {
      'en': '',
      'ar': '',
    },
    '4i2fyl8c': {
      'en': 'Test Key',
      'ar': 'مفتاح الاختبار',
    },
    'lri5xeb8': {
      'en': 'Shippng Charges in Kuwait',
      'ar': 'عنوان',
    },
    '4txb1vtb': {
      'en': '',
      'ar': '',
    },
    'o2o94ocu': {
      'en': 'Shippng Charges in Kuwait',
      'ar': '',
    },
    'ddmm3foj': {
      'en': 'Production Key',
      'ar': 'عنوان',
    },
    'lwlimgjt': {
      'en': '',
      'ar': '',
    },
    'g3ctl7ed': {
      'en': 'Production Key',
      'ar': 'مفتاح الإنتاج',
    },
    'c7n9ifmf': {
      'en': 'Shippng Charges in Kuwait',
      'ar': 'عنوان',
    },
    '04lklj0g': {
      'en': '',
      'ar': '',
    },
    '12oncnbh': {
      'en': 'Shippng Charges in Kuwait',
      'ar': '',
    },
    'm3imx7ps': {
      'en': 'Test Key',
      'ar': 'عنوان',
    },
    'e1i0z26p': {
      'en': '',
      'ar': '',
    },
    'bozio3r8': {
      'en': 'Test Key',
      'ar': '',
    },
    'czkzaatt': {
      'en': 'Shippng Charges in Kuwait',
      'ar': 'عنوان',
    },
    '96fgopmr': {
      'en': '',
      'ar': '',
    },
    '3z7pr1i3': {
      'en': 'Shippng Charges in Kuwait',
      'ar': 'رسوم الشحن في الكويت',
    },
    'gi1a32sp': {
      'en': 'Shippng Charges for 1st Half KG (GCC)',
      'ar': 'رسوم الشحن للنصف الأول من الكيلوجرام (دول مجلس التعاون الخليجي)',
    },
    'q10angz7': {
      'en': '',
      'ar': '',
    },
    'dly7e4hr': {
      'en': 'Shippng Charges in GCC1',
      'ar': 'رسوم الشحن في دول مجلس التعاون الخليجي 1',
    },
    'm79xqhjf': {
      'en': 'Shippng Charges for next each Half KG (GCC)',
      'ar': 'رسوم الشحن لكل نصف كيلوجرام التالي (دول مجلس التعاون الخليجي)',
    },
    '0nznq02p': {
      'en': '',
      'ar': '',
    },
    '7yyd05v4': {
      'en': 'Shippng Charges in GCC2',
      'ar': 'رسوم الشحن في دول مجلس التعاون الخليجي 2',
    },
    'ihiipppr': {
      'en': 'Admin Panel Color Theme',
      'ar': 'لون لوحة الإدارة',
    },
    'yuyu4mjn': {
      'en': 'Add',
      'ar': '+ إضافة',
    },
    '657zpn7l': {
      'en': 'App Update Notifier',
      'ar': 'مُنبه تحديث التطبيق',
    },
    'nx8wa5fx': {
      'en': 'Update Dismissible Status',
      'ar': 'تحديث حالة الرفض',
    },
    'xxaikeiv': {
      'en': 'Android app version',
      'ar': 'إصدار تطبيق أندرويد',
    },
    'vd5t7r21': {
      'en': '',
      'ar': '',
    },
    'n8imf0bv': {
      'en': 'IOS app version',
      'ar': 'إصدار تطبيق IOS',
    },
    'sqhfjyj0': {
      'en': '',
      'ar': '',
    },
    'rm7qy85f': {
      'en': 'Loyalty Points',
      'ar': 'نقاط الولاء',
    },
    '1qxnr107': {
      'en': '',
      'ar': '',
    },
    'kqpo75mo': {
      'en': '30',
      'ar': '0',
    },
    'z4zs1c3k': {
      'en': 'KD',
      'ar': 'إصدار تطبيق أندرويد',
    },
    'dw0os0mz': {
      'en': '',
      'ar': '',
    },
    'lywk2s2y': {
      'en': '50',
      'ar': '',
    },
    '7jed0rwk': {
      'en': 'Points ',
      'ar': 'إصدار تطبيق أندرويد',
    },
    '6ulzye6k': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'squb83c7': {
      'en': 'User App Waitlist Feature',
      'ar': 'ميزة قائمة انتظار تطبيق المستخدم',
    },
    '7dm61om4': {
      'en': 'User App Secret Key',
      'ar': 'مفتاح سري لتطبيق المستخدم',
    },
    'trrhp9gk': {
      'en': 'Generate',
      'ar': 'يولد',
    },
    'zklxz0et': {
      'en': 'Custom Promotion Duration',
      'ar': 'مُنبه تحديث التطبيق',
    },
    'mt9rlosj': {
      'en': '',
      'ar': '',
    },
    'ksmzbvh8': {
      'en': '10',
      'ar': '',
    },
    'c8ygh3wc': {
      'en': 'Days',
      'ar': 'إصدار تطبيق أندرويد',
    },
    'h4jd717y': {
      'en': 'Save',
      'ar': 'يولد',
    },
    'k9ik1wg3': {
      'en': 'OTP Sent by',
      'ar': 'تم إرسال OTP بواسطة',
    },
    '48pd6zu6': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'xugqssa6': {
      'en': 'Search...',
      'ar': '',
    },
    'pk7li5xg': {
      'en': 'otpless',
      'ar': 'otpless',
    },
    '08b9e02n': {
      'en': 'firebase',
      'ar': 'firebase',
    },
    'ie2fmtfr': {
      'en': 'In App-purchase',
      'ar': 'الشراء داخل التطبيق',
    },
    'secpfijp': {
      'en': 'App Catalog Mode',
      'ar': 'وضع كتالوج التطبيقات',
    },
    'ho2d7bb4': {
      'en': 'Category Status',
      'ar': 'حالة الفئة',
    },
    'gak5yeza': {
      'en': 'Phone OTP Status',
      'ar': 'حالة رمز التحقق لمرة واحدة على الهاتف',
    },
    'h16lkder': {
      'en': 'Current App Version',
      'ar': '',
    },
    'sabouaig': {
      'en': 'IOS',
      'ar': '',
    },
    'iu4h1qv9': {
      'en': 'Android',
      'ar': '',
    },
    '563e8ft8': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Product-Edit
  {
    '8k62qxwf': {
      'en': 'Edit Product',
      'ar': 'تحرير المنتج',
    },
    'rvacrddp': {
      'en': 'Product Details',
      'ar': 'تفاصيل المنتج',
    },
    't3fuetly': {
      'en': 'Product_type : ',
      'ar': 'نوع المنتج :',
    },
    'evnq5159': {
      'en': 'Custom Made',
      'ar': 'يغلق',
    },
    '7p3y7zdg': {
      'en': 'Product Title',
      'ar': 'عنوان المنتج',
    },
    'vou3lpck': {
      'en': 'Maximum 100 characters. No HTML or emoji allowed',
      'ar': '',
    },
    '4hxpmmnr': {
      'en': '',
      'ar': '',
    },
    'ndwcf0ix': {
      'en': 'Enter product name',
      'ar': 'أدخل النص الخاص بك',
    },
    'doffhmm2': {
      'en': 'Short Description',
      'ar': 'وصف مختصر',
    },
    '0hev2c0y': {
      'en': 'Short description of the product',
      'ar': '',
    },
    '6skht1hy': {
      'en': '',
      'ar': '',
    },
    'lv8tabpo': {
      'en': 'E.g. Premium handcrafted silk dress',
      'ar': 'أدخل النص الخاص بك',
    },
    'srut68r6': {
      'en': 'Description',
      'ar': 'وصف',
    },
    'lzx1ky41': {
      'en': 'Describe the product',
      'ar': '',
    },
    'xncng032': {
      'en': '',
      'ar': '',
    },
    'wljs5jx2': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'ugtyqzav': {
      'en': 'Select Designer',
      'ar': 'اختر المصمم',
    },
    '8fdxugi2': {
      'en': 'Designer of the product',
      'ar': '',
    },
    'z8sw64yt': {
      'en': 'SKU',
      'ar': 'رمز المنتج',
    },
    'qtb82jxt': {
      'en': 'SKU can have alphabets and numbers',
      'ar': '',
    },
    'sv82qp95': {
      'en': '',
      'ar': '',
    },
    '6r845bol': {
      'en': 'LUX-GOWN-2024',
      'ar': 'أدخل النص الخاص بك',
    },
    'uds76gu6': {
      'en': 'Product ID',
      'ar': 'معرف المنتج',
    },
    'eo6zkpgm': {
      'en': 'SKU can have alphabets and numbers',
      'ar': '',
    },
    'y0wjidro': {
      'en': '',
      'ar': '',
    },
    'pm5u2re0': {
      'en': 'LUX-GOWN-2024',
      'ar': 'أدخل النص الخاص بك',
    },
    'fn7qc0z0': {
      'en': 'Product Type',
      'ar': '',
    },
    '8cyrkqi9': {
      'en': '',
      'ar': '',
    },
    'z2vw6nbm': {
      'en': 'Ready Made',
      'ar': '',
    },
    'z8ws8bwp': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'iiqcqau6': {
      'en': 'Search...',
      'ar': '',
    },
    'sj2p3iw9': {
      'en': 'Ready Made',
      'ar': '',
    },
    'bjxfzv07': {
      'en': 'Custom Made',
      'ar': '',
    },
    'qtcskqvu': {
      'en': 'Cost',
      'ar': 'يكلف',
    },
    'eoeghpow': {
      'en': '',
      'ar': '',
    },
    '0lk13pmj': {
      'en': '',
      'ar': '',
    },
    'qne6i6fv': {
      'en': 'Enter cost price (internal)',
      'ar': 'أدخل النص الخاص بك',
    },
    'uw6m1lii': {
      'en': 'Price',
      'ar': 'سعر',
    },
    'cimrf4sz': {
      'en': '',
      'ar': '',
    },
    'rfinyxpo': {
      'en': '',
      'ar': '',
    },
    '2x42onxn': {
      'en': 'Enter selling price (visible)',
      'ar': 'أدخل النص الخاص بك',
    },
    'tit9w750': {
      'en': 'Estimate Shipping No. Date (If Ordered)',
      'ar': 'تقدير رقم الشحن والتاريخ (إذا تم الطلب)',
    },
    'iae934zr': {
      'en': 'Numbers only for shipping days ',
      'ar': '',
    },
    'oq0p47nn': {
      'en': '',
      'ar': '',
    },
    'xiet2fu1': {
      'en': 'Input your number of days',
      'ar': 'أدخل عدد الأيام الخاصة بك',
    },
    'thnfqpor': {
      'en': 'Virtual Tryon',
      'ar': 'ترايون الافتراضي',
    },
    '0zjw8vnn': {
      'en': 'Alert Threshold for Restock',
      'ar': 'تقدير عدد أيام الشحن(اذا تم الطلب)',
    },
    'b7ntd396': {
      'en': 'Alert to restock the product when its low stocked',
      'ar': 'تنبيه لإعادة تخزين المنتج عندما يكون مخزونه منخفضاً',
    },
    '7n23itpd': {
      'en': '',
      'ar': '',
    },
    'tohmcv8v': {
      'en': 'Input your number of days',
      'ar': 'أدخل عدد أيام التوصيل',
    },
    'd5zb9ktg': {
      'en': 'Notify Designer if Alert Threshold reached',
      'ar': 'قم بإخطار المصمم في حال الوصول إلى عتبة التنبيه',
    },
    'ebexv3n4': {
      'en': 'Yes',
      'ar': 'مفعل',
    },
    '8icsocmv': {
      'en': 'No',
      'ar': 'لا',
    },
    'pe26tspx': {
      'en': 'Virtual Tryon',
      'ar': 'تفاصيل المنتج',
    },
    'ru0whpia': {
      'en': 'On',
      'ar': 'حفظ ومتابعة',
    },
    'v3gu0sed': {
      'en': 'Off',
      'ar': 'يغلق',
    },
    't1sj8u6g': {
      'en': 'Pricing & Inventory',
      'ar': 'التسعير والمخزون',
    },
    'jg2rng5l': {
      'en': 'Stock Managed by Designer',
      'ar': 'Stock Managed by Designer',
    },
    '313hytwe': {
      'en': 'Stock Managed by Azyaa',
      'ar': 'Stock Managed by Azyaa',
    },
    'usbn7xbp': {
      'en': 'Stock Managed by Azyaa',
      'ar': '',
    },
    '2ngfux3m': {
      'en': 'Product Price',
      'ar': 'سعر المنتج',
    },
    'yylkfm9h': {
      'en': 'Only numbers are allowed',
      'ar': '',
    },
    'kxawaqpx': {
      'en': '',
      'ar': '',
    },
    '45smhnuj': {
      'en': '0',
      'ar': 'أدخل النص الخاص بك',
    },
    'vwi7guh2': {
      'en': 'Compare at Price (Optional)',
      'ar': 'مقارنة السعر (اختياري)',
    },
    'x0e7fg1v': {
      'en': 'Only numbers are allowed',
      'ar': '',
    },
    'z9dcqzwg': {
      'en': '',
      'ar': '',
    },
    '573iel04': {
      'en': '0',
      'ar': 'أدخل النص الخاص بك',
    },
    '69h8270w': {
      'en': 'Weight (gm)',
      'ar': 'كمية المخزون',
    },
    '4e8784e2': {
      'en': 'Only numbers are allowed',
      'ar': '',
    },
    's0ywvg5m': {
      'en': '',
      'ar': '',
    },
    'kyqm6i56': {
      'en': 'Number Input',
      'ar': 'أدخل النص الخاص بك',
    },
    'r86t3frp': {
      'en': 'Stock Alert (Min Level)',
      'ar': 'تنبيه الأسهم (المستوى الأدنى)',
    },
    '9scbrjg1': {
      'en': 'Only numbers are allowed',
      'ar': '',
    },
    'hzxi5i1z': {
      'en': '',
      'ar': '',
    },
    '5ox6omy8': {
      'en': 'Number Input',
      'ar': 'أدخل النص الخاص بك',
    },
    '6ck6m63w': {
      'en': 'Return Details',
      'ar': 'التسعير والمخزون',
    },
    'wqlbsn1h': {
      'en': 'is this product returnable ?',
      'ar': 'سعر المنتج',
    },
    'q723el83': {
      'en': 'Is the product currently in the return process?',
      'ar': '',
    },
    'pxfhe6z7': {
      'en': 'Is return allowed?',
      'ar': 'ترايون الافتراضي',
    },
    'lr9gmk8b': {
      'en': 'Is return allowed?',
      'ar': 'تفاصيل المنتج',
    },
    'h7o3up36': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    'tf4p6vtj': {
      'en': 'No',
      'ar': 'لا',
    },
    'xzs8ikr0': {
      'en': 'Return within Days after purchase',
      'ar': 'مقارنة السعر (اختياري)',
    },
    'spq9ue5q': {
      'en':
          'The product must be returned within the specified return period after delivery.',
      'ar': '',
    },
    'tbqt57ri': {
      'en': '',
      'ar': '',
    },
    'jwmejbye': {
      'en': '0',
      'ar': '0',
    },
    'tsfiiwpp': {
      'en': 'Non Refund Details',
      'ar': 'تفاصيل عدم الاسترداد',
    },
    'vo2dqxh2': {
      'en': 'Is refund allowed?',
      'ar': 'هل يسمح بإسترجاع المبلغ؟',
    },
    'v7pd3fb7': {
      'en': 'Yes',
      'ar': 'نعم',
    },
    '2wr9l874': {
      'en': 'No',
      'ar': 'لا',
    },
    'rrk7z539': {
      'en': 'Attributes ',
      'ar': 'صفات',
    },
    'l5a6zoko': {
      'en': 'Add Attribute',
      'ar': '',
    },
    'fgzx8cr5': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'zlov8ss3': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'nvmzts8z': {
      'en': 'Variations ',
      'ar': '',
    },
    'ds4rr7iu': {
      'en': 'ID 01001',
      'ar': '',
    },
    'i0cbqvrb': {
      'en': 'Ready Made',
      'ar': '',
    },
    '35mdncpd': {
      'en': 'Select...',
      'ar': '',
    },
    'keaqa9u2': {
      'en': 'Search...',
      'ar': '',
    },
    'zt9dkrud': {
      'en': 'Ready Made',
      'ar': '',
    },
    'idautkzc': {
      'en': 'Custom Made',
      'ar': '',
    },
    '8xki6m8h': {
      'en': 'Ready Made',
      'ar': '',
    },
    'd3rkzi37': {
      'en': 'Select...',
      'ar': '',
    },
    'n4rymadr': {
      'en': 'Search...',
      'ar': '',
    },
    'wqiw8xag': {
      'en': 'Ready Made',
      'ar': '',
    },
    '8ob5pjx8': {
      'en': 'Custom Made',
      'ar': '',
    },
    '598rrkzd': {
      'en': 'Edit',
      'ar': '',
    },
    'wh5iqgih': {
      'en': 'Media ',
      'ar': '',
    },
    '0fyx0bq3': {
      'en': 'Add Media',
      'ar': '',
    },
    'giu33k2z': {
      'en': 'SKU',
      'ar': '',
    },
    '4d4tvdw6': {
      'en': '',
      'ar': '',
    },
    'nzridgfm': {
      'en': '',
      'ar': '',
    },
    'qkm57ivd': {
      'en': 'Input your number of days',
      'ar': '',
    },
    'vp0j7qe4': {
      'en': '4',
      'ar': '',
    },
    'yznuqnn7': {
      'en': 'Price',
      'ar': '',
    },
    'ay9gy4bl': {
      'en': '',
      'ar': '',
    },
    'ha5swaks': {
      'en': '',
      'ar': '',
    },
    'xhx9ey7g': {
      'en': 'Input your number of days',
      'ar': '',
    },
    'm5w95d5g': {
      'en': '4',
      'ar': '',
    },
    'efa2lahl': {
      'en': 'Sale Price',
      'ar': '',
    },
    '7kpvr6iq': {
      'en': '',
      'ar': '',
    },
    'qf3kvcli': {
      'en': '',
      'ar': '',
    },
    'kz2hl6xz': {
      'en': 'Input your number of days',
      'ar': '',
    },
    'v2va2tfy': {
      'en': '4',
      'ar': '',
    },
    'xznsko6o': {
      'en': 'Stock',
      'ar': '',
    },
    'jnwyrpzw': {
      'en': '',
      'ar': '',
    },
    'zmwed4zl': {
      'en': '',
      'ar': '',
    },
    '7r5xhd8f': {
      'en': 'Input your number of days',
      'ar': '',
    },
    'owmk2awk': {
      'en': '4',
      'ar': '',
    },
    's58mwoo4': {
      'en': 'ID 01001',
      'ar': '',
    },
    'lgopwyfw': {
      'en': 'Ready Made',
      'ar': '',
    },
    '4sriab0c': {
      'en': 'Select...',
      'ar': '',
    },
    'lkmfsrnj': {
      'en': 'Search...',
      'ar': '',
    },
    'td727cct': {
      'en': 'Ready Made',
      'ar': '',
    },
    'f3am7q7a': {
      'en': 'Custom Made',
      'ar': '',
    },
    'oi90fd6q': {
      'en': 'Ready Made',
      'ar': '',
    },
    'ezreb8hs': {
      'en': 'Select...',
      'ar': '',
    },
    '4k3y5dfk': {
      'en': 'Search...',
      'ar': '',
    },
    'omjlgkvg': {
      'en': 'Ready Made',
      'ar': '',
    },
    'u6ewcgp4': {
      'en': 'Custom Made',
      'ar': '',
    },
    '9i159ayh': {
      'en': 'Edit',
      'ar': '',
    },
    'p0zsqd1d': {
      'en': 'Media ',
      'ar': '',
    },
    'rfzjbvpo': {
      'en': 'Add Media',
      'ar': '',
    },
    '847d0laz': {
      'en': 'Inventory',
      'ar': '',
    },
    '83o1yrqp': {
      'en': '',
      'ar': '',
    },
    'jcpyz3r9': {
      'en': 'Select...',
      'ar': '',
    },
    '2jxzday5': {
      'en': 'Search...',
      'ar': '',
    },
    '4wvzhptx': {
      'en': 'Option 1',
      'ar': '',
    },
    '8ewehs8p': {
      'en': 'Option 2',
      'ar': '',
    },
    'rjanc86p': {
      'en': 'Option 3',
      'ar': '',
    },
    'nv0694oo': {
      'en': 'Price',
      'ar': '',
    },
    'yvtiqpne': {
      'en': '',
      'ar': '',
    },
    'ie7zwc4p': {
      'en': '',
      'ar': '',
    },
    '8y6wgz4t': {
      'en': 'Input your number of days',
      'ar': '',
    },
    'r0cyj3sy': {
      'en': '4',
      'ar': '',
    },
    'ch0h7wlf': {
      'en': 'Close',
      'ar': 'يغلق',
    },
    'pjc93478': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    '9iw8r24f': {
      'en': 'Featured Product',
      'ar': 'المنتج المميز',
    },
    'fa169cb3': {
      'en': 'Popular Product',
      'ar': 'منتج شائع',
    },
    '42ghk634': {
      'en': 'Recommended Product',
      'ar': 'المنتج الموصى به',
    },
    '4gp1wu88': {
      'en': 'Visibility Status',
      'ar': 'حالة الرؤية',
    },
    'npbpj54x': {
      'en': '',
      'ar': '',
    },
    '3ibp803q': {
      'en': 'active',
      'ar': '',
    },
    'j395q4gb': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'dzvgpo40': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'ur9w6o2k': {
      'en': 'Active',
      'ar': '',
    },
    'bmkggufh': {
      'en': 'Inactive',
      'ar': '',
    },
    'ipy1zh96': {
      'en': 'Draft',
      'ar': '',
    },
    '1g0manyq': {
      'en': 'Request',
      'ar': '',
    },
    'x93anxnk': {
      'en': 'Media ',
      'ar': 'وسائط',
    },
    '1tir84vm': {
      'en': 'Add Media',
      'ar': 'إضافة الوسائط',
    },
    'ugzq4kx8': {
      'en': 'Once an image is added, click on it to set as featured image.',
      'ar': 'وسائط',
    },
    'ez5lbocr': {
      'en': 'Size Chart',
      'ar': 'جدول المقاسات',
    },
    'n5ryzav4': {
      'en': 'Upload Chart',
      'ar': 'رفع',
    },
    'w6rjhmd1': {
      'en': 'Create New',
      'ar': 'رفع',
    },
    '2dfv7vho': {
      'en': 'Recent Charts',
      'ar': 'جدول المقاسات',
    },
    'iabyk00e': {
      'en': 'UK Size Chart',
      'ar': 'جدول المقاسات',
    },
    'ji2pyitt': {
      'en': 'Dress_size_chart_UK.jpeg',
      'ar': '',
    },
    'cy09g0so': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    't9v305u9': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'x5d2baph': {
      'en': 'Dress_size_chart_UK.jpeg',
      'ar': '',
    },
    'dfgnbto5': {
      'en': 'Dress_size_chart_US.jpeg',
      'ar': '',
    },
    'wds3946f': {
      'en': 'US Size Chart',
      'ar': 'جدول المقاسات',
    },
    '9vw7u7q0': {
      'en': 'Dress_size_chart_UK.jpeg',
      'ar': '',
    },
    'g06bwstz': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'abmxsntd': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'do71bgxu': {
      'en': 'Dress_size_chart_UK.jpeg',
      'ar': '',
    },
    'mk62cxva': {
      'en': 'Dress_size_chart_US.jpeg',
      'ar': '',
    },
    '2031kzys': {
      'en': 'Product Categories',
      'ar': 'فئات المنتجات',
    },
    'ldz8ft9x': {
      'en': 'Product Tags',
      'ar': 'علامات المنتج',
    },
    '7uzlfbka': {
      'en': 'Affiliation',
      'ar': 'انتساب',
    },
    'agdm8ixw': {
      'en': 'On',
      'ar': 'على',
    },
    'n3847j8u': {
      'en': 'Off',
      'ar': 'عن',
    },
    'bbpu3hic': {
      'en': 'Affiliation',
      'ar': 'انتساب',
    },
    'k689wge0': {
      'en': 'Commission Rate',
      'ar': 'معدل العمولة',
    },
    'mxkh76ww': {
      'en': 'Number and decimal only.',
      'ar': '',
    },
    'yxnvaj7s': {
      'en': '',
      'ar': '',
    },
    'goyal9es': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'x7f6ll88': {
      'en': 'Commission Points',
      'ar': 'نقاط العمولة',
    },
    's8axww87': {
      'en': 'Commission points only have numbers',
      'ar': '',
    },
    '58jy5j33': {
      'en': '',
      'ar': '',
    },
    'zh6rlt35': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'sqe176ct': {
      'en': 'End Date',
      'ar': 'نقاط العمولة',
    },
    'v2wciv2q': {
      'en': 'Commission points only have numbers',
      'ar': '',
    },
    'iakfkhuo': {
      'en': 'Size Chart',
      'ar': 'جدول المقاسات',
    },
    '08kteu6z': {
      'en': 'UK',
      'ar': 'المملكة المتحدة',
    },
    'zig4tdq3': {
      'en': 'Upload',
      'ar': 'رفع',
    },
    '18rajym7': {
      'en': 'USA',
      'ar': 'الولايات المتحدة الأمريكية',
    },
    '2lqvqmes': {
      'en': 'Upload',
      'ar': 'رفع',
    },
    'le4bk8dj': {
      'en': 'Step Guidelines',
      'ar': '',
    },
    'zlivz6zg': {
      'en': '30%',
      'ar': '',
    },
    '8l4d9rnx': {
      'en': 'Enter product title !!',
      'ar': '',
    },
    'xvqetul3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'r2dx1xj0': {
      'en': 'Input your text is required',
      'ar': '',
    },
    'j3g2lfxu': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0cghdi5v': {
      'en': 'Input your text is required',
      'ar': '',
    },
    'ag2bu4ig': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'j81hhq2u': {
      'en': 'Add product SKU',
      'ar': '',
    },
    'umyys1zk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'e9oirs71': {
      'en': 'product_id is required',
      'ar': '',
    },
    '5032htg0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'bkqfht5j': {
      'en': 'Enter cost price (internal) is required',
      'ar': '',
    },
    '2kmsaagi': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1vfuh3yi': {
      'en': 'Enter selling price (visible) is required',
      'ar': '',
    },
    'omrpkssb': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'f6p9qv32': {
      'en': 'Enter estimated shipping date.',
      'ar': '',
    },
    'liykybbi': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'va1t7oyg': {
      'en': 'Enter threshold limit for restocki',
      'ar': 'أدخل الحد الأدنى لإعادة التخزين',
    },
    'ywhf51cc': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'e9qugmfp': {
      'en': 'Add Product price !!',
      'ar': '',
    },
    '1xy66mdj': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'iyiypknr': {
      'en': 'Input your text is required',
      'ar': '',
    },
    'vgyjb744': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'rwg1sxnj': {
      'en': 'Enter product weight(gm)',
      'ar': 'أدخل وزن المنتج (جم)',
    },
    '6agcbq7z': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5qlbksf8': {
      'en': 'Input your text is required',
      'ar': '',
    },
    'iydz8ehi': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ttt9pzie': {
      'en': '0 is required',
      'ar': '',
    },
    '6ia2u9p6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'uh1qh07f': {
      'en': '4 is required',
      'ar': '',
    },
    'i15645ug': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'kqtd7z3b': {
      'en': '4 is required',
      'ar': '',
    },
    'tm3go29d': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'iz6hvqm6': {
      'en': '4 is required',
      'ar': '',
    },
    'o6ssuxge': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'epq7119u': {
      'en': '4 is required',
      'ar': '',
    },
    'gtzrzij0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'o0pu72k4': {
      'en': '4 is required',
      'ar': '',
    },
    '2r5yb0oi': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ewsqx7sy': {
      'en': 'Input your text is required',
      'ar': '',
    },
    'atzoull0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5fa1j45w': {
      'en': 'Input your text is required',
      'ar': '',
    },
    '07pbj1uy': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'nx9ikzhc': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Customer-WaiterList
  {
    '2sb8pkhr': {
      'en': 'Waiting list customer',
      'ar': 'عميل قائمة الانتظار',
    },
    'a34hkcnw': {
      'en': 'New Customers ',
      'ar': 'العملاء الجدد',
    },
    'j7avtb8n': {
      'en': 'Accept Customers',
      'ar': 'قبول العملاء',
    },
    'kqpqrp7o': {
      'en': 'Completed Customers',
      'ar': 'العملاء المكتملون',
    },
    'rdnbpfoq': {
      'en': '250',
      'ar': '',
    },
    '4qyaimoy': {
      'en': 'Declined Customer',
      'ar': 'العميل المرفوض',
    },
    '3c4hrsey': {
      'en': 'New',
      'ar': 'جديد',
    },
    'uwfdqg63': {
      'en': 'Accept',
      'ar': 'يقبل',
    },
    '9s5lqon4': {
      'en': 'Complete',
      'ar': 'مكتمل',
    },
    '0mfkkvd7': {
      'en': 'Decline',
      'ar': 'انخفاض',
    },
    'vlp6ib5l': {
      'en': 'New',
      'ar': 'New',
    },
    '1rlccufk': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    '8h720cfd': {
      'en': 'Search...',
      'ar': '',
    },
    'v4iloom6': {
      'en': 'WaitList ID',
      'ar': 'معرف قائمة الانتظار',
    },
    'pfj4b06i': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'k9ppzkhn': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'x4b6otbn': {
      'en': 'Phone',
      'ar': 'هاتف',
    },
    'r6l0mkz8': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'iz2254mn': {
      'en': 'Time',
      'ar': 'وقت',
    },
    'kvopzdqu': {
      'en': 'Actions',
      'ar': 'الإجراءات',
    },
    'pyv94uf0': {
      'en': 'Hold tight, you’re almost there.',
      'ar': 'تمسك جيدا، أنت تقريبا هناك.',
    },
    'v3jopppw': {
      'en': 'We’ll let you know as soon as you\'re next in line!',
      'ar': 'سنخبرك بمجرد أن تصبح التالي في الطابور!',
    },
    'hi2v9lt3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Role
  {
    '42ueyfjr': {
      'en': 'Role',
      'ar': 'دور',
    },
    'jrj9e1vh': {
      'en': 'All Customers',
      'ar': '',
    },
    'ktl4mf8k': {
      'en': 'Reviews & Ratings',
      'ar': '',
    },
    'fblndmuf': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'jvue95lz': {
      'en': 'Search...',
      'ar': '',
    },
    'lant4ypm': {
      'en': ' Role ID',
      'ar': 'معرف الدور',
    },
    'pgvszh7d': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'lpgfaw6k': {
      'en': 'Key',
      'ar': 'مفتاح',
    },
    'zm94q54i': {
      'en': 'Action',
      'ar': 'فعل',
    },
    'ez4cvmep': {
      'en': 'View Details',
      'ar': 'عرض التفاصيل',
    },
    'ftz8ec1s': {
      'en': 'View Details',
      'ar': 'عرض التفاصيل',
    },
    '6yp2j94g': {
      'en': 'Home',
      'ar': '',
    },
  },
  // error404
  {
    'umornu1e': {
      'en': '404',
      'ar': '',
    },
    'z3cjz23k': {
      'en': 'Oops! The page you\'re looking for can\'t be found.',
      'ar': 'عفواً! الصفحة التي تبحث عنها غير موجودة.',
    },
    'xif89tzo': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'y3lpptqi': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Category
  {
    '5ymh7mnr': {
      'en': 'Category',
      'ar': 'فئة',
    },
    'c3162fat': {
      'en': 'Export',
      'ar': '',
    },
    'at2ijp0e': {
      'en': 'Import',
      'ar': '',
    },
    'd3a42495': {
      'en': 'More Actions',
      'ar': '',
    },
    'idytgg89': {
      'en': 'Search...',
      'ar': '',
    },
    'k42g9bzi': {
      'en': 'More Actions',
      'ar': '',
    },
    'xuyn9n6p': {
      'en': 'Add Category',
      'ar': 'إضافة المنتج',
    },
    'us5f4qqw': {
      'en': 'all',
      'ar': 'الجميع',
    },
    'gl30go2e': {
      'en': 'active',
      'ar': 'نشيط',
    },
    'rwu61q09': {
      'en': 'inactive',
      'ar': 'غير نشط',
    },
    'u4x84q9i': {
      'en': 'draft',
      'ar': 'مسودة',
    },
    'o12wmcbn': {
      'en': 'archived',
      'ar': 'مؤرشفة',
    },
    'jgl4rxhj': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'c1scs2e9': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'qyf7dtyr': {
      'en': 'ID',
      'ar': 'بطاقة تعريف',
    },
    '8h640t64': {
      'en': 'Name',
      'ar': 'اسم',
    },
    '5xwagdyy': {
      'en': 'Status',
      'ar': 'اسم',
    },
    'hqu7dics': {
      'en': ' ',
      'ar': '',
    },
    '82scec5j': {
      'en': 'Translation',
      'ar': 'يلغي',
    },
    'kxoicdfw': {
      'en': 'No orders with the applied filters',
      'ar': 'لا توجد طلبات مع المرشحات المطبقة',
    },
    '4n71q45o': {
      'en': 'Try changing the filters or search terms for this view.',
      'ar': 'حاول تغيير المرشحات أو مصطلحات البحث لهذا العرض.',
    },
    'x2oxyjzc': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Tags
  {
    '063nkddt': {
      'en': 'Tags',
      'ar': 'منتجات',
    },
    'qin4wq3i': {
      'en': 'Export',
      'ar': '',
    },
    'n7ld2895': {
      'en': 'Import',
      'ar': '',
    },
    '4ae0z4t5': {
      'en': 'More Actions',
      'ar': '',
    },
    '2jmxpx5p': {
      'en': 'Search...',
      'ar': '',
    },
    '3kwf2mwa': {
      'en': 'More Actions',
      'ar': '',
    },
    'jugw7p62': {
      'en': 'Add Tags',
      'ar': 'إضافة المنتج',
    },
    'kxcl60v1': {
      'en': 'Tag',
      'ar': 'Tag',
    },
    'uzfr6nuy': {
      'en': 'all',
      'ar': 'الجميع',
    },
    'zcpvw1pt': {
      'en': 'active',
      'ar': 'نشيط',
    },
    'kuaq6nii': {
      'en': 'inactive',
      'ar': 'غير نشط',
    },
    'pauy3dp4': {
      'en': 'draft',
      'ar': 'مسودة',
    },
    '6rln6vd3': {
      'en': 'archived',
      'ar': 'مؤرشفة',
    },
    'if4z85w7': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'k19oavi2': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'rs332u6x': {
      'en': 'ID',
      'ar': 'بطاقة تعريف',
    },
    'xf4aei8v': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'jnhhulzl': {
      'en': 'Status',
      'ar': 'اسم',
    },
    'xn06uqsc': {
      'en': ' ',
      'ar': '',
    },
    'lreym7ry': {
      'en': 'Translation',
      'ar': 'يلغي',
    },
    'bslscopd': {
      'en': 'No orders with the applied filters',
      'ar': 'لا توجد طلبات مع المرشحات المطبقة',
    },
    '40bw9gp6': {
      'en': 'Try changing the filters or search terms for this view.',
      'ar': 'حاول تغيير المرشحات أو مصطلحات البحث لهذا العرض.',
    },
    'l9m0iw1y': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Attributes
  {
    'knjxuuqj': {
      'en': 'Attributes',
      'ar': 'منتجات',
    },
    'qfybg70d': {
      'en': 'Export',
      'ar': '',
    },
    't5w72u35': {
      'en': 'Import',
      'ar': '',
    },
    'd72bovl8': {
      'en': 'More Actions',
      'ar': '',
    },
    '3dtrt7km': {
      'en': 'Search...',
      'ar': '',
    },
    'nkktc6tl': {
      'en': 'More Actions',
      'ar': '',
    },
    'w0s9p7ht': {
      'en': 'Add Attributes',
      'ar': 'إضافة المنتج',
    },
    'xll7d8gy': {
      'en': 'Attribute',
      'ar': 'Attribute',
    },
    'z9ah8v2b': {
      'en': 'all',
      'ar': 'الجميع',
    },
    'et278dej': {
      'en': 'active',
      'ar': 'نشيط',
    },
    'vzmnner2': {
      'en': 'inactive',
      'ar': 'غير نشط',
    },
    'cy6yaw6o': {
      'en': 'draft',
      'ar': 'مسودة',
    },
    'cmfiiayu': {
      'en': 'archived',
      'ar': 'مؤرشفة',
    },
    'iue3bcgb': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'kvjn1grg': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'vrjwqlgq': {
      'en': ' ID',
      'ar': '',
    },
    'vdmb1zp9': {
      'en': 'Name',
      'ar': 'بطاقة تعريف',
    },
    '30kyb6pa': {
      'en': 'Status',
      'ar': 'اسم',
    },
    'npdpazzw': {
      'en': 'Terms',
      'ar': 'شروط',
    },
    '1m45941z': {
      'en': 'Configure terms',
      'ar': 'تكوين الشروط',
    },
    'ivlnm5k4': {
      'en': 'Translation',
      'ar': 'يلغي',
    },
    'rgfr8h04': {
      'en': 'No orders with the applied filters',
      'ar': 'لا توجد طلبات مع المرشحات المطبقة',
    },
    's1rydaxn': {
      'en': 'Try changing the filters or search terms for this view.',
      'ar': 'حاول تغيير المرشحات أو مصطلحات البحث لهذا العرض.',
    },
    'cy8yx7ub': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Terms
  {
    'pjozm5xf': {
      'en': 'Attribute Terms',
      'ar': 'منتجات',
    },
    'k8d5s3d3': {
      'en': 'Export',
      'ar': '',
    },
    'h4r0ekhl': {
      'en': 'Import',
      'ar': '',
    },
    'x2kz9783': {
      'en': 'More Actions',
      'ar': '',
    },
    'vqs1o2pg': {
      'en': 'Search...',
      'ar': '',
    },
    'nj9l0ucc': {
      'en': 'More Actions',
      'ar': '',
    },
    'm1lsv90y': {
      'en': 'Add Terms',
      'ar': 'إضافة المنتج',
    },
    'enqme6x7': {
      'en': 'Term',
      'ar': 'Term',
    },
    't8et990y': {
      'en': 'all',
      'ar': 'الجميع',
    },
    'm00ozhy7': {
      'en': 'active',
      'ar': 'نشيط',
    },
    'hsy15b23': {
      'en': 'inactive',
      'ar': 'غير نشط',
    },
    'kzppmp3u': {
      'en': 'draft',
      'ar': 'مسودة',
    },
    'sc2e2eex': {
      'en': 'archived',
      'ar': 'مؤرشفة',
    },
    'pk4np7yy': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'll0bcfdg': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'd4h2kn85': {
      'en': 'Serial Number',
      'ar': 'رقم سري',
    },
    'zn63o08j': {
      'en': ' ID',
      'ar': '',
    },
    'alrx8x0c': {
      'en': 'Name',
      'ar': 'بطاقة تعريف',
    },
    'cl4qgtji': {
      'en': 'Status',
      'ar': 'اسم',
    },
    'gi2gr9t6': {
      'en': ' ',
      'ar': '',
    },
    'p1zbl2wk': {
      'en': 'Translation',
      'ar': 'يلغي',
    },
    'a8lcno7f': {
      'en': 'No orders with the applied filters',
      'ar': 'لا توجد طلبات مع المرشحات المطبقة',
    },
    'ntozv2ir': {
      'en': 'Try changing the filters or search terms for this view.',
      'ar': 'حاول تغيير المرشحات أو مصطلحات البحث لهذا العرض.',
    },
    'wlpivnby': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Translation
  {
    'k2gxsl5z': {
      'en': 'English',
      'ar': 'English',
    },
    'wf6n90rw': {
      'en': 'English',
      'ar': '',
    },
    'mvck1wbm': {
      'en': 'Search...',
      'ar': '',
    },
    '2fahpaby': {
      'en': 'English',
      'ar': 'English',
    },
    'abhc8omf': {
      'en': 'Arabic',
      'ar': 'Arabic',
    },
    'zdir9ehx': {
      'en': 'Pages',
      'ar': 'جميع العملاء',
    },
    'xgrz0uc3': {
      'en': 'Components',
      'ar': 'المراجعات والتقييمات',
    },
    'v0nw6mxk': {
      'en': 'Original',
      'ar': 'إبداعي',
    },
    'mls564w9': {
      'en': 'Name',
      'ar': '',
    },
    'yqn0dp70': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'j2smpjmv': {
      'en': 'Name',
      'ar': '',
    },
    'kwu6g4mp': {
      'en': 'Short Description',
      'ar': '',
    },
    'rxzr3qna': {
      'en': 'Name',
      'ar': '',
    },
    'blvapwyx': {
      'en': 'Description',
      'ar': '',
    },
    '8is0y6kx': {
      'en': 'Automated',
      'ar': 'آلي',
    },
    'rm9s82w5': {
      'en': 'Name',
      'ar': '',
    },
    'wjl44f73': {
      'en': 'Name',
      'ar': '',
    },
    'zqmy0aqn': {
      'en': 'Short Description EN',
      'ar': '',
    },
    '7d9vw0ko': {
      'en': 'Short Description AR',
      'ar': '',
    },
    'cqvpoap0': {
      'en': ' Description EN',
      'ar': '',
    },
    'sum4aa1l': {
      'en': ' Description AR',
      'ar': '',
    },
    'qc7q787k': {
      'en': 'Manual',
      'ar': 'آلي',
    },
    'cdyevum0': {
      'en': 'Name',
      'ar': '',
    },
    'nhv5atgi': {
      'en': 'Name',
      'ar': '',
    },
    'j9ivi9kh': {
      'en': 'Short Description EN',
      'ar': '',
    },
    'ywgjmx19': {
      'en': 'Short Description AR',
      'ar': '',
    },
    'eaoicxej': {
      'en': ' Description EN',
      'ar': '',
    },
    'xvp14j0m': {
      'en': ' Description AR',
      'ar': '',
    },
    'okfcmce9': {
      'en': 'Save & Continue',
      'ar': 'حفظ ومتابعة',
    },
    'k8anybfg': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Edit-profile
  {
    '3iw0tkob': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    'gixyyqoh': {
      'en': 'Profile Info',
      'ar': 'معلومات الملف الشخصي',
    },
    've43zi77': {
      'en': 'Bank Details',
      'ar': 'تفاصيل البنك',
    },
    '1ik4sjok': {
      'en': 'Profile Info',
      'ar': 'معلومات الملف الشخصي',
    },
    'jh09s9q7': {
      'en': 'Personal Information',
      'ar': 'معلومات شخصية',
    },
    'qyyczr45': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'f368a89x': {
      'en': 'Phone No',
      'ar': 'رقم الهاتف',
    },
    'kh35gqkc': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'l8tiziux': {
      'en': 'Location / City',
      'ar': 'الموقع / المدينة',
    },
    '0il202uu': {
      'en': 'Brand Name',
      'ar': '',
    },
    'y9qi2qum': {
      'en': 'Experience ',
      'ar': '',
    },
    'ord6cylx': {
      'en': 'Availability for Custom Orders',
      'ar': '',
    },
    'wp45ydbj': {
      'en': 'Platform Rate',
      'ar': '',
    },
    'rhcuj11m': {
      'en': 'Yes',
      'ar': '',
    },
    '5w73kvm8': {
      'en': 'Open for Events/Collaborations',
      'ar': '',
    },
    'ombh66ri': {
      'en': 'Production Capacity',
      'ar': '',
    },
    'fw8y3zd4': {
      'en': 'Portfolio',
      'ar': '',
    },
    '6ypv6w9o': {
      'en': 'References / Testimonials',
      'ar': '',
    },
    'aorw3zt0': {
      'en': 'Professional Insights',
      'ar': '',
    },
    'tqhm6gdo': {
      'en': 'dsaaaaaaaa',
      'ar': '',
    },
    'xiztfral': {
      'en': 'Pickup Address Details',
      'ar': 'معلومات شخصية',
    },
    'cma82eiz': {
      'en': 'Name',
      'ar': '',
    },
    '3o74d8ke': {
      'en': 'Mobile Number',
      'ar': '',
    },
    'csre0irh': {
      'en': 'Email',
      'ar': '',
    },
    '5lyrue2r': {
      'en': 'Street',
      'ar': 'الشارع',
    },
    'oq6xtrjh': {
      'en': 'City',
      'ar': '',
    },
    'mvcp67ma': {
      'en': 'Governorate',
      'ar': 'المحافظة',
    },
    'uxho0jjb': {
      'en': 'Country',
      'ar': '',
    },
    'wqq9ksi2': {
      'en': 'Building',
      'ar': 'المبنى',
    },
    'svdispblk': {
      'en': 'Block',
      'ar': 'القطعة',
    },
    '4e0pg1t3': {
      'en': 'Map location',
      'ar': '',
    },
    'jkua378r': {
      'en': 'Bank Details',
      'ar': 'تفاصيل البنك',
    },
    'mbjipsvy': {
      'en': 'Bank Name',
      'ar': '',
    },
    'bezpwl3p': {
      'en': 'Account Holder',
      'ar': '',
    },
    '8v0nrg6f': {
      'en': 'Account Number',
      'ar': '',
    },
    '82yg3946': {
      'en': 'IBAN/IFSC Code',
      'ar': '',
    },
    'vv9mdf1u': {
      'en': 'Preferred Payout Method',
      'ar': '',
    },
    'kf88itwh': {
      'en': 'Current Password',
      'ar': 'بريد إلكتروني',
    },
    'uz16d6at': {
      'en': '',
      'ar': '',
    },
    'oq5ya7tw': {
      'en': 'Input Field',
      'ar': '',
    },
    'os5rers2': {
      'en': 'New Password',
      'ar': 'كلمة المرور',
    },
    '3881ooul': {
      'en': '',
      'ar': '',
    },
    '2pi61292': {
      'en': 'Input Field',
      'ar': 'كلمة المرور',
    },
    'c3pgjxz3': {
      'en': 'Confirm New Password',
      'ar': 'تأكيد كلمة المرور',
    },
    '61kn9wys': {
      'en': '',
      'ar': '',
    },
    'gizz9vtd': {
      'en': 'Input Field',
      'ar': 'تأكيد كلمة المرور',
    },
    '15e4g6uh': {
      'en': 'Cancel',
      'ar': '',
    },
    'teg0tjv1': {
      'en': 'Change Password',
      'ar': '',
    },
    'j46vst4e': {
      'en': 'Field is required',
      'ar': '',
    },
    '8uffxy3e': {
      'en': 'Invalid Mail Address',
      'ar': '',
    },
    'g50d5pvc': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '9myrho36': {
      'en': 'Field is required',
      'ar': '',
    },
    'v4ukl3yp': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'l47nisee': {
      'en': 'Input Field is required',
      'ar': '',
    },
    '1s6a8td2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '6hcuj5rf': {
      'en': 'Preferences',
      'ar': 'معلومات شخصية',
    },
    'cy03y6l1': {
      'en': 'Language',
      'ar': '',
    },
    'bwddnzdi': {
      'en': 'Individual / Store',
      'ar': '',
    },
    'qhn9tmi7': {
      'en': 'System Language',
      'ar': '',
    },
    'zeq2ei4t': {
      'en': 'Noor Luxe Designs',
      'ar': '',
    },
    'm9078e9o': {
      'en': 'Email Notifications',
      'ar': '',
    },
    'z05ysyvv': {
      'en': 'Kuwait City, Dubai, Riyadh',
      'ar': '',
    },
    '4qyhpp49': {
      'en': 'SMS Notifications',
      'ar': '',
    },
    'ic5pdtn9': {
      'en': 'noorelan@gmail.com',
      'ar': '',
    },
    'ius7y4hp': {
      'en': 'Account Deletion',
      'ar': '',
    },
    'vnbfy0jx': {
      'en': 'Delete Account Permanently',
      'ar': '',
    },
    'z5w5dq5d': {
      'en': 'Delete',
      'ar': '',
    },
    '15ocobxy': {
      'en': 'Home',
      'ar': '',
    },
  },
  // RestockReturns
  {
    '0ywsxwel': {
      'en': 'Restock & Returns',
      'ar': '',
    },
    '6pphpelk': {
      'en': 'Export',
      'ar': '',
    },
    'bk5nr0sc': {
      'en': 'Import',
      'ar': '',
    },
    '16d5bc20': {
      'en': 'Add New Request',
      'ar': '',
    },
    '8arluild': {
      'en': 'Pending',
      'ar': '',
    },
    'x2av4vcz': {
      'en': 'Accepted',
      'ar': '',
    },
    'xnhoihg1': {
      'en': 'Declined',
      'ar': '',
    },
    'wehkoug7': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'm07qa3n4': {
      'en': 'Search...',
      'ar': '',
    },
    'yzm69xsk': {
      'en': 'Product',
      'ar': '',
    },
    'tupvj3st': {
      'en': 'SKU',
      'ar': '',
    },
    'aa964for': {
      'en': 'Qty',
      'ar': '',
    },
    'yo456a2q': {
      'en': 'Name',
      'ar': '',
    },
    'umwnqs02': {
      'en': 'White / XS ',
      'ar': '',
    },
    '2oap68t6': {
      'en': 'Request Type',
      'ar': '',
    },
    'oghwa2dy': {
      'en': 'Request Date',
      'ar': '',
    },
    'rzony84m': {
      'en': 'Status',
      'ar': '',
    },
    'vjie85o2': {
      'en': 'Pending',
      'ar': '',
    },
    'mu2psu9t': {
      'en': 'ETA Date',
      'ar': '',
    },
    'hyu6w5k9': {
      'en': 'May 27, 2025',
      'ar': '',
    },
    'kfgv5gsw': {
      'en': 'Product',
      'ar': '',
    },
    'p5cknqib': {
      'en': 'SKU',
      'ar': '',
    },
    'reoo8hb1': {
      'en': 'Qty',
      'ar': '',
    },
    's3mmjnmf': {
      'en': 'Name',
      'ar': '',
    },
    'fbe9dy0h': {
      'en': 'White / XS ',
      'ar': '',
    },
    'pkze3yp9': {
      'en': 'Request Type',
      'ar': '',
    },
    '8eiukufy': {
      'en': 'Request Date',
      'ar': '',
    },
    '2acsz081': {
      'en': 'Status',
      'ar': '',
    },
    '6covh0nr': {
      'en': 'Pending',
      'ar': '',
    },
    '46usy2y3': {
      'en': 'ETA Date',
      'ar': '',
    },
    'dq831z75': {
      'en': 'May 27, 2025',
      'ar': '',
    },
    'akdnxz2z': {
      'en': 'Fulfillment Stage',
      'ar': '',
    },
    'iykfrlfb': {
      'en': 'Ready to Pick',
      'ar': '',
    },
    'nv4hqcf8': {
      'en': 'Received ',
      'ar': '',
    },
    's3obpn99': {
      'en': 'Enquiry',
      'ar': '',
    },
    '35gvlpgq': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Inventory-PM
  {
    'q7trc2eg': {
      'en': 'Product Management',
      'ar': 'إدارة المنتجات',
    },
    'z4runll2': {
      'en': 'Export',
      'ar': 'يصدّر',
    },
    'atgxkj6g': {
      'en': 'Import',
      'ar': 'يستورد',
    },
    'gth7jzlb': {
      'en': ' Add Inventory',
      'ar': 'إضافة المخزون',
    },
    'rct6x1hu': {
      'en': 'All',
      'ar': '',
    },
    'a7ivhfqn': {
      'en': 'Stock Managed by Designer',
      'ar': '',
    },
    'rlnq088v': {
      'en': 'Stock Managed by Azyaa',
      'ar': '',
    },
    'gl6z4zvk': {
      'en': 'Low Stock Alert',
      'ar': '',
    },
    '7e5lng7r': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'f8zwp1ke': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'd5iva288': {
      'en': 'Search by Product ID',
      'ar': 'البحث حسب معرف المنتج',
    },
    'r50ze8v6': {
      'en': '         ',
      'ar': '',
    },
    'wdd5oa0l': {
      'en': 'Product',
      'ar': 'منتج',
    },
    '88e0uylo': {
      'en': 'Product ID',
      'ar': 'رمز المنتج',
    },
    'vr63g1xi': {
      'en': 'ETA',
      'ar': 'الوقت المتوقع للوصول',
    },
    'j97a3z04': {
      'en': 'White / XS ',
      'ar': '',
    },
    'qdbc5fjv': {
      'en': 'Stock Source',
      'ar': 'مصدر الأسهم',
    },
    '7yl1g5xn': {
      'en': 'Total stock',
      'ar': 'إجمالي المخزون',
    },
    'w6b9j8k5': {
      'en': 'Available',
      'ar': 'متاح',
    },
    'fc1euzdq': {
      'en': 'Stock In-hand',
      'ar': 'المخزون في متناول اليد',
    },
    'qoj8iyi7': {
      'en': 'Committed',
      'ar': 'ملتزم',
    },
    '4wyiru4i': {
      'en': 'Unavailable',
      'ar': 'غير متاح',
    },
    '2zk6vyeu': {
      'en': 'Alert Threshold',
      'ar': 'عتبة التنبيه',
    },
    '9s2w9hya': {
      'en': 'Current Status',
      'ar': 'الحالة الحالية',
    },
    '0ye1oxkf': {
      'en': ' In Stock',
      'ar': 'في الأوراق المالية',
    },
    '9a7ebw92': {
      'en': ' Low Stock',
      'ar': 'انخفاض المخزون',
    },
    'mq6wltza': {
      'en': 'Your product shelf is still waiting.',
      'ar': 'لا يزال رف المنتج الخاص بك في انتظارك.',
    },
    '2ylt5c3u': {
      'en':
          'Manage all your listings here once products are added to the system.',
      'ar': 'قم بإدارة جميع قوائمك هنا بمجرد إضافة المنتجات إلى النظام.',
    },
    'vruxnxkk': {
      'en': '         ',
      'ar': '',
    },
    'xu2c04ma': {
      'en': 'Product',
      'ar': 'منتج',
    },
    '3p7j3adl': {
      'en': 'SKU',
      'ar': 'رمز المنتج',
    },
    'uw1op1g0': {
      'en': 'ETA',
      'ar': 'الوقت المتوقع للوصول',
    },
    'ehcc82wm': {
      'en': 'White / XS ',
      'ar': '',
    },
    'bpp307ft': {
      'en': 'Alert Threshold',
      'ar': 'عتبة التنبيه',
    },
    'u364qiue': {
      'en': 'Stock Source',
      'ar': 'مصدر الأسهم',
    },
    '4n0ivwol': {
      'en': 'Azyaa Stock',
      'ar': 'أزيا ستوك',
    },
    'kq5twnwk': {
      'en': 'Stock In-hand',
      'ar': 'المخزون في متناول اليد',
    },
    'jnkrawmx': {
      'en': 'Current Status',
      'ar': 'الحالة الحالية',
    },
    '367hyaos': {
      'en': ' Low Stock',
      'ar': 'انخفاض المخزون',
    },
    't5dnzsfd': {
      'en': ' ',
      'ar': '',
    },
    'dx0j8olq': {
      'en': 'Notify Designer',
      'ar': 'إخطار المصمم',
    },
    '9k776o45': {
      'en': 'Restock request raised',
      'ar': 'تحديث المخزون',
    },
    'vxnyx5ar': {
      'en': 'Nothing Here Yet',
      'ar': 'لا يوجد شيء هنا حتى الآن',
    },
    'nvu0r46m': {
      'en': 'Looks like we couldn’t find any results.',
      'ar': 'يبدو أننا لم نتمكن من العثور على أي نتائج.',
    },
    '8m8l3ulv': {
      'en': '         ',
      'ar': '',
    },
    'brv492k5': {
      'en': 'Product',
      'ar': 'منتج',
    },
    '3mz23le5': {
      'en': 'SKU',
      'ar': 'رمز المنتج',
    },
    'azw5xgdr': {
      'en': 'ETA',
      'ar': 'الوقت المتوقع للوصول',
    },
    'e1rlji45': {
      'en': 'White / XS ',
      'ar': '',
    },
    'on2if2lt': {
      'en': 'Available',
      'ar': 'متاح',
    },
    'lnkjgnjq': {
      'en': 'Stock In-hand',
      'ar': 'المخزون في متناول اليد',
    },
    '86oak1lf': {
      'en': 'Committed',
      'ar': 'ملتزم',
    },
    'dmys6iaz': {
      'en': 'Alert Threshold',
      'ar': 'عتبة التنبيه',
    },
    'ezq1qbgx': {
      'en': 'Current Status',
      'ar': 'الحالة الحالية',
    },
    'dmu5m9ae': {
      'en': ' In Stock',
      'ar': 'في الأوراق المالية',
    },
    'j0wasexv': {
      'en': ' Low Stock',
      'ar': 'انخفاض المخزون',
    },
    '8ym347io': {
      'en': 'Oops! Nothing Here',
      'ar': 'عفواً! لا يوجد شيء هنا',
    },
    'gduu3xqj': {
      'en': 'We couldn’t retrieve any data for now.',
      'ar': 'لم نتمكن من استرجاع أي بيانات في الوقت الحالي.',
    },
    'xthcd2eq': {
      'en': '         ',
      'ar': '',
    },
    'mb0dsd28': {
      'en': 'Product',
      'ar': 'منتج',
    },
    'u6zo599a': {
      'en': 'SKU',
      'ar': 'رمز المنتج',
    },
    'v3qo7jvo': {
      'en': 'ETA',
      'ar': 'الوقت المتوقع للوصول',
    },
    'x2f2a8ih': {
      'en': 'White / XS ',
      'ar': '',
    },
    'kg6022by': {
      'en': 'Available',
      'ar': 'متاح',
    },
    'cpd42oh8': {
      'en': 'Stock In-hand',
      'ar': 'المخزون في متناول اليد',
    },
    '12wh9ib1': {
      'en': 'Alert Threshold',
      'ar': 'عتبة التنبيه',
    },
    'dtqlptcu': {
      'en': 'Current Status',
      'ar': 'الحالة الحالية',
    },
    'ma8xjg6u': {
      'en': ' Low Stock',
      'ar': 'انخفاض المخزون',
    },
    'jf4fjqj7': {
      'en': 'Raise Collect Request',
      'ar': 'طلب رفع الحساب',
    },
    'ym3jd0dp': {
      'en': 'Retry Collect Request',
      'ar': 'إعادة محاولة طلب التحصيل',
    },
    'l9arx7mi': {
      'en': ' ',
      'ar': '',
    },
    'ebhn16j3': {
      'en': 'Some items are running low!',
      'ar': 'بعض العناصر أصبحت منخفضة!',
    },
    'qczu3dwt': {
      'en':
          'Keep an eye on these products—restock soon to avoid missing out on sales.',
      'ar':
          'راقب هذه المنتجات - قم بتجديد مخزونها قريبًا لتجنب تفويت المبيعات.',
    },
    'ftpbnlvv': {
      'en': 'Home',
      'ar': '',
    },
  },
  // InventoryProductView
  {
    'jntnk2ew': {
      'en': 'Product Inventory Details',
      'ar': 'تفاصيل مخزون المنتج',
    },
    'pojzuojq': {
      'en': 'Total Stock',
      'ar': 'إجمالي المخزون',
    },
    'yh4siofk': {
      'en': 'Unavailable',
      'ar': 'غير متاح',
    },
    '106ks83y': {
      'en': 'Committed',
      'ar': 'ملتزم',
    },
    'dh9g73a4': {
      'en': 'Last Restock',
      'ar': 'آخر إعادة تخزين',
    },
    'fm2v79nm': {
      'en': 'Last Adjustment',
      'ar': 'التعديل الأخير',
    },
    'bjw29m45': {
      'en': '3 Days Ago',
      'ar': '',
    },
    'v8oc30g5': {
      'en': 'Status',
      'ar': 'التعاون مع العلامات التجارية',
    },
    'hyibycbc': {
      'en': 'instock',
      'ar': '',
    },
    'ep847f76': {
      'en': ' Low Stock',
      'ar': '',
    },
    'zzmjspdf': {
      'en': 'Overview',
      'ar': 'ملخص',
    },
    'ajrdx4nw': {
      'en': 'Overview',
      'ar': 'ملخص',
    },
    'fxgx07qg': {
      'en': 'Product Overview',
      'ar': 'معلومات شخصية',
    },
    'l6m0m7uf': {
      'en': 'Product Name',
      'ar': 'اسم المنتج',
    },
    'sphxwjz3': {
      'en': 'Product ID',
      'ar': '',
    },
    'wj5unfb6': {
      'en': 'Stock in hand',
      'ar': '',
    },
    'qdpjasd3': {
      'en': 'Designer',
      'ar': '',
    },
    'sblxekas': {
      'en': 'Unavailable',
      'ar': '',
    },
    'xr73944t': {
      'en': 'Committed',
      'ar': '',
    },
    'mpcbzvgr': {
      'en': 'Status',
      'ar': '',
    },
    '7vwamtpj': {
      'en': 'Low stock',
      'ar': '',
    },
    'j84ifmaj': {
      'en': 'Stock Source',
      'ar': '',
    },
    '4o0w4nzp': {
      'en': 'Alert Settings',
      'ar': 'التحقق من الهوية',
    },
    'd5d74gb1': {
      'en': 'Alert Threshold',
      'ar': '',
    },
    '21pxjda3': {
      'en': 'ID',
      'ar': '',
    },
    'ximv6rjq': {
      'en': ' Request Date',
      'ar': '',
    },
    '9hvtblkh': {
      'en': 'Qty Added',
      'ar': '',
    },
    'l51dykhk': {
      'en': 'Source',
      'ar': 'اسم',
    },
    '20b8o0je': {
      'en': 'Request Type',
      'ar': 'موقع',
    },
    'ut9ex6hp': {
      'en': 'Pref. ETA',
      'ar': 'مَلَفّ',
    },
    'hrwsd41m': {
      'en': 'Requested By',
      'ar': 'فئة',
    },
    'pu9hk2zj': {
      'en': 'Status',
      'ar': 'خبرة',
    },
    'f9iew1ku': {
      'en': 'ID',
      'ar': '',
    },
    '4e7ednik': {
      'en': 'Affected Qty',
      'ar': '',
    },
    'uknmpybm': {
      'en': 'Type',
      'ar': 'اسم',
    },
    'p6bsl57y': {
      'en': 'Status',
      'ar': 'موقع',
    },
    'dc527kxk': {
      'en': ' Date',
      'ar': '',
    },
    'ujymw667': {
      'en': 'May 25, 2025',
      'ar': '',
    },
    '9vitbnwk': {
      'en': 'Type',
      'ar': '',
    },
    'xgk62hnz': {
      'en': 'Adjustment',
      'ar': '',
    },
    'jembf0sw': {
      'en': 'QTY',
      'ar': 'اسم',
    },
    'pr5boxrf': {
      'en': '-3',
      'ar': '',
    },
    '1viftp0m': {
      'en': 'Source',
      'ar': 'موقع',
    },
    'yd76lw5b': {
      'en': 'Designer',
      'ar': '',
    },
    'm1dlv5ew': {
      'en': 'Note',
      'ar': 'مَلَفّ',
    },
    'fxqjvf25': {
      'en': 'Damaged piece removed',
      'ar': '',
    },
    'xu3l6wd2': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Add-Inventory-Entry
  {
    '8wgs1qy5': {
      'en': 'Add New Inventory Entry',
      'ar': 'إضافة المنتج',
    },
    '5rlxax0c': {
      'en': 'Add Product Stock',
      'ar': 'تفاصيل المنتج',
    },
    '2ggl7329': {
      'en': 'Select Product ',
      'ar': 'نوع المنتج',
    },
    '3h75jp5t': {
      'en': 'Choose the product to update stock for.',
      'ar': '',
    },
    'mx1m9zpl': {
      'en': 'Select Product',
      'ar': 'يختار...',
    },
    'zs16ez9g': {
      'en': 'Search...',
      'ar': '',
    },
    'kfsxd71v': {
      'en': 'Urban Style Dress - White / XS',
      'ar': '',
    },
    'c6zph4xp': {
      'en': '1',
      'ar': '',
    },
    '1epip5be': {
      'en': '2',
      'ar': '',
    },
    'and6sc4p': {
      'en': 'Product ID',
      'ar': 'معرف المنتج',
    },
    'dsgox3xl': {
      'en': 'Unique product identifier',
      'ar': '',
    },
    'qdgdc6ey': {
      'en': 'Stock Source',
      'ar': 'اختر المصمم',
    },
    'nlgakjsx': {
      'en': 'Select where the stock is sourced from.',
      'ar': '',
    },
    '0d8xwj3f': {
      'en': 'Designer',
      'ar': '',
    },
    'cnt2x4xb': {
      'en': 'Designer',
      'ar': 'يختار...',
    },
    'vqipwggk': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'n6qdhq2j': {
      'en': 'Designer',
      'ar': '',
    },
    '0ob0yakq': {
      'en': 'Azyaa Warehouse',
      'ar': '',
    },
    '849755bw': {
      'en': 'Total Stock Quantity',
      'ar': 'إجمالي كمية المخزون',
    },
    'fnk93um6': {
      'en': 'Enter the number of items being added.',
      'ar': '',
    },
    'hfigrsgp': {
      'en': '',
      'ar': '',
    },
    'trv1ojlk': {
      'en': 'Enter Total stock quantity',
      'ar': '',
    },
    '4y5foj9l': {
      'en': 'Stock Managed by',
      'ar': 'الأسهم التي يديرها',
    },
    'whowwheh': {
      'en': 'Choose who is responsible for stock management.',
      'ar': '',
    },
    'jtigcynz': {
      'en': 'Stock Managed by Azyaa',
      'ar': 'الأسهم التي تديرها Azyaa',
    },
    'x92p30iq': {
      'en': '',
      'ar': '',
    },
    '3hh76szd': {
      'en': 'Restock ETA',
      'ar': 'رمز المنتج',
    },
    'jvr3c401': {
      'en': 'Preferred date for item to be restocked.',
      'ar': '',
    },
    'vo66aoz0': {
      'en': '',
      'ar': '',
    },
    '2o1g8liy': {
      'en': 'Enter Restock ETA',
      'ar': '',
    },
    'u9011c4s': {
      'en': 'Alter Threshold',
      'ar': 'رمز المنتج',
    },
    'k6nvfhzu': {
      'en': 'Set the limit to trigger low stock alerts.',
      'ar': '',
    },
    'hdnv8gyr': {
      'en': '',
      'ar': '',
    },
    'k30an6dh': {
      'en': 'Enter alter limit for low stock',
      'ar': 'أدخل حد التغيير للمخزون المنخفض',
    },
    'g2xf4b2k': {
      'en': 'Alter Threshold',
      'ar': 'رمز المنتج',
    },
    'y9kmalp4': {
      'en': 'Selling price of the product',
      'ar': '',
    },
    'mb2xgp3u': {
      'en': '',
      'ar': '',
    },
    'wjmvhskx': {
      'en': 'Enter alter limit for low stock',
      'ar': '',
    },
    '41dn947z': {
      'en': 'Notes Optional',
      'ar': 'تقدير رقم الشحن والتاريخ (إذا تم الطلب)',
    },
    'm87pn92m': {
      'en': 'Number of days in which order might be delivered',
      'ar': '',
    },
    'a5uyu6ed': {
      'en': '',
      'ar': '',
    },
    'tqx5zx3a': {
      'en': 'Add Varient Stock',
      'ar': 'التسعير والمخزون',
    },
    '3ypijbrp': {
      'en': 'Size Options',
      'ar': 'نوع المنتج',
    },
    'za1uyyr2': {
      'en': 'Type of the product',
      'ar': '',
    },
    'q2jecgnn': {
      'en': 'Ready Made',
      'ar': '',
    },
    'rjfvhceo': {
      'en': '',
      'ar': 'يختار...',
    },
    '6rjxscua': {
      'en': 'Search...',
      'ar': '',
    },
    '40rczf2r': {
      'en': 'Ready Made',
      'ar': '',
    },
    '0dozfylu': {
      'en': 'Custom Made',
      'ar': '',
    },
    'jac1g6kt': {
      'en': 'Color Options',
      'ar': 'نوع المنتج',
    },
    'j7lli6ka': {
      'en': 'Type of the product',
      'ar': '',
    },
    'p07vei9f': {
      'en': 'Ready Made',
      'ar': '',
    },
    'c7jp2wuk': {
      'en': '',
      'ar': 'يختار...',
    },
    '4035suiq': {
      'en': 'Search...',
      'ar': '',
    },
    'r6ake25e': {
      'en': 'Ready Made',
      'ar': '',
    },
    'dc6nr6rj': {
      'en': 'Custom Made',
      'ar': '',
    },
    '33hmg07a': {
      'en': 'Total Stock Quantity',
      'ar': 'سعر المنتج',
    },
    'nmlko5w8': {
      'en': 'Product Price',
      'ar': '',
    },
    'wsd03cvs': {
      'en': '',
      'ar': '',
    },
    '9mrcbzko': {
      'en': 'Enter quantity to add',
      'ar': '',
    },
    '52bvylzy': {
      'en': 'Add Size',
      'ar': '',
    },
    'g4p76rd4': {
      'en': 'S | Red | 205',
      'ar': '',
    },
    '883nukup': {
      'en': 'M | White | 205',
      'ar': '',
    },
    'og92a2pp': {
      'en': 'L | Black | 205',
      'ar': '',
    },
    'i6rtq53y': {
      'en': 'XL | Green | 205',
      'ar': '',
    },
    'st0pval2': {
      'en': 'XXL | Yellow | 205',
      'ar': '',
    },
    'zi98x9yr': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '7jhbf75n': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'kl3qlx1o': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    '6ahph27g': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'dxttk4hv': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
    },
    'shsw2cm6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'pt0uzeco': {
      'en': 'Enter alter limit for low stock is required',
      'ar': '',
    },
    'ihgihfzu': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'po7qoufv': {
      'en': 'Field is required',
      'ar': '',
    },
    'dxl7e5nk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '4uy3v6up': {
      'en': 'Enter quantity to add is required',
      'ar': '',
    },
    'dx1uv468': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'rlle0xzj': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'qt86f2ze': {
      'en': 'Add Inventory',
      'ar': 'إضافة المخزون',
    },
    'dp3c0w6e': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Inventory-SM
  {
    'n2kx137a': {
      'en': 'Stock Management',
      'ar': 'إدارة المخزون',
    },
    '3gh3aimx': {
      'en': 'Export',
      'ar': '',
    },
    'qynmxkwu': {
      'en': 'Import',
      'ar': '',
    },
    'x8sz1j1p': {
      'en': 'Add New Request',
      'ar': 'إضافة طلب جديد',
    },
    'uef66x44': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    '21s0z92q': {
      'en': 'Accepted',
      'ar': 'مقبول',
    },
    '84xdtupd': {
      'en': 'Declined',
      'ar': 'انخفض',
    },
    'v775mn0w': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'wvxfzqxr': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'hyh9y2q9': {
      'en': 'Search...',
      'ar': '',
    },
    'jsa8v7o0': {
      'en': 'Product',
      'ar': 'منتج',
    },
    'ne9ldzb2': {
      'en': 'White / XS ',
      'ar': '',
    },
    'cazaecr9': {
      'en': 'Product ID',
      'ar': 'معرف المنتج',
    },
    '44osj931': {
      'en': 'Qty',
      'ar': 'الكمية',
    },
    'ib2j8t72': {
      'en': 'Request Type',
      'ar': 'نوع الطلب',
    },
    'eax0y1am': {
      'en': 'Request Date',
      'ar': 'تاريخ الطلب',
    },
    'gezuneik': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'rifpnejr': {
      'en': 'Pref. ETA',
      'ar': 'تفضيل ETA',
    },
    'fuiafn9w': {
      'en': ' ',
      'ar': '',
    },
    'c3kc8qqj': {
      'en': 'Stock updates are pending!',
      'ar': 'تحديثات المخزون معلقة!',
    },
    'b2ccjhmu': {
      'en':
          'Items listed here are waiting for approval or update—hang tight while we process them.',
      'ar':
          'العناصر المدرجة هنا تنتظر الموافقة أو التحديث - انتظر قليلاً بينما نقوم بمعالجتها.',
    },
    's44b58fd': {
      'en': 'Product',
      'ar': 'منتج',
    },
    'i8j7uuuq': {
      'en': 'White / XS ',
      'ar': '',
    },
    'oc9fxggj': {
      'en': 'SKU',
      'ar': 'رمز المنتج',
    },
    '06rjbrre': {
      'en': 'Qty',
      'ar': 'الكمية',
    },
    'pdtvkhdl': {
      'en': 'Request Type',
      'ar': 'نوع الطلب',
    },
    'f7tej9qj': {
      'en': 'Status',
      'ar': 'تاريخ الطلب',
    },
    'qabbyjn5': {
      'en': 'Pref. ETA',
      'ar': 'حالة',
    },
    'ojku1uuo': {
      'en': ' Des. ETA',
      'ar': 'تفضيل ETA',
    },
    'dm9c0gr7': {
      'en': 'Fulfill Status',
      'ar': 'Des. ETA',
    },
    'zj13oxwa': {
      'en': ' ',
      'ar': '',
    },
    '3pqkrv3w': {
      'en': 'Received ',
      'ar': 'تلقى',
    },
    '9ov4m9sf': {
      'en': 'Create Pickup Request',
      'ar': 'تلقى',
    },
    '2lrd3wva': {
      'en': 'Cancel ',
      'ar': 'تلقى',
    },
    'pq3mboxb': {
      'en': 'Create Return Order',
      'ar': 'تلقى',
    },
    'pgn4g43x': {
      'en': 'Enquiry',
      'ar': 'سؤال',
    },
    'tu1fnszu': {
      'en': 'View Enquiry',
      'ar': 'عرض الاستفسار',
    },
    'refsyj8l': {
      'en': 'Cancel Enquiry',
      'ar': 'تلقى',
    },
    'mjezb56x': {
      'en': 'Looks like an empty space',
      'ar': 'يبدو وكأنه مساحة فارغة',
    },
    'u4zc0sy3': {
      'en':
          'These items are now live and ready for action—your inventory is up to date.',
      'ar': 'أصبحت هذه العناصر الآن جاهزة للاستخدام - مخزونك محدث.',
    },
    '2oxh0ays': {
      'en': 'Product',
      'ar': 'منتج',
    },
    'qjg0clce': {
      'en': 'White / XS ',
      'ar': '',
    },
    '3rsjupq7': {
      'en': 'SKU',
      'ar': 'رمز المنتج',
    },
    'wxvc9ojk': {
      'en': 'Qty',
      'ar': 'الكمية',
    },
    '90wylp49': {
      'en': 'Request Type',
      'ar': 'نوع الطلب',
    },
    '9d9uke9k': {
      'en': 'Request Date',
      'ar': 'تاريخ الطلب',
    },
    '4zwpsmec': {
      'en': 'Status',
      'ar': 'حالة',
    },
    '5a5wmoga': {
      'en': 'Pref. ETA',
      'ar': 'تفضيل ETA',
    },
    'j1rbg2xf': {
      'en': ' ',
      'ar': '',
    },
    '314h1pnd': {
      'en': 'Accept',
      'ar': 'يقبل',
    },
    '5rcq3kpk': {
      'en': 'Decline',
      'ar': 'انخفاض',
    },
    'jhv0uxue': {
      'en': 'Nothing to show... yet!',
      'ar': 'لا يوجد شيء لإظهاره... حتى الآن!',
    },
    '30c6kjow': {
      'en': 'Data will appear once added or synced',
      'ar': 'ستظهر البيانات بمجرد إضافتها أو مزامنتها',
    },
    '2b5m6558': {
      'en': 'Product',
      'ar': 'منتج',
    },
    'gphbmef0': {
      'en': 'White / XS ',
      'ar': '',
    },
    '2k2abha9': {
      'en': 'SKU',
      'ar': 'رمز المنتج',
    },
    'gkd5a07h': {
      'en': 'Qty',
      'ar': 'الكمية',
    },
    '0p939276': {
      'en': 'Request Type',
      'ar': 'نوع الطلب',
    },
    'lzli3a16': {
      'en': 'Request Date',
      'ar': 'تاريخ الطلب',
    },
    'sqscz0cr': {
      'en': 'Status',
      'ar': 'تفضيل ETA',
    },
    '1qgymomc': {
      'en': 'Pref. ETA',
      'ar': 'حالة',
    },
    '9njsdae4': {
      'en': 'Nothing to show... yet!',
      'ar': 'لا يوجد شيء لإظهاره... حتى الآن!',
    },
    'y9r8kq0v': {
      'en': 'Data will appear once added or synced',
      'ar': 'ستظهر البيانات بمجرد إضافتها أو مزامنتها',
    },
    'lfyphiel': {
      'en': 'Product',
      'ar': 'منتج',
    },
    'j4t3dalj': {
      'en': 'White / XS ',
      'ar': '',
    },
    'sg89l3zw': {
      'en': 'SKU',
      'ar': 'رمز المنتج',
    },
    '7jyinin4': {
      'en': 'Qty',
      'ar': 'الكمية',
    },
    'xw3ijku3': {
      'en': 'Request Type',
      'ar': 'نوع الطلب',
    },
    'hjpf78z4': {
      'en': 'Request Date',
      'ar': 'تاريخ الطلب',
    },
    'xyvm7ko3': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'oxu5zt15': {
      'en': 'Pref. ETA',
      'ar': 'تفضيل ETA',
    },
    'yc2yw2mi': {
      'en': ' Des. ETA',
      'ar': 'Des. ETA',
    },
    '58057gv0': {
      'en': 'Fulfill Status',
      'ar': 'استيفاء الحالة',
    },
    'psj85tlb': {
      'en': 'Processing',
      'ar': '',
    },
    'd7zzgaxp': {
      'en': 'Enquiry Open',
      'ar': '',
    },
    '6gnt7doh': {
      'en': ' ',
      'ar': '',
    },
    'aw45i9fy': {
      'en': 'Ready to Pickup',
      'ar': '',
    },
    'l3yu6wxt': {
      'en': 'View Enquiry',
      'ar': 'عرض الاستفسار',
    },
    'zkobunny': {
      'en': 'Recevied Enquiry',
      'ar': 'عرض الاستفسار',
    },
    'kfps38jq': {
      'en': 'This space feels lonely',
      'ar': 'هذه المساحة تشعر بالوحدة',
    },
    'qlps4yub': {
      'en': 'Feed it with some data.',
      'ar': 'إطعامه ببعض البيانات.',
    },
    'kaljlbb8': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Send-Notification
  {
    '6hlsi6ya': {
      'en': 'Notification ',
      'ar': 'إشعار',
    },
    'jo9wp21h': {
      'en': 'Discard',
      'ar': '',
    },
    '87a4ixjy': {
      'en': 'Send Notification',
      'ar': '',
    },
    '8jkgs1ef': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'gemtm5sy': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '6drm13wt': {
      'en': 'Designers',
      'ar': 'المصممون',
    },
    'rou5dpmj': {
      'en': 'Creators',
      'ar': 'المبدعون',
    },
    'e1tsst6n': {
      'en': 'All',
      'ar': '',
    },
    'ldg62e81': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'eisd66d2': {
      'en': 'Clear search',
      'ar': 'مسح البحث',
    },
    '0x99k2ir': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'g2xggpck': {
      'en': 'Email',
      'ar': 'تاريخ',
    },
    'o4wlf3z1': {
      'en': 'Category',
      'ar': 'عميل',
    },
    'd2tow8en': {
      'en': 'Status',
      'ar': 'حالة الطلب',
    },
    '2z7y88i1': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'j7ogg8wz': {
      'en': 'Email',
      'ar': 'تاريخ',
    },
    'd7ns4h03': {
      'en': 'Category',
      'ar': 'عميل',
    },
    'opa0zagq': {
      'en': 'Status',
      'ar': 'حالة الطلب',
    },
    'w48nla3y': {
      'en': 'Reject',
      'ar': '',
    },
    '3csfy709': {
      'en': 'Approve',
      'ar': '',
    },
    '22ze7ss7': {
      'en': 'Notification Sender',
      'ar': 'مُرسِل الإشعارات',
    },
    'dhhld3rt': {
      'en': 'Notification Title',
      'ar': 'عنوان الإشعار',
    },
    '3crof2yb': {
      'en': 'Maximum 100 characters. No HTML or emoji allowed',
      'ar': '',
    },
    'zwzgayhn': {
      'en': 'Enter Notification Title',
      'ar': '',
    },
    'x2bcy4kz': {
      'en': 'User will see this title first',
      'ar': 'سوف يرى المستخدم هذا العنوان أولاً',
    },
    'yb65xygf': {
      'en': 'Notification Body',
      'ar': 'نص الإشعار',
    },
    'zixh1tdm': {
      'en': 'Enter message ',
      'ar': '',
    },
    'xklk83kl': {
      'en': 'Put all the details about the notification here',
      'ar': 'ضع جميع التفاصيل حول الإشعار هنا',
    },
    'ji1nd5ry': {
      'en': 'Redirect Page',
      'ar': 'صفحة إعادة التوجيه',
    },
    'xitv3jju': {
      'en': 'Paste the name of the page',
      'ar': 'ألصق اسم الصفحة',
    },
    'nf4agyc1': {
      'en': 'If left empty redirects to Homepage',
      'ar': 'إذا تركت فارغة، يتم إعادة التوجيه إلى الصفحة الرئيسية',
    },
    '7toprclq': {
      'en': 'Page Parameters',
      'ar': 'صفحة إعادة التوجيه',
    },
    '6ir5keis': {
      'en': 'Paste the name of the page',
      'ar': 'ألصق اسم الصفحة',
    },
    'llvsrky8': {
      'en': 'Notification image',
      'ar': 'صورة الإشعار',
    },
    '3ua875pp': {
      'en': ' (Optional)',
      'ar': '(خياري)',
    },
    'zs50pi7h': {
      'en': 'Notification image',
      'ar': '',
    },
    'd2ijrq3r': {
      'en': 'Click to select image',
      'ar': 'انقر لتحديد الصورة',
    },
    'sk70ibjb': {
      'en': 'Notification Title is required',
      'ar': 'عنوان الإشعار مطلوب',
    },
    'ihgihfzu': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'gfsgx2x8': {
      'en': 'Message is required',
      'ar': 'الرسالة مطلوبة',
    },
    'dxl7e5nk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'hmguo5x9': {
      'en': 'Paste the name of the page is required',
      'ar': '',
    },
    'dx1uv468': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '9k53p1aq': {
      'en': 'Paste the name of the page is required',
      'ar': '',
    },
    'uy28w4uh': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'gbiwsdu8': {
      'en': 'Discard',
      'ar': 'ينبذ',
    },
    '1mk962jb': {
      'en': 'Send Notification',
      'ar': 'إرسال إشعار',
    },
    '0opzqbn5': {
      'en': 'Send Notifications',
      'ar': 'إرسال إشعار',
    },
    '9xcpldlr': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Role-PermissionNew
  {
    '0p31pm1x': {
      'en': 'Permissions',
      'ar': 'الأذونات',
    },
    'r8okvwdn': {
      'en': ' ',
      'ar': '',
    },
    '2w2umetd': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Role-Permissionold
  {
    'd5teqk9h': {
      'en': 'Permissions',
      'ar': 'الأذونات',
    },
    'qpjk1akq': {
      'en': 'Home',
      'ar': '',
    },
  },
  // DeliveryPartner
  {
    '13qvo47s': {
      'en': 'Delivery Partner',
      'ar': 'شريك التوصيل',
    },
    '3krj23nn': {
      'en': 'Add Delivery Partner',
      'ar': 'إضافة شريك التوصيل',
    },
    't8vwu6v6': {
      'en': 'Total Partners',
      'ar': 'الطلبات النشطة',
    },
    '2g3ixki3': {
      'en': 'Active Partners',
      'ar': 'الطلبات المعلقة',
    },
    '3ektar8r': {
      'en': 'Archived Partners',
      'ar': 'الطلبات المكتملة',
    },
    'hs5zaq1j': {
      'en': 'Ongoing Orders',
      'ar': 'الطلبات المرفوضة',
    },
    'd8e44hfx': {
      'en': 'Total Orders',
      'ar': 'المصممون المؤرشفون',
    },
    'yag9ncol': {
      'en': '5',
      'ar': '',
    },
    '79qhf5qz': {
      'en': 'Active',
      'ar': 'نشيط',
    },
    'xz2xrkaw': {
      'en': 'Archived',
      'ar': 'مؤرشفة',
    },
    'ywa0hj62': {
      'en': 'Active',
      'ar': 'نشيط',
    },
    'dyp716zs': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'g0p8k06f': {
      'en': 'ID',
      'ar': 'بطاقة تعريف',
    },
    'ohmcs0cz': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'z3xrp74q': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    '1b77khjc': {
      'en': 'Status',
      'ar': 'حالة',
    },
    '59nx08dd': {
      'en': '',
      'ar': '',
    },
    'nd1oif1w': {
      'en': '',
      'ar': '',
    },
    '53o9d5da': {
      'en': 'No data with the applied filters',
      'ar': 'لا توجد بيانات مع المرشحات المطبقة',
    },
    '38jew7kx': {
      'en': 'Try changing the filters or search terms for this view.',
      'ar': 'حاول تغيير المرشحات أو مصطلحات البحث لهذا العرض.',
    },
    'ly8tcpa0': {
      'en': '2 Desingers selected',
      'ar': '',
    },
    'gfw7g08c': {
      'en': 'Reject',
      'ar': '',
    },
    'b9ddsxni': {
      'en': 'Approve',
      'ar': '',
    },
    'l4p0cai2': {
      'en': 'Home',
      'ar': '',
    },
  },
  // DeliveryPartner-Active
  {
    '4cd01ka6': {
      'en': '',
      'ar': '',
    },
    '8sc721eb': {
      'en': 'Available',
      'ar': 'متاح',
    },
    '91rtgqhh': {
      'en': '#AZY-1004',
      'ar': '',
    },
    'dgyu4z4n': {
      'en': 'Allotted Area',
      'ar': 'المساحة المخصصة',
    },
    '0lbli6zj': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    '2a7w7zv2': {
      'en': '500 ',
      'ar': '',
    },
    'qowyei6m': {
      'en': 'Completed Orders',
      'ar': 'إجمالي الطلبات',
    },
    'qcnydkqu': {
      'en': '30',
      'ar': '',
    },
    'z2aace5q': {
      'en': 'Rejected Orders',
      'ar': 'توازن',
    },
    '8lep0a4y': {
      'en': '30 KD',
      'ar': '',
    },
    'ki9qroal': {
      'en': 'Personal-Details ',
      'ar': 'البيانات الشخصية',
    },
    '4bw2vnco': {
      'en': 'Products',
      'ar': 'منتجات',
    },
    '9x8aoxc1': {
      'en': 'Orders',
      'ar': 'طلبات',
    },
    'erkqq3z5': {
      'en': 'Personal-Details ',
      'ar': 'البيانات الشخصية',
    },
    'v1vtfs0e': {
      'en': 'Personal Information',
      'ar': 'معلومات شخصية',
    },
    'qkpep6ae': {
      'en': 'Name',
      'ar': 'اسم العلامة التجارية',
    },
    'eoijlst5': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    's8kb4hox': {
      'en': 'Phone No',
      'ar': 'رقم الهاتف',
    },
    'zam9bb0s': {
      'en': 'Location / City',
      'ar': 'الموقع / المدينة',
    },
    '1211xj4p': {
      'en': 'Date of Birth',
      'ar': 'نوع العلامة التجارية',
    },
    'h0yaf0t6': {
      'en': 'Nationality',
      'ar': 'خبرة',
    },
    '0qhos2gc': {
      'en': 'Preferred Language',
      'ar': 'التوفر للطلبات المخصصة',
    },
    'mlzildgu': {
      'en': 'Emergency Contact',
      'ar': '',
    },
    '47r6kcqd': {
      'en': '18% per sale',
      'ar': '',
    },
    'qnd4b9co': {
      'en': 'Vehicle Type',
      'ar': 'مفتوح للأحداث/التعاون',
    },
    'afbbi5co': {
      'en': 'Vehicle Number',
      'ar': 'القدرة الإنتاجية',
    },
    'ei2dy2mi': {
      'en': 'Delivery Area',
      'ar': 'مَلَفّ',
    },
    'x2ggc8vs': {
      'en': 'Experience',
      'ar': 'المراجع / الشهادات',
    },
    '5d32n8w2': {
      'en': 'Portfolio / Work Samples / Additional Certifications',
      'ar': 'المحفظة / نماذج الأعمال / الشهادات الإضافية',
    },
    'gvxuwsn3': {
      'en': 'Images ',
      'ar': 'الصور',
    },
    'bblfwspo': {
      'en': 'IMG',
      'ar': 'اي ام جي',
    },
    '0czdbrve': {
      'en': 'PDF',
      'ar': 'ملف بي دي إف',
    },
    '5etz0ea4': {
      'en': 'PDF',
      'ar': 'ملف بي دي إف',
    },
    '653kj2zx': {
      'en': 'Identity Verification',
      'ar': 'التحقق من الهوية',
    },
    'qsmfpg6m': {
      'en': 'Government ID',
      'ar': 'التحقق من الهوية',
    },
    'ustmwu1n': {
      'en': 'Driving License',
      'ar': 'التحقق من الهوية',
    },
    '8w4r0f2p': {
      'en': 'Address Proof',
      'ar': 'التحقق من الهوية',
    },
    '9v3w94lk': {
      'en': 'Pending Product\'s ',
      'ar': 'المنتجات المعلقة',
    },
    'spihz3fj': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'kelo5l2m': {
      'en': 'Designer Dress ',
      'ar': '',
    },
    'gi8kfqkp': {
      'en': '250 KD',
      'ar': '',
    },
    'vglw07aa': {
      'en':
          'A best-selling outfit made from sustainable fabric with a modern design touch.',
      'ar': '',
    },
    'hjt0swmf': {
      'en': 'Active Product’s',
      'ar': 'المنتجات النشطة',
    },
    'o1k8nw1x': {
      'en': 'Order Summary',
      'ar': 'ملخص الطلب',
    },
    'sawfceea': {
      'en': 'Total Orders',
      'ar': 'إجمالي الطلبات',
    },
    'tnqw1z1l': {
      'en': '200',
      'ar': '',
    },
    '4gs1iq0f': {
      'en': 'Pending Orders',
      'ar': 'الطلبات المعلقة',
    },
    'dq8zseaj': {
      'en': '120',
      'ar': '',
    },
    'iwgz6hi8': {
      'en': 'Completed Orders',
      'ar': 'الطلبات المكتملة',
    },
    'j63m4ng5': {
      'en': '120',
      'ar': '',
    },
    'mveg2r7f': {
      'en': 'Refund Requests',
      'ar': 'طلبات استرداد الأموال',
    },
    'bniacge5': {
      'en': '########',
      'ar': '',
    },
    '67gqo2y3': {
      'en': 'Return & Refund Rate',
      'ar': 'معدل الإرجاع والاسترداد',
    },
    '9dayml09': {
      'en': '2.5%',
      'ar': '',
    },
    'doqqbovz': {
      'en': 'Order Fulfillment Time',
      'ar': 'وقت تنفيذ الطلب',
    },
    '1sz8b6su': {
      'en': '4 Days',
      'ar': '',
    },
    'c2f5aj67': {
      'en': 'Refund Requests',
      'ar': 'طلبات استرداد الأموال',
    },
    'jptdzbml': {
      'en': '(',
      'ar': '(',
    },
    'bmwi4oop': {
      'en': '4.2',
      'ar': '4.2',
    },
    '2n28lxvn': {
      'en': '/',
      'ar': '/',
    },
    'evzcjnry': {
      'en': '5',
      'ar': '5',
    },
    'hh6ob9du': {
      'en': ')',
      'ar': '',
    },
    '4l67m6p6': {
      'en': 'Designer Reliability Score',
      'ar': 'درجة موثوقية المصمم',
    },
    'xj1ha8c5': {
      'en': '90%',
      'ar': '',
    },
    'mm2g85b7': {
      'en': 'Transaction',
      'ar': 'عملية',
    },
    'gdlntwc0': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'p0391hux': {
      'en': ' ',
      'ar': '',
    },
    'vfv3g3qc': {
      'en': 'Order ID',
      'ar': 'معرف الطلب',
    },
    'xg460d8y': {
      'en': 'Customer ',
      'ar': 'عميل',
    },
    'y2qy0ydg': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    '1b09zr72': {
      'en': 'Total Amount',
      'ar': 'المبلغ الإجمالي',
    },
    'wyubts9q': {
      'en': 'Payment Status',
      'ar': 'حالة الدفع',
    },
    'r5f2cg6r': {
      'en': 'Order Status',
      'ar': 'حالة الطلب',
    },
    '6sw4nirh': {
      'en': 'Total Amount',
      'ar': '',
    },
    'w0jtyf4y': {
      'en': '150 KD',
      'ar': '',
    },
    'b7n4my8u': {
      'en': 'Return Request',
      'ar': '',
    },
    '7g6cr9kn': {
      'en': 'Yes',
      'ar': '',
    },
    'l30zfhpb': {
      'en': 'Action',
      'ar': 'فعل',
    },
    '1gvna87g': {
      'en': 'View Details',
      'ar': 'عرض التفاصيل',
    },
    '8ftcufds': {
      'en': 'Your designer identity is all set.',
      'ar': 'هويتك كمصمم أصبحت جاهزة الآن.',
    },
    'v8c6399w': {
      'en': 'Keep your personal info updated for a smooth experience!',
      'ar': 'حافظ على تحديث معلوماتك الشخصية للحصول على تجربة سلسة!',
    },
    '3jwsbz8p': {
      'en': '2 Desingers selected',
      'ar': '',
    },
    'wjjc9u4y': {
      'en': 'Reject',
      'ar': '',
    },
    'x2igrk63': {
      'en': 'Approve',
      'ar': '',
    },
    '881pwvih': {
      'en': 'Payout Summary',
      'ar': '',
    },
    '9xv1tsp6': {
      'en': 'Total Earnings',
      'ar': '',
    },
    'tbt062up': {
      'en': '200 KD',
      'ar': '',
    },
    'y037xpan': {
      'en': 'Pending Payouts',
      'ar': '',
    },
    'ssnt14if': {
      'en': '20 KD',
      'ar': '',
    },
    'izsf8pox': {
      'en': 'Completed Payouts',
      'ar': '',
    },
    'x8myq0tq': {
      'en': '20 KD',
      'ar': '',
    },
    'p94u4fim': {
      'en': 'Last Payout Date',
      'ar': '',
    },
    'zjp26qjj': {
      'en': 'Feb 12, 2025',
      'ar': '',
    },
    'o5dtacbl': {
      'en': 'Fee Structure Breakdown',
      'ar': '',
    },
    'zs1reydi': {
      'en': '16%',
      'ar': '',
    },
    'col5r7tz': {
      'en': 'Payment Processing Time',
      'ar': '',
    },
    '3737ay5t': {
      'en': '15 Days',
      'ar': '',
    },
    'b5hh7pp9': {
      'en': 'Next Scheduled Payout',
      'ar': '',
    },
    'qpkgcgim': {
      'en': 'Feb 14, 2025',
      'ar': '',
    },
    'ibbm82o8': {
      'en': 'Payment Details',
      'ar': '',
    },
    'xvrph6b7': {
      'en': 'Bank Name',
      'ar': '',
    },
    '76rh3apw': {
      'en': '###########',
      'ar': '',
    },
    '69eqimyl': {
      'en': 'Account No',
      'ar': '',
    },
    '8rkcxtvg': {
      'en': '###########',
      'ar': '',
    },
    't6nfcv2n': {
      'en': 'IFSC Code',
      'ar': '',
    },
    'u5nk0slo': {
      'en': '#############',
      'ar': '',
    },
    'ozn4v9nf': {
      'en': 'Payout Transactions',
      'ar': '',
    },
    'afz4edii': {
      'en': 'Automated Payouts',
      'ar': '',
    },
    'djk8f1gd': {
      'en': ' Item Sold',
      'ar': '',
    },
    'cp5i7kg3': {
      'en': 'Payout ID',
      'ar': '',
    },
    '0hs06vqj': {
      'en': 'Date Processed',
      'ar': '',
    },
    'ko1ke0uw': {
      'en': 'White Dress, #65478',
      'ar': '',
    },
    'gzdn9w7f': {
      'en': '#20469',
      'ar': '',
    },
    '0y03ofe8': {
      'en': 'Kathryn Murphy',
      'ar': '',
    },
    'j75hcodq': {
      'en': 'Amount',
      'ar': '',
    },
    'oi842rrv': {
      'en': '100 KD',
      'ar': '',
    },
    'w1u8s6sw': {
      'en': 'Pament Method',
      'ar': '',
    },
    'p77964d8': {
      'en': 'Bank Transfer',
      'ar': '',
    },
    'bzptni18': {
      'en': 'Status',
      'ar': '',
    },
    'xqitu24b': {
      'en': 'Processing',
      'ar': '',
    },
    '85or9j8b': {
      'en': 'Admin Actions',
      'ar': '',
    },
    '7dt6sn3n': {
      'en': 'Invoice Download',
      'ar': '',
    },
    'e30cyerl': {
      'en': '2 Desingers selected',
      'ar': '',
    },
    'ryz1iwf7': {
      'en': 'Download All',
      'ar': '',
    },
    '1nvlthpm': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Refund
  {
    '87tver88': {
      'en': 'Refund',
      'ar': '',
    },
    '7w9zidpq': {
      'en': '#40011',
      'ar': '',
    },
    'fbgjorpj': {
      'en': 'Maximum 100 characters. No HTML or emoji allowed',
      'ar': '',
    },
    'mxqncnda': {
      'en': 'Items can be returned within 7 days',
      'ar': '⚠ سبب الرفض',
    },
    'ibwwzmps': {
      'en':
          'Customers can return eligible items within 7 days of purchase. Once a refund is processed, the item can no longer be returned. To ensure a smooth process, \ninitiate a return request before issuing a refund.',
      'ar': '',
    },
    '0v5bm2rg': {
      'en': 'Create a return',
      'ar': '',
    },
    'eeteu4p1': {
      'en': 'Learn more',
      'ar': '',
    },
    'umgsgqyg': {
      'en': 'Fulfilled',
      'ar': '',
    },
    'pi7ps27a': {
      'en': 'Urban Style Dress ',
      'ar': 'فستان على الطراز الحضري',
    },
    'l13v5j2v': {
      'en': 'White',
      'ar': 'أبيض',
    },
    'rhkztp03': {
      'en': ' / ',
      'ar': '',
    },
    '28cygm7i': {
      'en': 'XS ',
      'ar': 'XS',
    },
    '4o6wce06': {
      'en': 'Urban Style Dress ',
      'ar': '',
    },
    'i9tqvetq': {
      'en': '1',
      'ar': '',
    },
    '30dh00ft': {
      'en': ' of ',
      'ar': '',
    },
    'dg7g3wbi': {
      'en': '1',
      'ar': '',
    },
    's0r74bkr': {
      'en': '40.00 KWD',
      'ar': '',
    },
    'lktydobw': {
      'en': 'KWD ',
      'ar': '',
    },
    'gm3brbmq': {
      'en': '20.00',
      'ar': '',
    },
    'h9r201nv': {
      'en': 'Restock item',
      'ar': '',
    },
    'e35i5vok': {
      'en': 'Reason for refund',
      'ar': '',
    },
    'ocx3dhmx': {
      'en': 'Save ',
      'ar': '',
    },
    'ghbr3qoi': {
      'en': '',
      'ar': '',
    },
    '83cplbhw': {
      'en': 'Only you and other staff can see this reason. ',
      'ar': '',
    },
    'cgv0zf41': {
      'en': 'Learn more about  ',
      'ar': '',
    },
    '9zmnbw3c': {
      'en': 'refunding orders.',
      'ar': '',
    },
    'xju9e8wg': {
      'en': 'Learn more about  refunding orders.',
      'ar': '',
    },
    'x3jq8khl': {
      'en': 'Summary',
      'ar': 'ملخص',
    },
    '2u853ank': {
      'en': 'Item Subtotal (1)',
      'ar': 'المجموع الفرعي',
    },
    'aq7ir4nh': {
      'en': 'KWD 20.00',
      'ar': '',
    },
    'dfzlvsfl': {
      'en': 'Tax',
      'ar': 'خصم خطة أزيا',
    },
    'hbhz3jki': {
      'en': 'KWD 0.00',
      'ar': '',
    },
    '5p5lltz0': {
      'en': 'Refund Total ',
      'ar': 'المجموع',
    },
    'hu9nbqrj': {
      'en': 'Maximum 100 characters. No HTML or emoji allowed',
      'ar': '',
    },
    'ao9qxqnq': {
      'en': 'KWD 20.00',
      'ar': '',
    },
    'zm9nt7af': {
      'en': 'Summary',
      'ar': 'تاريخ الشحن',
    },
    '1k92h5ja': {
      'en': 'Manual',
      'ar': '',
    },
    'wdevuh96': {
      'en': 'Save ',
      'ar': '',
    },
    'n2pv6bmv': {
      'en': '',
      'ar': '',
    },
    'x9br98ow': {
      'en': 'KWD  20.00',
      'ar': '',
    },
    '7qszfwm0': {
      'en': 'KWD 20.00 available for refund ',
      'ar': '',
    },
    'p2tzbm44': {
      'en': 'Refund KWD 20.00',
      'ar': 'شراء ملصق الشحن',
    },
    'no76tl6a': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CreateNewCoupon
  {
    'j3ge5ytc': {
      'en': 'Create New Coupon',
      'ar': 'إنشاء قسيمة جديدة',
    },
    'bq5rm63e': {
      'en': 'Reset to default',
      'ar': '',
    },
    'lvsyykn3': {
      'en': 'Save changes',
      'ar': '',
    },
    'aydkxdan': {
      'en': 'Coupon Code',
      'ar': 'رمز القسيمة',
    },
    'tpxxg7yh': {
      'en': 'Generate random code',
      'ar': 'بوابة الدفع',
    },
    'ib24i5qu': {
      'en': '',
      'ar': '',
    },
    'itlhm6hh': {
      'en': 'Azyaa100',
      'ar': 'أزيا100',
    },
    '54akhq02': {
      'en': '(e.g., AZYS30)',
      'ar': '(على سبيل المثال، AZYS30)',
    },
    'odxsv3ru': {
      'en': 'Discount Type',
      'ar': 'بوابة الدفع',
    },
    'ywc1r9xa': {
      'en': 'Percentage',
      'ar': '',
    },
    '59sei0es': {
      'en': 'Percentage',
      'ar': 'نسبة مئوية',
    },
    'eo5z438t': {
      'en': 'Search...',
      'ar': '',
    },
    'us4e9531': {
      'en': 'Percentage',
      'ar': '',
    },
    'lax2n630': {
      'en': 'Amount',
      'ar': '',
    },
    '60bsaxq5': {
      'en': 'Discount Value',
      'ar': 'قيمة الخصم',
    },
    'w1ibittu': {
      'en': 'Enter value',
      'ar': 'يختار...',
    },
    'o99j3rf2': {
      'en': 'Search...',
      'ar': '',
    },
    'bzkq6d7r': {
      'en': '',
      'ar': '',
    },
    'p0iol0h4': {
      'en': 'Discount value',
      'ar': 'قيمة الخصم',
    },
    'yrd9jzqb': {
      'en': '(e.g., 30% or 10 KD)',
      'ar': '(على سبيل المثال، 30% أو 10 د.ك)',
    },
    'h4e2faoz': {
      'en': 'Minimum Order Amount',
      'ar': 'بيانات اعتماد الاختبار',
    },
    'bf8d7lgx': {
      'en': '',
      'ar': '',
    },
    'hluz8s7c': {
      'en': 'Enter minimum order (KD)',
      'ar': 'أدخل الحد الأدنى للطلب (KD)',
    },
    'bqthc9gc': {
      'en': 'Max Discount Cap',
      'ar': 'بيانات اعتماد الإنتاج',
    },
    '16aiyvm6': {
      'en': '',
      'ar': '',
    },
    '76kvxjzf': {
      'en': 'Enter max discount amount',
      'ar': 'أدخل الحد الأقصى لمبلغ الخصم',
    },
    'n0cz2y7o': {
      'en': 'Coupon Short Description',
      'ar': 'وصف مختصر للقسيمة',
    },
    'g7ljxlr0': {
      'en': '',
      'ar': '',
    },
    'i43zmg97': {
      'en': 'Short description note about coupon usage',
      'ar': 'ملاحظة وصفية مختصرة حول استخدام القسيمة',
    },
    '4abd0d7v': {
      'en': 'Coupon Description',
      'ar': 'بوابة الدفع',
    },
    'tllvb5du': {
      'en': '',
      'ar': '',
    },
    '0zszufmz': {
      'en': 'Long Description note about coupon usage',
      'ar': 'ملاحظة وصفية طويلة حول استخدام القسيمة',
    },
    'fv78k3fi': {
      'en': 'Valid From',
      'ar': 'صالحة من',
    },
    'au9hlhls': {
      'en': 'Valid To',
      'ar': 'صالحة ل',
    },
    '9yx1lyop': {
      'en': 'Valid Until',
      'ar': 'بيانات اعتماد الاختبار',
    },
    '3ov31m7o': {
      'en': '',
      'ar': '',
    },
    'vqjys7ol': {
      'en': 'Start time',
      'ar': 'بيانات اعتماد الإنتاج',
    },
    '5yhssbm5': {
      'en': '',
      'ar': '',
    },
    's52l4a4m': {
      'en': 'Usage Limit',
      'ar': 'بوابة الدفع',
    },
    '2ft8uk00': {
      'en': '',
      'ar': '',
    },
    '8oexst0c': {
      'en': 'Input Field',
      'ar': '',
    },
    '4366aeco': {
      'en': '(e.g., Unlimited or 5,000 Uses)',
      'ar': '',
    },
    'pckcqb4e': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'th69xk4d': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
    'qc81xr0a': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'e3zqtxv0': {
      'en': '',
      'ar': 'يختار...',
    },
    '3qx7iea6': {
      'en': 'Search...',
      'ar': '',
    },
    'i5telnfi': {
      'en': 'Active',
      'ar': 'نشيط',
    },
    'aqctzsb2': {
      'en': 'Target Audience',
      'ar': 'الجمهور المستهدف',
    },
    '0ye6svi0': {
      'en': 'Customer',
      'ar': '',
    },
    'snloc4al': {
      'en': 'Customer',
      'ar': 'عميل',
    },
    '0dxbtey3': {
      'en': 'Search...',
      'ar': '',
    },
    'j3cmqgrh': {
      'en': 'Customer',
      'ar': '',
    },
    '5ephrx00': {
      'en': 'Creator',
      'ar': '',
    },
    'vecmzlbr': {
      'en': 'Designer',
      'ar': '',
    },
    '1uh6klp3': {
      'en': 'Total Usage Limit',
      'ar': 'حد الاستخدام الإجمالي',
    },
    'zpbykr5g': {
      'en': '',
      'ar': '',
    },
    'oqgl0px3': {
      'en': '1000',
      'ar': '',
    },
    'qtuvxzd6': {
      'en': '(e.g., 1000  users)',
      'ar': '(على سبيل المثال، 1000 مستخدم)',
    },
    'zr0ihzlo': {
      'en': 'Eligible Products/Categories',
      'ar': '',
    },
    'ycffgwvt': {
      'en': '',
      'ar': 'يختار...',
    },
    '2j8p2qln': {
      'en': 'Search...',
      'ar': '',
    },
    'oj0qvcsu': {
      'en': 'Upload Coupon Image',
      'ar': '',
    },
    '27n8nm4f': {
      'en': 'Click or drop image',
      'ar': 'انقر لتحديد الصورة',
    },
    'qvbhoaoe': {
      'en': 'Field is required',
      'ar': '',
    },
    'uovfkdv1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '4wa8qoy7': {
      'en': 'Discount value is required',
      'ar': '',
    },
    't3uebp0o': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0ixx1lkh': {
      'en': 'Field is required',
      'ar': '',
    },
    'ii1p55pv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'incou1qj': {
      'en': 'Field is required',
      'ar': '',
    },
    '3xgqohtw': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'uj760tp7': {
      'en': 'Short internal note about coupon usage is required',
      'ar': '',
    },
    'kqueyazk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '9xpzaxje': {
      'en': 'Description is required',
      'ar': 'الوصف مطلوب',
    },
    'dpszy3gj': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'i999lpg9': {
      'en': 'Field is required',
      'ar': '',
    },
    '9st131ag': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '2ktl038z': {
      'en': 'Field is required',
      'ar': '',
    },
    'g7r6x5fa': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'atd8vkog': {
      'en': 'Input Field is required',
      'ar': '',
    },
    'yahtao0h': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'wvwm9d2s': {
      'en': 'Minimum usage limit is required',
      'ar': '',
    },
    'o6rpwkkv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'i4ch818t': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Discount
  {
    's0q84kio': {
      'en': 'Discounts',
      'ar': 'إعدادات',
    },
    'ol8eed2t': {
      'en': 'Set Promotional Banners',
      'ar': 'تعيين لافتات ترويجية',
    },
    'zjhq2hxf': {
      'en': 'Manage Loyalty Program',
      'ar': 'إدارة برنامج الولاء',
    },
    '8mpllbyi': {
      'en': 'More Actions ',
      'ar': 'مزيد من الإجراءات',
    },
    'd6ap0jkt': {
      'en': 'Search...',
      'ar': '',
    },
    'mudzryw0': {
      'en': 'Option 1',
      'ar': '',
    },
    'kyhdpfqj': {
      'en': 'Option 2',
      'ar': '',
    },
    'v30co42w': {
      'en': 'Option 3',
      'ar': '',
    },
    'h7qncm63': {
      'en': 'Total Loyalty Members',
      'ar': 'إجمالي المنتجات المدرجة',
    },
    '0oaahfpx': {
      'en': '25,000',
      'ar': '',
    },
    'ahy874qv': {
      'en': 'Gold Level Users',
      'ar': 'مستخدمو المستوى الذهبي',
    },
    '3qjfyvcq': {
      'en': '5,500',
      'ar': '',
    },
    'yuizpvju': {
      'en': 'Points Redeemed',
      'ar': 'إجمالي المنتجات المدرجة',
    },
    'bztem0lr': {
      'en': '2.5M',
      'ar': '',
    },
    'm9grz25z': {
      'en': 'Coupons Redeemed',
      'ar': 'موافقات المنتج المعلقة',
    },
    'rvf8ibt8': {
      'en': '1,200',
      'ar': '',
    },
    'd30f5tzu': {
      'en': 'Expiring Coupons',
      'ar': 'تنبيهات انخفاض المخزون',
    },
    '5gzwjn62': {
      'en': '15 Offers',
      'ar': 'فستان ساتان أنيق (2 من الزبائن)',
    },
    'syr1s94h': {
      'en': '250',
      'ar': '',
    },
    'wb7q4nc0': {
      'en': 'Active Promotions',
      'ar': 'المنتج الأكثر مبيعا',
    },
    'k3mxpj6q': {
      'en': '12 Campaigns',
      'ar': '',
    },
    'j5rrnts6': {
      'en': 'Loyalty Rewards',
      'ar': 'البيانات الشخصية',
    },
    'le91lvzd': {
      'en': 'Coupons',
      'ar': 'العروض الترويجية',
    },
    'kslwfmft': {
      'en': 'Promotions',
      'ar': 'الأرباح والمدفوعات',
    },
    'xqpzcxnw': {
      'en': 'Coupons',
      'ar': 'البيانات الشخصية',
    },
    'uwmiik4t': {
      'en': 'Loyalty Program Management',
      'ar': '',
    },
    '9muw887z': {
      'en': 'Silver',
      'ar': 'فضي',
    },
    'f2zejn3i': {
      'en': 'Points Required',
      'ar': 'النقاط المطلوبة',
    },
    'm59ojgia': {
      'en': '0 - 750 Points',
      'ar': '0 - 750 نقطة',
    },
    'z1ieto0x': {
      'en': 'Benefits',
      'ar': '',
    },
    'zg2rgxdp': {
      'en': '1x Points, Free Shipping, Birthday Bonus',
      'ar': '1x نقاط، شحن مجاني، مكافأة عيد ميلاد',
    },
    '6selqyco': {
      'en': 'Gold',
      'ar': '',
    },
    '9e15dav6': {
      'en': 'Points Required',
      'ar': '',
    },
    'pi6tb539': {
      'en': '750 - 1,500 Points',
      'ar': '',
    },
    's0r6w33a': {
      'en': 'Benefits',
      'ar': '',
    },
    '3jgasdo4': {
      'en': '2x Points, Early Access, 10% Discounts',
      'ar': '2x نقاط، الوصول المبكر، خصم 10%',
    },
    'jhp2txzl': {
      'en': 'Platinum',
      'ar': '',
    },
    '8c0iqdb4': {
      'en': 'Points Required',
      'ar': '',
    },
    'lr4q9el1': {
      'en': '1,500+ Points',
      'ar': '',
    },
    'aeb1yxk2': {
      'en': 'Benefits',
      'ar': '',
    },
    'bqu3tmjm': {
      'en': '3x Points, VIP Access, 15% Discounts',
      'ar': '3x نقاط، دخول VIP، خصم 15%',
    },
    '2xp3axps': {
      'en': 'Gold',
      'ar': '',
    },
    'r6x7uyjw': {
      'en': 'Points Required',
      'ar': '',
    },
    'ouh8tac8': {
      'en': '750 - 1,500 Points',
      'ar': '',
    },
    '2ngg0nqi': {
      'en': 'Benefits',
      'ar': '',
    },
    'q1te5in8': {
      'en': '2x Points, Early Access, 10% Discounts',
      'ar': '',
    },
    'ponch8qn': {
      'en': 'Platinum',
      'ar': '',
    },
    'k4vwypzn': {
      'en': 'Points Required',
      'ar': '',
    },
    'rt74cud4': {
      'en': '1,500+ Points',
      'ar': '',
    },
    '318il2f5': {
      'en': 'Benefits',
      'ar': '',
    },
    '9u8krhya': {
      'en': '3x Points, VIP Access, 15% Discounts',
      'ar': '',
    },
    '3h4hnxp5': {
      'en': 'Active Coupons',
      'ar': '',
    },
    '3mhwjiiz': {
      'en': 'Expired Coupons',
      'ar': '',
    },
    'dihuezma': {
      'en': 'Active Coupons',
      'ar': '',
    },
    'cw0plbcq': {
      'en': 'Export',
      'ar': '',
    },
    '24sf7iwn': {
      'en': 'Weekly',
      'ar': '',
    },
    'ei8xgpr4': {
      'en': 'Search...',
      'ar': '',
    },
    '839arbbl': {
      'en': 'Option 1',
      'ar': '',
    },
    'kvvce2lt': {
      'en': 'Option 2',
      'ar': '',
    },
    'i0w9neeh': {
      'en': 'Option 3',
      'ar': '',
    },
    '8ps10ckg': {
      'en': 'Add New Coupon',
      'ar': '',
    },
    '94pfzi5p': {
      'en': 'Coupon Code',
      'ar': '',
    },
    '9ujoejzz': {
      'en': 'Discount',
      'ar': '',
    },
    'm25u2q3p': {
      'en': 'Valid Until',
      'ar': '',
    },
    'kmwluxwn': {
      'en': 'Avaliable Usage Limit',
      'ar': '',
    },
    '4eb3wvyu': {
      'en': 'Redeemed Users',
      'ar': '',
    },
    'hsyie8lb': {
      'en': 'Actions',
      'ar': '',
    },
    'bdab5zwv': {
      'en': 'Actions',
      'ar': '',
    },
    'niz1e51n': {
      'en': 'Edit',
      'ar': '',
    },
    'tpdy4iif': {
      'en': 'No financial data to show yet!',
      'ar': 'لا توجد بيانات مالية لعرضها حتى الآن!',
    },
    'hst3gwxc': {
      'en':
          'Once transactions or earnings are recorded, they’ll appear here for your review.',
      'ar': 'بمجرد تسجيل المعاملات أو الأرباح، ستظهر هنا لمراجعتها.',
    },
    'b0548gt4': {
      'en': 'Coupon Code',
      'ar': '',
    },
    'zg5y5qnb': {
      'en': 'Discount',
      'ar': '',
    },
    'wxlv5n8c': {
      'en': 'AYZ-4379',
      'ar': '',
    },
    'wq74m1wb': {
      'en': 'Feb 12, 2025',
      'ar': '',
    },
    '2ilc9i57': {
      'en': 'Valid Until',
      'ar': '',
    },
    'sp5bwo9l': {
      'en': 'Order Purchase',
      'ar': '',
    },
    'ak9kh6xv': {
      'en': 'Usage Limit',
      'ar': '',
    },
    '1eo2g01i': {
      'en': '+150 Points',
      'ar': '',
    },
    'vjn84sab': {
      'en': 'Redeemed',
      'ar': '',
    },
    '0xlicnx8': {
      'en': '-30 Points',
      'ar': '',
    },
    '08iefeti': {
      'en': 'Actions',
      'ar': '',
    },
    'ykhwbqet': {
      'en': ' ',
      'ar': '',
    },
    'xzkh7vvq': {
      'en': 'No financial data to show yet!',
      'ar': 'لا توجد بيانات مالية لعرضها حتى الآن!',
    },
    'k5eq3p7l': {
      'en':
          'Once transactions or earnings are recorded, they’ll appear here for your review.',
      'ar': 'بمجرد تسجيل المعاملات أو الأرباح، ستظهر هنا لمراجعتها.',
    },
    '9awc5fml': {
      'en': 'Export',
      'ar': '',
    },
    'bu34pgju': {
      'en': 'Weekly',
      'ar': '',
    },
    'qma0f88n': {
      'en': 'Search...',
      'ar': '',
    },
    'we9q2odd': {
      'en': 'Option 1',
      'ar': '',
    },
    'yq3grywu': {
      'en': 'Option 2',
      'ar': '',
    },
    'xlxf2hz4': {
      'en': 'Option 3',
      'ar': '',
    },
    '00h2hhlr': {
      'en': 'Customer ID',
      'ar': '',
    },
    'iycg1trc': {
      'en': 'Date',
      'ar': '',
    },
    'ey8abxae': {
      'en': 'AYZ-4379',
      'ar': '',
    },
    'sit88d3k': {
      'en': 'Feb 12, 2025',
      'ar': '',
    },
    'flse73tm': {
      'en': 'Transaction',
      'ar': '',
    },
    'rrzrtetj': {
      'en': 'Order Purchase',
      'ar': '',
    },
    'kgcfv58w': {
      'en': 'Points Earned',
      'ar': '',
    },
    'p5vxfnp9': {
      'en': '+150 Points',
      'ar': '',
    },
    'uejfe71r': {
      'en': 'Points Used',
      'ar': '',
    },
    'y3sy3s09': {
      'en': '-30 Points',
      'ar': '',
    },
    'm9jtf97q': {
      'en': 'Status',
      'ar': '',
    },
    '9ipm8ate': {
      'en': '750 Points',
      'ar': '',
    },
    'q060z5ss': {
      'en': ' ',
      'ar': '',
    },
    '45et4bck': {
      'en': 'No financial data to show yet!',
      'ar': 'لا توجد بيانات مالية لعرضها حتى الآن!',
    },
    '25subvkl': {
      'en':
          'Once transactions or earnings are recorded, they’ll appear here for your review.',
      'ar': 'بمجرد تسجيل المعاملات أو الأرباح، ستظهر هنا لمراجعتها.',
    },
    '7ctn40q0': {
      'en': 'Home',
      'ar': '',
    },
  },
  // LoyaltyProgramTiers
  {
    'du25qjhz': {
      'en': 'Loyalty Program Tiers',
      'ar': 'مستويات برنامج الولاء',
    },
    'shympnce': {
      'en': 'Save changes',
      'ar': 'حفظ التغييرات',
    },
    '9gilrlsj': {
      'en': '+ Add New Tier',
      'ar': 'إضافة مستوي جديد',
    },
    'lvsouphx': {
      'en': 'Tier Name',
      'ar': 'بوابة الدفع',
    },
    'hzh775fy': {
      'en': '',
      'ar': '',
    },
    'yyvuo1uc': {
      'en': 'Silver',
      'ar': '',
    },
    'zmbpp8ic': {
      'en': 'Points Required',
      'ar': 'النقاط المطلوبة',
    },
    'uil9dr6e': {
      'en': 'Point',
      'ar': 'نقطة',
    },
    'c9xndp82': {
      'en': '0',
      'ar': '',
    },
    'h1z37jyd': {
      'en': 'to',
      'ar': '',
    },
    'vzv6yu81': {
      'en': 'Point',
      'ar': 'نقطة',
    },
    'vc068beu': {
      'en': '759',
      'ar': '',
    },
    '88fpxbzv': {
      'en': '0 – 749',
      'ar': '',
    },
    'i9ecr48r': {
      'en': 'Points Multiplier',
      'ar': 'بوابة الدفع',
    },
    'tzk9nned': {
      'en': '1x',
      'ar': 'يختار...',
    },
    'r9x6h7us': {
      'en': 'Search...',
      'ar': '',
    },
    'imjskhbj': {
      'en': 'Point',
      'ar': '',
    },
    'zvoz3mzq': {
      'en': '0',
      'ar': '',
    },
    'sdlbsh58': {
      'en': '=',
      'ar': '',
    },
    'wlowo0b3': {
      'en': 'Point',
      'ar': 'نقطة',
    },
    'h4fvibai': {
      'en': '759',
      'ar': '',
    },
    't2w8ham6': {
      'en': '1x (1 KD = 1 Point)',
      'ar': '',
    },
    'b119kstu': {
      'en': 'Tier Benefits',
      'ar': 'مزايا المستوي',
    },
    'eqz0q8z0': {
      'en': '',
      'ar': '',
    },
    'hystgd35': {
      'en': 'Free Shipping, Birthday Bonus',
      'ar': 'شحن مجاني، مكافأة عيد ميلاد',
    },
    '9rctr6lv': {
      'en': 'Downgrade If Inactive For',
      'ar': 'تخفيض الإصدار إذا كان غير نشط لـ',
    },
    '2thffmuq': {
      'en': '6 Months',
      'ar': 'يختار...',
    },
    'ksx8we4a': {
      'en': 'Search...',
      'ar': '',
    },
    '5fjw003q': {
      'en': 'Auto-upgrade user to next tier when eligible',
      'ar': 'ترقية المستخدم تلقائيًا إلى المستوى التالي عند الأهلية',
    },
    '1ce71ica': {
      'en': 'Tier Name',
      'ar': 'بوابة الدفع',
    },
    'svmuzlca': {
      'en': '',
      'ar': '',
    },
    '6qddtlti': {
      'en': 'Gold',
      'ar': '',
    },
    'qvggb5ec': {
      'en': 'Points Required',
      'ar': 'النقاط المطلوبة',
    },
    'qlc803pz': {
      'en': 'Point',
      'ar': '',
    },
    'ujiqp0to': {
      'en': '750',
      'ar': '',
    },
    'hmi8scok': {
      'en': 'to',
      'ar': '',
    },
    '8fkiyqmo': {
      'en': 'Point',
      'ar': '',
    },
    '3ocoul33': {
      'en': '1499',
      'ar': '',
    },
    'm7sim17k': {
      'en': '750 – 1449',
      'ar': '',
    },
    '6brds9uj': {
      'en': 'Points Multiplier',
      'ar': 'مضاعف النقاط',
    },
    '8bgkv86l': {
      'en': '2x',
      'ar': 'يختار...',
    },
    '88eg0iox': {
      'en': 'Search...',
      'ar': '',
    },
    'k9xbrllc': {
      'en': 'KD',
      'ar': '',
    },
    'i7rmnyct': {
      'en': '1 KD',
      'ar': '',
    },
    'a78u6isz': {
      'en': '=',
      'ar': '',
    },
    'u6nd37t3': {
      'en': 'Point',
      'ar': '',
    },
    '4q0wy8sp': {
      'en': '1 Point',
      'ar': '',
    },
    'mp2k58r2': {
      'en': '2x (1 KD = 1 Point)',
      'ar': '',
    },
    'yr2q7nnv': {
      'en': 'Tier Benefits',
      'ar': 'مزايا المستوي',
    },
    'h65glwkl': {
      'en': '',
      'ar': '',
    },
    'tmorl2bf': {
      'en': 'Early Access, 10% Discount',
      'ar': '',
    },
    'w499ia23': {
      'en': 'Downgrade If Inactive For',
      'ar': 'تخفيض الإصدار إذا كان غير نشط لـ',
    },
    'vmgsy6yg': {
      'en': '6 Months',
      'ar': 'يختار...',
    },
    'k4arw5u6': {
      'en': 'Search...',
      'ar': '',
    },
    'ee4jsyuk': {
      'en': 'Auto-upgrade user to next tier when eligible',
      'ar': 'ترقية المستخدم تلقائيًا إلى المستوى التالي عند الأهلية',
    },
    'q0oypr4y': {
      'en': 'Tier Name',
      'ar': 'بوابة الدفع',
    },
    'zzgt932c': {
      'en': '',
      'ar': '',
    },
    'nzzbr4vq': {
      'en': 'Platinum',
      'ar': '',
    },
    '87jpa2oa': {
      'en': 'Points Required',
      'ar': 'بوابة الدفع',
    },
    'akoy3svj': {
      'en': 'Point',
      'ar': '',
    },
    'i4sluwey': {
      'en': '1500',
      'ar': '',
    },
    'bcjsouz0': {
      'en': 'to',
      'ar': '',
    },
    'itjgsc63': {
      'en': 'Point',
      'ar': '',
    },
    'za14ipbm': {
      'en': '1500+',
      'ar': '',
    },
    'dimloqxs': {
      'en': '1500+',
      'ar': '',
    },
    'drfz2lz6': {
      'en': 'Points Multiplier',
      'ar': 'مضاعف النقاط',
    },
    '3ua5i0s0': {
      'en': '3x',
      'ar': 'يختار...',
    },
    '1xax72qf': {
      'en': 'Search...',
      'ar': '',
    },
    'wgwkyoae': {
      'en': 'KD',
      'ar': '',
    },
    'la67ihsx': {
      'en': '1 KD',
      'ar': '',
    },
    'vzbe27ry': {
      'en': '=',
      'ar': '',
    },
    '4k1s4gbs': {
      'en': 'Point',
      'ar': '',
    },
    'jqo7hskd': {
      'en': '1 Point',
      'ar': '',
    },
    'h29mb9xs': {
      'en': '3x (1 KD = 1 Point)',
      'ar': '',
    },
    'bid1kber': {
      'en': 'Tier Benefits',
      'ar': 'بوابة الدفع',
    },
    'efjd60z6': {
      'en': '',
      'ar': '',
    },
    'japeq7mf': {
      'en': 'VIP Access, 15% Off, Free Gift',
      'ar': '',
    },
    '43ubxw4m': {
      'en': 'Downgrade If Inactive For',
      'ar': 'بوابة الدفع',
    },
    '47jav6vf': {
      'en': '6 Months',
      'ar': 'يختار...',
    },
    'ae6l4hv2': {
      'en': 'Search...',
      'ar': '',
    },
    'q0bt8gw0': {
      'en': 'Auto-upgrade user to next tier when eligible',
      'ar': 'ترقية المستخدم تلقائيًا إلى المستوى التالي عند الأهلية',
    },
    'ngsc4a0a': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'atr921ef': {
      'en': 'Save',
      'ar': 'إرسال إشعار',
    },
    'eg5jdnbd': {
      'en': 'Points System',
      'ar': '',
    },
    's212bd7c': {
      'en': 'Earn Rate',
      'ar': '',
    },
    'tqanhpow': {
      'en': '3x',
      'ar': 'يختار...',
    },
    'fdyur4pg': {
      'en': 'Search...',
      'ar': '',
    },
    'q6e825t9': {
      'en': '1 Point',
      'ar': '',
    },
    'gmbq14j7': {
      'en': 'Redeem Rate',
      'ar': '',
    },
    'yffvz9un': {
      'en': '100 Points',
      'ar': 'يختار...',
    },
    '7iv2kjzx': {
      'en': 'Search...',
      'ar': '',
    },
    'b18u17xj': {
      'en': '1 KD',
      'ar': '',
    },
    'qy9ghagp': {
      'en': 'Minimum to Redeem',
      'ar': '',
    },
    '3sy1wo28': {
      'en': '',
      'ar': '',
    },
    'rf6jnhjw': {
      'en': '500 Points',
      'ar': '',
    },
    '2my8ra1o': {
      'en': 'Maximum Redeemable Per Order',
      'ar': 'الحد الأقصى للاستبدال لكل طلب',
    },
    'd8i8xahy': {
      'en': '',
      'ar': '',
    },
    '6d6rq8az': {
      'en': '25 KD',
      'ar': '',
    },
    'fhr2pdxj': {
      'en': 'Assign Points When Order Is:',
      'ar': 'حالة الرؤية',
    },
    'rqqmarz4': {
      'en': 'Paid',
      'ar': 'المنتج المميز',
    },
    'lk51hl50': {
      'en': 'Delivered',
      'ar': 'منتج شائع',
    },
    'dgkablzg': {
      'en': 'Returned (Deduct Points)',
      'ar': 'المنتج الموصى به',
    },
    'fuh63340': {
      'en': 'Exclude from Rewards',
      'ar': 'حالة الرؤية',
    },
    'os3yh2rx': {
      'en': 'active',
      'ar': '',
    },
    '8sptopuu': {
      'en': 'Product Tags',
      'ar': 'يختار...',
    },
    '0u45flsr': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    '49g117zj': {
      'en': 'Active',
      'ar': '',
    },
    'oguivstf': {
      'en': 'Inactive',
      'ar': '',
    },
    'rox3x1nj': {
      'en': 'Draft',
      'ar': '',
    },
    'eoflag9k': {
      'en': 'Request',
      'ar': '',
    },
    '7sgpd6tb': {
      'en': 'Bonus & Expiry',
      'ar': 'المكافأة وانتهاء الصلاحية',
    },
    'wx6pvcyw': {
      'en': 'Bonus Rules',
      'ar': 'قواعد المكافأة',
    },
    'g1mc4h1j': {
      'en': 'On Signup',
      'ar': 'عند التسجيل',
    },
    '56b5dic4': {
      'en': '',
      'ar': '',
    },
    '9tjvd2ih': {
      'en': '100 Points',
      'ar': '',
    },
    'udf2spoq': {
      'en': 'On Birthday',
      'ar': 'في عيد الميلاد',
    },
    '78bel8q2': {
      'en': '',
      'ar': '',
    },
    '49jpxhvw': {
      'en': '200 Points',
      'ar': '',
    },
    'xw9n0a2l': {
      'en': 'On First Purchase',
      'ar': 'عند الشراء الأول',
    },
    'g17dox70': {
      'en': '',
      'ar': '',
    },
    'bws3rbww': {
      'en': '150 Points',
      'ar': '',
    },
    'pbvlmv3r': {
      'en': 'Points Expiry',
      'ar': 'حالة الرؤية',
    },
    '6sxz7zhl': {
      'en': 'Points Expire After',
      'ar': 'انتهاء صلاحية النقاط بعد',
    },
    '8i9bpl9h': {
      'en': 'active',
      'ar': '',
    },
    'gy8ufjqg': {
      'en': '6 Months',
      'ar': 'يختار...',
    },
    'aua269ef': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'u6fzhz7x': {
      'en': '',
      'ar': '',
    },
    'omiyr7g6': {
      'en': '',
      'ar': '',
    },
    'mhri1q5b': {
      'en': '',
      'ar': '',
    },
    'h3wvkb07': {
      'en': '',
      'ar': '',
    },
    'inw1nkgv': {
      'en': 'Send Reminder Before Expiry',
      'ar': 'إرسال تذكير قبل انتهاء الصلاحية',
    },
    'mv93ddqu': {
      'en': 'active',
      'ar': '',
    },
    'sn776thl': {
      'en': '6 Months',
      'ar': 'يختار...',
    },
    'v6px6pr9': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    '8md2n44u': {
      'en': 'Active',
      'ar': '',
    },
    '9efxmm8x': {
      'en': 'Inactive',
      'ar': '',
    },
    'i62x4ezj': {
      'en': 'Draft',
      'ar': '',
    },
    'p6mfizlf': {
      'en': 'Request',
      'ar': '',
    },
    'uvt5hth3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // home_setting
  {
    'yvxyaqrn': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'aqqdmlmv': {
      'en': 'Homepage Options',
      'ar': 'خيارات الصفحة الرئيسية',
    },
    'mpsld715': {
      'en': 'Reset to default',
      'ar': 'إعادة التعيين إلى الوضع الافتراضي',
    },
    'ma7b0xop': {
      'en': 'Save changes',
      'ar': 'حفظ التغييرات',
    },
    'lquu8x3v': {
      'en': 'Level 01',
      'ar': 'يختار...',
    },
    'c8eok631': {
      'en': 'Search...',
      'ar': '',
    },
    'pzl2hd5n': {
      'en': 'Search Bar on Homepage',
      'ar': 'شريط البحث في الصفحة الرئيسية',
    },
    'd8m74zi9': {
      'en': 'Bag on Homepage',
      'ar': 'السلة على الصفحة الرئيسية',
    },
    '8q4jy9pr': {
      'en': 'Level 01',
      'ar': 'يختار...',
    },
    '7y4x6rxw': {
      'en': 'Search...',
      'ar': '',
    },
    'pnqnnoye': {
      'en': 'Categories on Homepage',
      'ar': 'الفئات على الصفحة الرئيسية',
    },
    'qzbfc1r3': {
      'en': 'Level 01',
      'ar': 'يختار...',
    },
    '9dr61p28': {
      'en': 'Search...',
      'ar': '',
    },
    'qnqxbzsa': {
      'en': 'Main Banner Slider',
      'ar': 'شريط التمرير الرئيسي',
    },
    'xb9qrn4g': {
      'en': 'Add',
      'ar': 'حفظ ومتابعة',
    },
    'ypyieb74': {
      'en': 'Creator Banner Slider',
      'ar': 'تحديث حالة الرفض',
    },
    '5kdsexq3': {
      'en': 'Add',
      'ar': 'اضافة',
    },
    'itpd7jja': {
      'en': 'Level 01',
      'ar': 'يختار...',
    },
    'o6f6efi6': {
      'en': 'Search...',
      'ar': '',
    },
    'rz2ppy0x': {
      'en': 'Recently Viewed',
      'ar': 'تمت مشاهدته مؤخرًا',
    },
    '5dr1d2bz': {
      'en': 'Recommended for You',
      'ar': 'موصى به لك',
    },
    '4sotep0t': {
      'en': 'Newly launched',
      'ar': 'موصى به لك',
    },
    'qhr96lgb': {
      'en': 'Home',
      'ar': '',
    },
  },
  // TryOn
  {
    '6vmurk5a': {
      'en': 'Try-On Credits',
      'ar': 'رصيد التجربة',
    },
    'p02iatz4': {
      'en': 'Manage Loyalty Program',
      'ar': 'إدارة برنامج الولاء',
    },
    'grq25gsn': {
      'en': 'More Actions ',
      'ar': 'مزيد من الإجراءات',
    },
    's42piovg': {
      'en': 'Search...',
      'ar': '',
    },
    'rdlymngk': {
      'en': 'Option 1',
      'ar': '',
    },
    'z9j60t3d': {
      'en': 'Option 2',
      'ar': '',
    },
    '1xyqr776': {
      'en': 'Option 3',
      'ar': '',
    },
    '98ntq9h1': {
      'en': 'Total Try-On Users',
      'ar': 'إجمالي مستخدمي التجربة',
    },
    'xastyrwp': {
      'en': '25,000',
      'ar': '',
    },
    'avsbqpc5': {
      'en': 'Credits Sold',
      'ar': 'الاعتمادات المباعة',
    },
    'aboq02ty': {
      'en': '5,500',
      'ar': '',
    },
    'dpeohklz': {
      'en': 'Credits Used',
      'ar': 'الاعتمادات المستخدمة',
    },
    '1wjodjp7': {
      'en': '2.5M',
      'ar': '',
    },
    'mu8e44j9': {
      'en': 'Total Credit Packs',
      'ar': 'إجمالي حزم الائتمان',
    },
    '5xfp6a14': {
      'en': '1,200',
      'ar': '',
    },
    'x1g5m9dy': {
      'en': 'Photos Uploaded',
      'ar': 'الصور التي تم تحميلها',
    },
    'u7zmcrwr': {
      'en': '15 Offers',
      'ar': 'فستان ساتان أنيق (2 من الزبائن)',
    },
    '08vjv72g': {
      'en': '250',
      'ar': '',
    },
    'r2qr1tu7': {
      'en': 'Outfits Tried On',
      'ar': 'الملابس التي تم تجربتها',
    },
    'zd06ev1j': {
      'en': '12 Campaigns',
      'ar': '',
    },
    'g3512o4e': {
      'en': 'Export',
      'ar': '',
    },
    'q6p5reni': {
      'en': 'Weekly',
      'ar': '',
    },
    '130tv0a6': {
      'en': 'Search...',
      'ar': '',
    },
    'meyubv79': {
      'en': 'Option 1',
      'ar': '',
    },
    '0lfs4wps': {
      'en': 'Option 2',
      'ar': '',
    },
    'wdnw2mcp': {
      'en': 'Option 3',
      'ar': '',
    },
    'q7lly0lt': {
      'en': 'Credit Pack Management',
      'ar': 'إدارة حزمة الائتمان',
    },
    '95alss83': {
      'en': 'Add New Pack',
      'ar': 'إضافة حزمة جديدة',
    },
    '0mqt3s88': {
      'en': 'Pack Name',
      'ar': 'اسم الحزمة',
    },
    'ieiwxeuf': {
      'en': 'Credits',
      'ar': 'الاعتمادات',
    },
    'i3ljc6ei': {
      'en': 'Price',
      'ar': 'السعر',
    },
    'ol9lc7v5': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    '179a38d5': {
      'en': 'Role',
      'ar': 'الدور',
    },
    'e5ow0nni': {
      'en': 'Date',
      'ar': 'التاريخ',
    },
    '2inbet68': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    'bfbw6s4v': {
      'en': 'Credit point',
      'ar': 'نقطة الائتمان',
    },
    'ssxawqbe': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'ttao3k7h': {
      'en': 'No financial data to show yet!',
      'ar': 'لا توجد بيانات مالية لعرضها حتى الآن!',
    },
    'o81q2e6j': {
      'en':
          'Once transactions or earnings are recorded, they’ll appear here for your review.',
      'ar': 'بمجرد تسجيل المعاملات أو الأرباح، ستظهر هنا لمراجعتها.',
    },
    'zbqgpfof': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Return-Orders
  {
    'f6n3keo2': {
      'en': 'Return Orders',
      'ar': 'إرجاع الطلبات',
    },
    'mc45b7lf': {
      'en': 'Export',
      'ar': '',
    },
    '6lc11vde': {
      'en': 'More Actions',
      'ar': 'مزيد من الإجراءات',
    },
    'kt0uipx9': {
      'en': 'Search...',
      'ar': '',
    },
    '5j9b0lyb': {
      'en': 'More Actions',
      'ar': 'مزيد من الإجراءات',
    },
    'glxlracl': {
      'en': 'Create Order',
      'ar': 'إنشاء الطلب',
    },
    '5hoi2a55': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'zxyd8vvf': {
      'en': 'Accepted',
      'ar': 'مقبول',
    },
    'bl3mo7kh': {
      'en': 'Rejected',
      'ar': 'غير مدفوعة الأجر',
    },
    '3de9rf7b': {
      'en': 'Archived',
      'ar': 'مؤرشفة',
    },
    'x8flvf85': {
      'en': 'Pending',
      'ar': 'الجميع',
    },
    'jsk0h7ea': {
      'en': 'Search...',
      'ar': '',
    },
    'dmp626vk': {
      'en': 'Request ID',
      'ar': 'معرف الطلب',
    },
    'ko0nmpsb': {
      'en': 'Date',
      'ar': 'التاريخ',
    },
    'nbgz7kce': {
      'en': 'Customer',
      'ar': 'عميل',
    },
    'dmlpobyz': {
      'en': 'Items',
      'ar': 'أغراض',
    },
    'qdepa1wo': {
      'en': 'Total',
      'ar': 'الإجمالي ',
    },
    'u2s7rpjb': {
      'en': 'Approve',
      'ar': 'يعتمد',
    },
    'u1t4hbzy': {
      'en': 'Reject',
      'ar': 'يرفض',
    },
    'pb0j8her': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Creator-Promotions
  {
    'y48xzg6n': {
      'en': 'Creators Promotions',
      'ar': 'عميل قائمة الانتظار',
    },
    'l7b1s3nf': {
      'en': 'Total Promotion Requests',
      'ar': 'إجمالي طلبات الترويج',
    },
    'tztlm8pu': {
      'en': 'Active Campaigns',
      'ar': 'الحملات النشطة',
    },
    '7dcn5hw8': {
      'en': 'Preapproved Campaigns',
      'ar': 'الحملات المعتمدة مسبقًا',
    },
    '9680z8n4': {
      'en': '250',
      'ar': '',
    },
    '5t2fk7mv': {
      'en': 'Top Creator This Month',
      'ar': 'أفضل منشئ محتوى هذا الشهر',
    },
    '9rd3ttac': {
      'en': 'Sales via Promotions',
      'ar': 'المبيعات عبر العروض الترويجية',
    },
    'a399zsvb': {
      'en': 'Avg Engagement Rate\t',
      'ar': 'متوسط معدل التفاعل',
    },
    'knif8wkm': {
      'en': 'Auto Approved',
      'ar': 'تمت الموافقة تلقائيًا',
    },
    'nrv5ggu1': {
      'en': 'Manual Approved',
      'ar': 'تمت الموافقة يدويا',
    },
    'bewtbzdz': {
      'en': 'Active',
      'ar': 'نشط',
    },
    'mbzg322h': {
      'en': 'Pending',
      'ar': 'يقبل',
    },
    'ufmu8i04': {
      'en': 'Archived',
      'ar': 'مكتمل',
    },
    'lwrlk1c1': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'tdfabqru': {
      'en': 'Search...',
      'ar': '',
    },
    'k92m1d6o': {
      'en': 'Promotion ID',
      'ar': 'معرف قائمة الانتظار',
    },
    '19tao300': {
      'en': 'Product ID & Name',
      'ar': 'اسم',
    },
    '5txldivp': {
      'en': 'Creator Name',
      'ar': 'اسم المنشئ',
    },
    'wfxufpfp': {
      'en': 'Start Date',
      'ar': 'تاريخ البدء',
    },
    'mwwknva5': {
      'en': 'End Date',
      'ar': 'تاريخ الانتهاء',
    },
    'w4qrtvhh': {
      'en': '',
      'ar': 'حالة',
    },
    '8mhlpi3k': {
      'en': 'View details',
      'ar': 'عرض التفاصيل',
    },
    '3akitz0q': {
      'en': 'Active',
      'ar': 'نشط',
    },
    'mxvdcc5d': {
      'en': 'Pending',
      'ar': 'يقبل',
    },
    'oa2v7a04': {
      'en': 'Archived',
      'ar': 'مكتمل',
    },
    'zl96no2v': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    '4pehbr3s': {
      'en': 'Search...',
      'ar': '',
    },
    'q4p6o0vj': {
      'en': 'Promotion ID',
      'ar': 'معرف قائمة الانتظار',
    },
    'px640xnu': {
      'en': 'Product Name',
      'ar': 'اسم',
    },
    'ssj7ji6m': {
      'en': 'Creator Name',
      'ar': 'بريد إلكتروني',
    },
    'ydftabda': {
      'en': 'Promotion Caption',
      'ar': 'عنوان العرض الترويجي',
    },
    '9n9q5mrg': {
      'en': 'Submmited Date',
      'ar': 'تاريخ الإرسال',
    },
    'n7bvpcv4': {
      'en': 'Start Date',
      'ar': 'تاريخ البدء',
    },
    'miggn0h2': {
      'en': 'End Date',
      'ar': 'تاريخ الانتهاء',
    },
    'wdgt6sa4': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'tk680uyv': {
      'en': 'Actions',
      'ar': 'الإجراءات',
    },
    'e527japa': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // TranslationBanner
  {
    'nnh2ti94': {
      'en': 'Translate Banner',
      'ar': 'منتجات',
    },
    '7g4w9hg5': {
      'en': 'Original',
      'ar': '',
    },
    '6xmm90p6': {
      'en': 'Manual',
      'ar': '',
    },
    'd3ac0bim': {
      'en': 'Kuwait Care Collective',
      'ar': '',
    },
    '0ncxhyo7': {
      'en': 'Name',
      'ar': '',
    },
    'g2v05m5h': {
      'en': 'name',
      'ar': '',
    },
    'wrxcai6p': {
      'en': 'Kuwait Care Collective',
      'ar': '',
    },
    'nu0vafjv': {
      'en': 'Name',
      'ar': '',
    },
    'c18cbqom': {
      'en': 'Name',
      'ar': 'اسم',
    },
    'h207swr2': {
      'en': 'Kuwait Care Collective',
      'ar': '',
    },
    'bq26e2qu': {
      'en': 'Description',
      'ar': '',
    },
    '3t1ib6o6': {
      'en': 'Descprtion',
      'ar': '',
    },
    '2uuu2gg8': {
      'en': 'Kuwait Care Collective',
      'ar': '',
    },
    '318fn68p': {
      'en': 'Description',
      'ar': '',
    },
    '98l1brma': {
      'en': 'Descprtion',
      'ar': '',
    },
    't62d7i0g': {
      'en': 'Update',
      'ar': '',
    },
    'vf0rxrbh': {
      'en': 'Home',
      'ar': '',
    },
  },
  // InventoryShippingLabel
  {
    '14hhy9tr': {
      'en': 'Create Shipping Labels for Inventory',
      'ar': 'إنشاء ملصقات الشحن',
    },
    'hbp6q5z5': {
      'en': 'Order ',
      'ar': 'طلب',
    },
    '53yf086l': {
      'en': '#3456',
      'ar': '',
    },
    'nsani7y7': {
      'en': ' . ',
      'ar': '',
    },
    '1i7tij6r': {
      'en': 'Jan 8, 2025',
      'ar': '',
    },
    '1duelfez': {
      'en': 'Create shipping labels',
      'ar': '',
    },
    'tnz3pyxw': {
      'en': 'Notes',
      'ar': '',
    },
    'btszly8g': {
      'en': 'First customer and order!',
      'ar': '',
    },
    'gd0tuk4k': {
      'en': '',
      'ar': '',
    },
    'qhhr9s1c': {
      'en': 'First customer and order!      ',
      'ar': '',
    },
    'bkdh26x9': {
      'en': 'Shipping address',
      'ar': '',
    },
    'ire253es': {
      'en': 'Emma Williams',
      'ar': '',
    },
    '1fchoku6': {
      'en': 'Kuwait City, Dubai, Riyadh',
      'ar': '',
    },
    'q4obvsk6': {
      'en': 'Pickup address',
      'ar': '',
    },
    '256tg80d': {
      'en': 'Drop address',
      'ar': '',
    },
    'aoai81qk': {
      'en': 'Product',
      'ar': '',
    },
    'i5481x8r': {
      'en': 'Edit weight',
      'ar': '',
    },
    '1jmeq6bd': {
      'en': ' / ',
      'ar': '',
    },
    'w9w5eizq': {
      'en': 'Urban Style Dress ',
      'ar': '',
    },
    '0vepbkds': {
      'en': 'Quantity',
      'ar': '',
    },
    '1fc36paz': {
      'en': 'Package and weight',
      'ar': '',
    },
    '1cw9rbsv': {
      'en': 'Add package',
      'ar': '',
    },
    'aca7k9f3': {
      'en': 'Select Package and weight',
      'ar': '',
    },
    'kwfcq075': {
      'en': 'Collapsed body text',
      'ar': '',
    },
    'jxbxhwxr': {
      'en': 'Expanded body text',
      'ar': '',
    },
    '9w4yfvjo': {
      'en': 'Total Weight',
      'ar': '',
    },
    'eaiswkdh': {
      'en': 'TextField',
      'ar': '',
    },
    'bwg9tz7t': {
      'en': '0',
      'ar': '',
    },
    'wtujciy0': {
      'en': 'gm',
      'ar': 'جنرال موتورز',
    },
    'mhe95cf1': {
      'en': 'gm',
      'ar': '',
    },
    'okaysgby': {
      'en': 'Search...',
      'ar': '',
    },
    'cdx44i8t': {
      'en': 'kg',
      'ar': 'كجم',
    },
    '6hx59e1q': {
      'en': 'gm',
      'ar': 'جنرال موتورز',
    },
    '5o7sh6ly': {
      'en': 'Package Count',
      'ar': '',
    },
    '3msi80u3': {
      'en': '1',
      'ar': '',
    },
    'j8xlgoqx': {
      'en': 'Create shipping order',
      'ar': '',
    },
    '3cuaalfd': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ProductSettings
  {
    'k31qf1uw': {
      'en': 'Product Settings',
      'ar': 'الأذونات',
    },
    'rp2qtii0': {
      'en': 'Product Permission',
      'ar': '',
    },
    'ejznkkh1': {
      'en': 'Estimate Shipping Days',
      'ar': 'تقدير أيام الشحن',
    },
    'ybhz1rfp': {
      'en': 'Procurement Cost',
      'ar': 'تكلفة المشتريات',
    },
    '7aatow0r': {
      'en': 'Procurement Price',
      'ar': 'سعر الشراء',
    },
    'so1125su': {
      'en': 'Compare Cost',
      'ar': 'ترايون الافتراضي',
    },
    'hmzyj5qo': {
      'en': 'Estimate Shipping No. Days (If Ordered)',
      'ar': 'ترايون الافتراضي',
    },
    '1ibcjqff': {
      'en': 'Product Price',
      'ar': 'ترايون الافتراضي',
    },
    'uvsstscy': {
      'en': 'Compare at Price (Optional)',
      'ar': 'ترايون الافتراضي',
    },
    'p84y95dl': {
      'en': 'Weight (gm)',
      'ar': 'ترايون الافتراضي',
    },
    'xpwelu3m': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Customers
  {
    '0ie0sk6a': {
      'en': 'Customers',
      'ar': 'العملاء\n',
    },
    'swqvnvli': {
      'en': 'Export',
      'ar': 'تصدير\n',
    },
    'svo165wr': {
      'en': 'More Actions',
      'ar': '',
    },
    'phshddct': {
      'en': 'Search...',
      'ar': '',
    },
    '6y6w6ue1': {
      'en': 'More Actions',
      'ar': '',
    },
    'avqkezcj': {
      'en': 'New Customers This Month',
      'ar': 'عملاء جدد هذا الشهر',
    },
    's8jksvof': {
      'en': 'Active Customers',
      'ar': 'العملاء النشطين',
    },
    '2hmfcurl': {
      'en': 'Deactive Customers',
      'ar': 'العملاء غير النشطين',
    },
    'uqy6d7d6': {
      'en': '250',
      'ar': '',
    },
    'lvmm4pu2': {
      'en': 'Total Customer',
      'ar': 'إجمالي العملاء',
    },
    'epr4belp': {
      'en': 'All Customers',
      'ar': 'جميع المستخدمين',
    },
    'jt6ubwf4': {
      'en': 'All Customers',
      'ar': 'جميع العملاء',
    },
    'i1pxjgh6': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'bak00y0j': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'uwf117bv': {
      'en': 'Users ID',
      'ar': 'معرف العميل',
    },
    '8ly3osqf': {
      'en': 'Name',
      'ar': 'اسم',
    },
    '12jyjrmu': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'jiuqi1cf': {
      'en': 'Phone',
      'ar': 'الهاتف \n',
    },
    'uwlko9uj': {
      'en': 'Role',
      'ar': 'الدور\n',
    },
    'jue0d9i7': {
      'en': 'Status',
      'ar': 'الحالة\n',
    },
    'am3if13i': {
      'en': 'Actions',
      'ar': 'الإجراءات',
    },
    'a1gx0dnb': {
      'en': 'View Details',
      'ar': 'عرض التفاصيل',
    },
    'f8ere17b': {
      'en': 'Your account looks neat and fresh.',
      'ar': 'حسابك يبدو أنيقًا وجديدًا.',
    },
    '2j97eb67': {
      'en': 'Everything you need is right at your fingertips.',
      'ar': 'كل ما تحتاجه في متناولك.\n',
    },
    '4cs3cux0': {
      'en': 'Home',
      'ar': 'الرئيسية\n',
    },
  },
  // ShippingOrders
  {
    'suxl7nhw': {
      'en': 'Orders',
      'ar': 'الطلبات\n',
    },
    'hxd8wqp0': {
      'en': 'Export',
      'ar': 'تصدير\n',
    },
    'm1vxztc7': {
      'en': 'More Actions',
      'ar': '',
    },
    'tmx495ao': {
      'en': 'Search...',
      'ar': '',
    },
    'x7umfw30': {
      'en': 'More Actions',
      'ar': '',
    },
    '8ns6whrg': {
      'en': 'Create Order',
      'ar': '',
    },
    '21vg26ng': {
      'en': 'All',
      'ar': 'الكل\n',
    },
    'yo9j8h4x': {
      'en': 'Search...',
      'ar': '',
    },
    'alloqka0': {
      'en': 'Delivery ID',
      'ar': 'معرف الطلب',
    },
    'e1x5d0lm': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'xhbdpaar': {
      'en': 'Customer',
      'ar': 'العميل\n',
    },
    'evjv7tkn': {
      'en': 'Items',
      'ar': 'العناصر  \n',
    },
    'k0kt64ul': {
      'en': 'Total',
      'ar': 'الإجمالي\n',
    },
    'grjjlatf': {
      'en': 'Payment Status',
      'ar': 'حالة الدفع',
    },
    'zm5x2ntr': {
      'en': 'All caught up!',
      'ar': 'لا توجد عناصر جديدة\n',
    },
    'u3shv95t': {
      'en':
          'There are no pending payments right now—everything looks good on your end.',
      'ar':
          'لا توجد أي مدفوعات معلقة في الوقت الحالي - كل شيء يبدو جيدًا من جانبك.\n',
    },
    '0bvfywej': {
      'en': 'Order ID',
      'ar': 'معرف الطلب',
    },
    'noil24lr': {
      'en': 'Date',
      'ar': 'تاريخ',
    },
    'x03qew7l': {
      'en': 'Customer',
      'ar': 'عميل',
    },
    'rqtjjgz4': {
      'en': 'Items',
      'ar': 'أغراض',
    },
    'lghdce1o': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    'kze36xay': {
      'en': 'Payment Status',
      'ar': 'حالة الدفع',
    },
    'yzu5o1wp': {
      'en': 'Assign Delivery Partner',
      'ar': 'تعيين شريك التسليم',
    },
    'cvdlj1ll': {
      'en': ' ',
      'ar': '',
    },
    'so2qkema': {
      'en': 'All caught up!',
      'ar': 'لا توجد عناصر جديدة\n',
    },
    '33roi0t2': {
      'en':
          'There are no pending payments right now—everything looks good on your end.',
      'ar':
          'لا توجد أي مدفوعات معلقة في الوقت الحالي - كل شيء يبدو جيدًا من جانبك.',
    },
    'r2feni0v': {
      'en': 'Today',
      'ar': '',
    },
    'ivfgqr5y': {
      'en': 'Total Orders',
      'ar': '',
    },
    '1i8wvmqg': {
      'en': 'Ordered items over time',
      'ar': '',
    },
    '248c2xy4': {
      'en': '6',
      'ar': '',
    },
    'rkj5m46i': {
      'en': '250',
      'ar': '',
    },
    '1n3glx1g': {
      'en': 'Returns',
      'ar': '',
    },
    'furnoofk': {
      'en': '0',
      'ar': '',
    },
    '3eapex3p': {
      'en': 'Fulfilled orders over time',
      'ar': '',
    },
    'tbj69buk': {
      'en': '0',
      'ar': '',
    },
    'rgvq1g0b': {
      'en': '250',
      'ar': '',
    },
    'zz1wjbwu': {
      'en': 'Delivered orders over time',
      'ar': '',
    },
    '2ps9qy7k': {
      'en': '0',
      'ar': '',
    },
    'tel00319': {
      'en': '250',
      'ar': '',
    },
    'l3c10dvw': {
      'en': 'Home',
      'ar': '',
    },
  },
  // TranslationCreatorBanner
  {
    'rbf0p01r': {
      'en': 'Translate Creator Banner',
      'ar': 'منتجات',
    },
    '19gndh5a': {
      'en': 'Original',
      'ar': '',
    },
    'flqv0pt8': {
      'en': 'Manual',
      'ar': '',
    },
    'o4ilio1g': {
      'en': 'Kuwait Care Collective',
      'ar': '',
    },
    '9a4ht7mk': {
      'en': 'Banner Name',
      'ar': '',
    },
    'ljq7nzai': {
      'en': 'Banner Name',
      'ar': '',
    },
    '79nqy7q7': {
      'en': 'Kuwait Care Collective',
      'ar': '',
    },
    'x2ob1roc': {
      'en': 'Banner Name',
      'ar': '',
    },
    'dn7bf3xh': {
      'en': 'Banner Name',
      'ar': '',
    },
    'iz65pj90': {
      'en': 'Kuwait Care Collective',
      'ar': '',
    },
    '343n49sr': {
      'en': 'Banner Descrption',
      'ar': '',
    },
    'evios4ep': {
      'en': 'Banner Descrption',
      'ar': '',
    },
    'q37be7nf': {
      'en': 'Kuwait Care Collective',
      'ar': '',
    },
    'f08mt4db': {
      'en': 'Banner Descrption',
      'ar': '',
    },
    'oqefcxxb': {
      'en': 'Banner Descrption',
      'ar': '',
    },
    'r7ietyfu': {
      'en': 'Update',
      'ar': '',
    },
    '0h6femeu': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Filterorders
  {
    'cafx5ke5': {
      'en': 'Filter & Sort Orders',
      'ar': 'طلبات',
    },
    'thw8xtzp': {
      'en': 'More Actions',
      'ar': '',
    },
    'h7al9uo1': {
      'en': 'Search...',
      'ar': '',
    },
    '0uno02px': {
      'en': 'More Actions',
      'ar': '',
    },
    'gql3f4sm': {
      'en': 'Syncfusion Orders',
      'ar': '',
    },
    'hddvg5vl': {
      'en': 'Search...',
      'ar': '',
    },
    'pf3ai1hh': {
      'en': 'Export',
      'ar': '',
    },
    '3j5rbomo': {
      'en': 'All',
      'ar': 'الجميع',
    },
    '4bq8tmqb': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Filterorders-nopage
  {
    'v1ac8jdn': {
      'en': 'Filter & Sort Orders',
      'ar': 'طلبات',
    },
    'v85jbmum': {
      'en': 'Export',
      'ar': '',
    },
    'hbismiy4': {
      'en': 'More Actions',
      'ar': '',
    },
    'grm4cpep': {
      'en': 'Search...',
      'ar': '',
    },
    '7d716ubo': {
      'en': 'More Actions',
      'ar': '',
    },
    'l3g7xbh7': {
      'en': 'Syncfusion Orders',
      'ar': '',
    },
    'fgdw1xjh': {
      'en': 'All',
      'ar': 'الجميع',
    },
    'czbcfnw3': {
      'en': 'Search...',
      'ar': '',
    },
    '6ps24juv': {
      'en': 'Home',
      'ar': '',
    },
  },
  // s1-Payouts
  {
    '8lyszcf7': {
      'en': 'Payouts',
      'ar': 'منتجات',
    },
    'kayahylg': {
      'en': 'Creator',
      'ar': 'مكافآت الولاء',
    },
    'sd1f8x7o': {
      'en': 'Designer',
      'ar': 'كوبونات',
    },
    'k2myuclz': {
      'en': 'Creator',
      'ar': 'كوبونات',
    },
    'vc39oaax': {
      'en': 'Export',
      'ar': 'تصدير',
    },
    '58b022c1': {
      'en': 'Import',
      'ar': 'استيراد',
    },
    'mghqty9u': {
      'en': 'More Actions',
      'ar': 'المزيد من الاجراءات',
    },
    '6ena30e2': {
      'en': 'Search...',
      'ar': 'بحث',
    },
    'y20due9l': {
      'en': 'More Actions',
      'ar': 'المزيد من الاجراءات',
    },
    'ie4oyoy4': {
      'en': 'Create Payout',
      'ar': 'إضافة المنتج',
    },
    '8h2w7vcs': {
      'en': 'All Payouts',
      'ar': 'الجميع',
    },
    '3go7dbbe': {
      'en': 'In Progress',
      'ar': 'نشيط',
    },
    'ls67patj': {
      'en': 'Partially Paid',
      'ar': 'غير نشط',
    },
    'mj7jis15': {
      'en': 'Completed',
      'ar': 'مسودة',
    },
    'kiwwqfmh': {
      'en': 'All Payouts',
      'ar': '',
    },
    '5fmkw7rd': {
      'en': 'Auto-Approval',
      'ar': 'الموافقة التلقائية',
    },
    'bf79luhv': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    '7xvgd9d8': {
      'en': 'Batch ID',
      'ar': 'بطاقة تعريف',
    },
    'ctshhukl': {
      'en': '#P-20471',
      'ar': '',
    },
    '6a1xp1ff': {
      'en': 'Export Date',
      'ar': 'اسم',
    },
    'veaan6nx': {
      'en': 'Feb 18, 2026',
      'ar': '',
    },
    'czik2fbn': {
      'en': 'Period',
      'ar': 'سعر',
    },
    'wem8dnbe': {
      'en': 'Feb 01 to Feb 15, 2026',
      'ar': '',
    },
    '2mvrazgh': {
      'en': 'Total Amount',
      'ar': 'مخزون',
    },
    'h4ut7yfl': {
      'en': '1,240 KD',
      'ar': '',
    },
    'upn906ew': {
      'en': 'Creators Count',
      'ar': 'إجمالي المبيعات',
    },
    'xluqzmiy': {
      'en': '9 Creators',
      'ar': '',
    },
    '67dhtk26': {
      'en': 'Status',
      'ar': 'حالة',
    },
    'nbkbtucs': {
      'en': 'Action',
      'ar': '',
    },
    'etnl14r0': {
      'en': 'View',
      'ar': '',
    },
    'gub1sxvd': {
      'en': 'Export',
      'ar': '',
    },
    'rhgtjc2m': {
      'en': 'Home',
      'ar': '',
    },
  },
  // s2-CreatePayout
  {
    '9d3jrdaz': {
      'en': 'Create Payout',
      'ar': 'منتجات',
    },
    '8h3z7chl': {
      'en': 'Export',
      'ar': 'تصدير',
    },
    'mr8e1qr0': {
      'en': 'Import',
      'ar': 'استيراد',
    },
    '4zm91xvk': {
      'en': 'More Actions',
      'ar': 'المزيد من الاجراءات',
    },
    'g8vfvjwv': {
      'en': 'Search...',
      'ar': 'بحث',
    },
    'x059c8z1': {
      'en': 'More Actions',
      'ar': 'المزيد من الاجراءات',
    },
    '788me3ak': {
      'en': 'Create Payout',
      'ar': 'إضافة المنتج',
    },
    'k92galvo': {
      'en': 'Date Range',
      'ar': 'أعضاء الولاء الكامل',
    },
    '8ljdewhz': {
      'en': 'From Date',
      'ar': '',
    },
    'pd8u7p7s': {
      'en': 'To Date',
      'ar': '',
    },
    'ox6sw46s': {
      'en': 'Budget Range',
      'ar': 'أعضاء الولاء الكامل',
    },
    'kz1r0ksc': {
      'en': 'Minimum Amount',
      'ar': '',
    },
    'ibuub2yr': {
      'en': 'Maximum Amount',
      'ar': '',
    },
    'apngb22x': {
      'en': 'Sort by',
      'ar': 'أعضاء الولاء الكامل',
    },
    'ys1oykot': {
      'en': 'Select...',
      'ar': '',
    },
    '4rggc26d': {
      'en': 'Search...',
      'ar': '',
    },
    '9b16y5mq': {
      'en': 'Option 1',
      'ar': '',
    },
    '0mu6ycm2': {
      'en': 'Option 2',
      'ar': '',
    },
    'o0p2cbv5': {
      'en': 'Option 3',
      'ar': '',
    },
    'txg6xuqo': {
      'en': 'Reset Filters',
      'ar': '',
    },
    'krqi4ird': {
      'en': 'Apply Filters',
      'ar': '',
    },
    'xpxn2zzy': {
      'en': '9 Creators selected',
      'ar': '',
    },
    'x9ts624r': {
      'en': 'Clear Selection',
      'ar': '',
    },
    'ukrmvomi': {
      'en': 'Total Payout Amount: 1,240 KD',
      'ar': '',
    },
    'btsed47y': {
      'en': 'Cancel',
      'ar': '',
    },
    'btkwhmjn': {
      'en': 'Save Payout',
      'ar': '',
    },
    'kep7e7q9': {
      'en': 'Name',
      'ar': 'بطاقة تعريف',
    },
    'ykzb6dmn': {
      'en': 'Paula Irving',
      'ar': '',
    },
    '3nfndnua': {
      'en': 'Total Earnings',
      'ar': 'اسم',
    },
    'ujoz4hf3': {
      'en': '1,250 KD',
      'ar': '',
    },
    'bix64paj': {
      'en': 'Last Settled Date',
      'ar': 'سعر',
    },
    'yw56wlyc': {
      'en': 'Feb 01, 2025',
      'ar': '',
    },
    'vwle1tm7': {
      'en': 'Last Payout Amount',
      'ar': 'مخزون',
    },
    'j8x6msic': {
      'en': '350 KD',
      'ar': '',
    },
    'nwumb885': {
      'en': 'Remaining Balance',
      'ar': 'إجمالي المبيعات',
    },
    '9bvq6d92': {
      'en': '700 KD',
      'ar': '',
    },
    'txz28mfl': {
      'en': 'Available for Payout',
      'ar': 'حالة',
    },
    'q4ubh0se': {
      'en': '480 KD',
      'ar': '',
    },
    'jqhla767': {
      'en': 'More',
      'ar': '',
    },
    'lc8jkbwr': {
      'en': 'Home',
      'ar': '',
    },
  },
  // s3-Details
  {
    'mpl5bhqn': {
      'en': '#P-20471',
      'ar': 'منتجات',
    },
    'isyqkfj2': {
      'en': 'Export',
      'ar': 'تصدير',
    },
    '21rtnngn': {
      'en': 'Import',
      'ar': 'استيراد',
    },
    'srxwstqg': {
      'en': 'More Actions',
      'ar': 'المزيد من الاجراءات',
    },
    'buobm7k6': {
      'en': 'Search...',
      'ar': 'بحث',
    },
    'fbth7u0g': {
      'en': 'More Actions',
      'ar': 'المزيد من الاجراءات',
    },
    'r2i3tyv7': {
      'en': 'Create Payout',
      'ar': 'إضافة المنتج',
    },
    '8kjwphx8': {
      'en': 'Payout Cost',
      'ar': 'أعضاء الولاء الكامل',
    },
    '1c8qq8qe': {
      'en': '2,430.00 KD',
      'ar': 'أعضاء الولاء الكامل',
    },
    'r3pqpg0d': {
      'en': 'Paid',
      'ar': 'أعضاء الولاء الكامل',
    },
    '9127m543': {
      'en': '1,830.00 KD',
      'ar': 'أعضاء الولاء الكامل',
    },
    'e72djr3x': {
      'en': 'Due',
      'ar': 'أعضاء الولاء الكامل',
    },
    'u3eeag83': {
      'en': '600.00 KD',
      'ar': 'أعضاء الولاء الكامل',
    },
    'delsswsi': {
      'en': 'Payout Period',
      'ar': 'أعضاء الولاء الكامل',
    },
    'a7i4zo2b': {
      'en': '1 Feb 2026 - 15 Feb 2026',
      'ar': 'أعضاء الولاء الكامل',
    },
    '77sax55h': {
      'en': 'Download CSV',
      'ar': '',
    },
    '3kuubig4': {
      'en': 'Yet to pay',
      'ar': '',
    },
    '3y6bifls': {
      'en': 'Search...',
      'ar': '',
    },
    'v5xddg03': {
      'en': 'Option 1',
      'ar': '',
    },
    '7fwx5ktk': {
      'en': 'Option 2',
      'ar': '',
    },
    'ehcrw2ty': {
      'en': 'Option 3',
      'ar': '',
    },
    'h73n3pxm': {
      'en': 'Showing 15 result',
      'ar': '',
    },
    'imdque5g': {
      'en': 'Clear Filter',
      'ar': '',
    },
    '5a6qygtx': {
      'en': '9 Creators selected',
      'ar': '',
    },
    'dg1d5oil': {
      'en': 'Clear Selection',
      'ar': '',
    },
    'p7f62lk9': {
      'en': 'Total Payout Amount: 1,240 KD',
      'ar': '',
    },
    'of2u7jj3': {
      'en': 'Skip',
      'ar': '',
    },
    'mg1chkf4': {
      'en': 'Mark as Paid',
      'ar': '',
    },
    't1y1xmop': {
      'en': 'Name',
      'ar': 'بطاقة تعريف',
    },
    'l1gx9ldh': {
      'en': 'Paula Irving',
      'ar': '',
    },
    '1q7vmt3p': {
      'en': 'Remaining Balance',
      'ar': 'اسم',
    },
    'n63arr6p': {
      'en': '1,250 KD',
      'ar': '',
    },
    '3kk1uvsy': {
      'en': 'Available for Payout',
      'ar': 'سعر',
    },
    'ahd6uces': {
      'en': 'Feb 01, 2025',
      'ar': '',
    },
    'tkio78p5': {
      'en': 'Account Number (IBAN)',
      'ar': 'مخزون',
    },
    'qyz125ud': {
      'en': 'KW66 GULB 0000 0000 0000 1234 5601 01',
      'ar': '',
    },
    'v5b3vj9v': {
      'en': 'Payment Status',
      'ar': 'حالة',
    },
    'gw9gjjo3': {
      'en': 'Paid',
      'ar': '',
    },
    'jmd651th': {
      'en': 'More',
      'ar': '',
    },
    'z19iwktg': {
      'en': 'Home',
      'ar': '',
    },
  },
  // SalesHistory
  {
    'iwxm4991': {
      'en': 'Sales History',
      'ar': '',
    },
    'dyp4q871': {
      'en': 'Designer',
      'ar': 'قيد الانتظار',
    },
    '0sjswsnn': {
      'en': 'Creator',
      'ar': 'نشيط',
    },
    '3kenseki': {
      'en': 'Designer',
      'ar': 'قيد الانتظار',
    },
    'viyfmmjh': {
      'en': 'Auto-Approval',
      'ar': '',
    },
    'jmznyghy': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'ceuwd1x7': {
      'en': 'Order',
      'ar': '',
    },
    '3jhpgmlo': {
      'en': '#40011',
      'ar': '',
    },
    '2oq7jbo3': {
      'en': 'Date',
      'ar': '',
    },
    'vul4tsqf': {
      'en': '17 Mar 2026',
      'ar': '',
    },
    'o69fks3r': {
      'en': 'Product',
      'ar': '',
    },
    '6mrbb3l3': {
      'en': 'Designer Dress',
      'ar': '',
    },
    'mcjjra7q': {
      'en': 'Qty',
      'ar': '',
    },
    'quczntxu': {
      'en': '2',
      'ar': '',
    },
    'rto9am8g': {
      'en': 'Total',
      'ar': '',
    },
    '8o4kkb1f': {
      'en': '150 KD',
      'ar': '',
    },
    'qjxake6b': {
      'en': 'Designer ID',
      'ar': '',
    },
    '521ufbif': {
      'en': 'CRT-16628',
      'ar': '',
    },
    'ltjnfsuq': {
      'en': 'Designer Name',
      'ar': '',
    },
    'urssdva3': {
      'en': 'Sara Ali',
      'ar': '',
    },
    'fy83d3jh': {
      'en': 'Payout Status',
      'ar': '',
    },
    'm3ouie50': {
      'en': 'Not Eligible',
      'ar': '',
    },
    'waz9n6x6': {
      'en': 'Actions',
      'ar': 'اجراء',
    },
    '7cwb1nj4': {
      'en': 'Payout',
      'ar': '',
    },
    '0j2dhg25': {
      'en': 'No data with the applied filters',
      'ar': 'لاتوجد بيانات حسب الفلاتر الحالية',
    },
    'wgnholdt': {
      'en': 'Try changing the filters or search terms for this view.',
      'ar': 'حاول تغيير الفلاترأو مصطلحات البحث لهذا العرض ',
    },
    '2eo4s217': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // azyaa_header
  {
    'rlqzgdpi': {
      'en': 'English',
      'ar': '',
    },
    'rfmmg658': {
      'en': 'English',
      'ar': '',
    },
    'gz57wp7q': {
      'en': 'Search...',
      'ar': '',
    },
    '8o2ldhcx': {
      'en': 'English',
      'ar': '',
    },
    'zrdp6qdn': {
      'en': 'Arabic',
      'ar': '',
    },
    'gpcg2bxl': {
      'en': 'EN',
      'ar': 'EN',
    },
    '3jp4ixw4': {
      'en': 'AR',
      'ar': 'AR',
    },
  },
  // azyaa_responsive
  {
    'zaav9eon': {
      'en': 'Window is too small!',
      'ar': '',
    },
  },
  // azyaa_sidebar
  {
    '71ucbj4i': {
      'en': 'AZYAA',
      'ar': 'AZYAA',
    },
    '5fzuyn3c': {
      'en': 'AZYAA',
      'ar': 'AZYAA',
    },
    '5xm02pkb': {
      'en': 'Azyaa',
      'ar': '',
    },
    '07w4n8xu': {
      'en': 'Dashoard',
      'ar': '',
    },
    '7azpgh78': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
    'z8t5xzer': {
      'en': 'Customers',
      'ar': '',
    },
    'vsk271m0': {
      'en': 'Customers',
      'ar': 'الشركاء',
    },
    'wln5bp93': {
      'en': 'Customers',
      'ar': '',
    },
    '9krp9wfu': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '5vkz3cwl': {
      'en': 'Users',
      'ar': '',
    },
    'uhy63wnd': {
      'en': 'Users',
      'ar': 'المصممون',
    },
    'ii6hbrrh': {
      'en': 'Customers',
      'ar': '',
    },
    'qz64d2f7': {
      'en': 'Customers',
      'ar': 'المصممون',
    },
    'vldpmaw7': {
      'en': 'WaitList Customers',
      'ar': '',
    },
    'h5ocr2sz': {
      'en': 'WaitList Customers',
      'ar': 'المبدعون',
    },
    'dnjw69wj': {
      'en': 'Partners',
      'ar': '',
    },
    '5dcf6yfj': {
      'en': 'Partners',
      'ar': 'الشركاء',
    },
    'zupxs3qs': {
      'en': 'Partners',
      'ar': '',
    },
    '46qzweox': {
      'en': 'Partners',
      'ar': 'الشركاء',
    },
    'qc6xusdb': {
      'en': 'Designers',
      'ar': '',
    },
    '99v0w57x': {
      'en': 'Designers',
      'ar': 'المصممون',
    },
    'fmm8wk0t': {
      'en': 'Creators',
      'ar': '',
    },
    '82z2c4wh': {
      'en': 'Creators',
      'ar': 'المبدعون',
    },
    '9d8b2dtl': {
      'en': 'Products',
      'ar': '',
    },
    'i6mm140r': {
      'en': 'Products',
      'ar': 'منتجات',
    },
    't36ukswq': {
      'en': 'Products',
      'ar': '',
    },
    '6ukr33bv': {
      'en': 'Products',
      'ar': 'الشركاء',
    },
    '4dehz5hs': {
      'en': 'All Products',
      'ar': '',
    },
    'x79w651l': {
      'en': 'All Products',
      'ar': 'جميع المنتجات',
    },
    't391b3en': {
      'en': 'Categories',
      'ar': '',
    },
    'n9gtoxqb': {
      'en': 'Categories ',
      'ar': 'فئات',
    },
    '9smw0v4n': {
      'en': 'Tags',
      'ar': '',
    },
    'pkbu8evn': {
      'en': 'Tags',
      'ar': 'العلامات',
    },
    'q7axkqix': {
      'en': 'Attributes',
      'ar': '',
    },
    'jg9czhv9': {
      'en': 'Attributes',
      'ar': 'صفات',
    },
    'i9rk4u11': {
      'en': 'Inventory',
      'ar': '',
    },
    '1g2zmx49': {
      'en': 'Inventory',
      'ar': 'جرد',
    },
    'sd1od4gq': {
      'en': 'Inventory',
      'ar': '',
    },
    'q7q5e764': {
      'en': 'Inventory',
      'ar': 'جرد',
    },
    'fqitkqc2': {
      'en': 'Product Management',
      'ar': '',
    },
    'tk989nl2': {
      'en': 'Product Management',
      'ar': 'المصممون',
    },
    'yuir2dtf': {
      'en': 'Stock Management',
      'ar': '',
    },
    '78oy6wii': {
      'en': 'Stock Management',
      'ar': 'المبدعون',
    },
    'jriuf2hr': {
      'en': 'Orders',
      'ar': '',
    },
    '0zy1zt2b': {
      'en': 'Orders',
      'ar': 'طلبات',
    },
    'n71fngig': {
      'en': 'Sales History',
      'ar': '',
    },
    'ceod6kfa': {
      'en': 'SalesHistory',
      'ar': 'طلبات',
    },
    '2lqb44ku': {
      'en': 'Returns',
      'ar': '',
    },
    'g7o3ldq4': {
      'en': 'Returns',
      'ar': 'طلبات',
    },
    '21z6am9z': {
      'en': 'Media Management',
      'ar': '',
    },
    '4qdn1lwe': {
      'en': 'Media',
      'ar': 'وسائط',
    },
    'yupueezu': {
      'en': 'Finance',
      'ar': '',
    },
    'mwp23551': {
      'en': 'Finance',
      'ar': 'منتجات',
    },
    'nisc6d5a': {
      'en': 'Finance',
      'ar': '',
    },
    'sbj472be': {
      'en': 'Finance',
      'ar': 'الشركاء',
    },
    '4lel9egs': {
      'en': 'Payouts',
      'ar': '',
    },
    'b4mttvoq': {
      'en': 'Payouts',
      'ar': 'العلامات',
    },
    'ymm5rost': {
      'en': 'Notifications',
      'ar': '',
    },
    'fyez2e0o': {
      'en': 'Notification',
      'ar': 'إشعار',
    },
    'i99s0vin': {
      'en': 'User Role',
      'ar': '',
    },
    'lf2ux6xw': {
      'en': 'User Role',
      'ar': 'دور المستخدم',
    },
    '794a2awd': {
      'en': 'Discounts',
      'ar': '',
    },
    '37s8bcpr': {
      'en': 'Discounts',
      'ar': 'خصومات',
    },
    'e77roxx4': {
      'en': 'Try-On Credits',
      'ar': '',
    },
    'gz3bdci0': {
      'en': 'Try-On Credits',
      'ar': 'رصيد تجربة الملابس',
    },
    'kwm24tqc': {
      'en': 'Delivery Partner',
      'ar': 'شريك التوصيل',
    },
    'ztyfk4bh': {
      'en': 'Inventory',
      'ar': '',
    },
    '3s1ya1nw': {
      'en': 'Inventory',
      'ar': '',
    },
    'e9x1pgv7': {
      'en': 'Inventory',
      'ar': '',
    },
    'pchjzo9i': {
      'en': 'Inventory',
      'ar': 'الشركاء',
    },
    '926vxol6': {
      'en': 'Inventory',
      'ar': '',
    },
    'dxcsns83': {
      'en': 'Inventory Overview',
      'ar': 'المصممون',
    },
    'kkryrk10': {
      'en': 'Inventory Overview',
      'ar': '',
    },
    'tyun709b': {
      'en': 'Restock & Returns',
      'ar': 'المبدعون',
    },
    'yagrfu3r': {
      'en': 'Restock & Returns',
      'ar': 'إعادة التخزين والإرجاع',
    },
    'mrnw3md0': {
      'en': 'Finance',
      'ar': '',
    },
    'o0ae91yk': {
      'en': 'Finance',
      'ar': '',
    },
    'vbz0c729': {
      'en': 'Analytics',
      'ar': '',
    },
    '8nouusqi': {
      'en': 'Analytics',
      'ar': '',
    },
    'svvzwcf6': {
      'en': 'Support',
      'ar': '',
    },
    '5cbdua98': {
      'en': 'Customer & Support',
      'ar': '',
    },
    'd8a6s143': {
      'en': 'Collapse',
      'ar': '',
    },
    'k20xjk4e': {
      'en': 'Collapse',
      'ar': '',
    },
    'vwg6qu93': {
      'en': 'Expand',
      'ar': '',
    },
    'ifq063k8': {
      'en': 'Expand',
      'ar': '',
    },
    '3fzjknwv': {
      'en': 'Analytics',
      'ar': '',
    },
    'h33gxt1d': {
      'en': 'Analytics',
      'ar': '',
    },
    'mbcb36cp': {
      'en': 'Marketing',
      'ar': '',
    },
    '8x8eo6d8': {
      'en': 'Marketing',
      'ar': '',
    },
    'vuig1jcg': {
      'en': ' Product Settings',
      'ar': '',
    },
    'l3npvp4o': {
      'en': 'Product Settings',
      'ar': 'إعدادات',
    },
    'xu056lmg': {
      'en': 'Settings',
      'ar': '',
    },
    'bybui1vx': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    't7qgjh03': {
      'en': 'Logout',
      'ar': '',
    },
    'oy6lu66g': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
  },
  // OrderAction
  {
    'b9teqba8': {
      'en': 'View Invoice',
      'ar': '',
    },
    'a5oqt8iv': {
      'en': 'Refund',
      'ar': '',
    },
    '7qu8ldmq': {
      'en': 'Track Shipment',
      'ar': '',
    },
  },
  // Creator-Profile-Popup
  {
    'zo2ioqb0': {
      'en': 'View Profile',
      'ar': 'عرض الملف الشخصي',
    },
    '46vd7lv4': {
      'en': 'Ban',
      'ar': 'حظر',
    },
  },
  // ProductPreview
  {
    '3sc00c63': {
      'en': 'Product Preview',
      'ar': 'معاينة المنتج',
    },
    'yfutl60b': {
      'en':
          'Review and approve product details before they go live. Ensure product descriptions, pricing, stock availability.',
      'ar':
          'راجع تفاصيل المنتج واعتمدها قبل نشرها. تأكد من أن أوصاف المنتج، والأسعار، وتوافر المخزون، والوسائط تتوافق مع معايير السوق. سيظهر نص المساعدة \"امسح ضوئيًا للتسوق\" أعلى الرمز.\n',
    },
    'x0anz9zy': {
      'en': 'Title',
      'ar': 'العنوان\n',
    },
    'j57x7b8r': {
      'en': 'Description ',
      'ar': 'وصف',
    },
    'k3gak0y4': {
      'en': 'Product Status',
      'ar': 'حالة المنتج',
    },
    'qw8wvx59': {
      'en': 'Product type',
      'ar': 'نوع المنتج',
    },
    'noh5ati8': {
      'en': 'Designed by',
      'ar': 'صمم بواسطة',
    },
    '2g6mk8d7': {
      'en': 'Stock',
      'ar': 'المخزون\n',
    },
    's7op397s': {
      'en': 'Size',
      'ar': 'المقاس\n',
    },
    '42zxk7f8': {
      'en': 'Color',
      'ar': 'اللون\n',
    },
    'dn5uzmva': {
      'en': 'Commission',
      'ar': 'العمولة\n',
    },
    'vrflw9we': {
      'en': 'Tags',
      'ar': 'العلامات',
    },
    '4e7g2vf0': {
      'en': 'SKU',
      'ar': 'رمز المنتج',
    },
    'rnl3ra7q': {
      'en': 'Designer Price',
      'ar': 'سعر المصمم',
    },
    'zg5jpya3': {
      'en': 'Azyaa Commission ',
      'ar': 'لجنة أزيا',
    },
    'yeexe054': {
      'en': 'Total Price',
      'ar': 'السعر الإجمالي',
    },
    'ivjcmdb4': {
      'en': 'Delete',
      'ar': 'مسح\n',
    },
    '76bsk95t': {
      'en': 'Translation',
      'ar': 'يلغي',
    },
    'vc7qonfi': {
      'en': 'Approve',
      'ar': 'يوافق\n',
    },
    'kk5cw6r4': {
      'en': 'Edit',
      'ar': 'يعدل\n',
    },
  },
  // azyaa_forgot
  {
    '9opr7w7e': {
      'en': 'Reset Password',
      'ar': '',
    },
    'oy5pkexx': {
      'en':
          'Enter the email associated with your account and we will send you a verification code.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.\n',
    },
    'nj18xygj': {
      'en': 'Email',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.\n',
    },
    'xmh4zsdu': {
      'en': '',
      'ar': '',
    },
    'et6vx6oh': {
      'en': 'Email',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.\n',
    },
    'uyw8kip1': {
      'en': 'Send Password Reset Link',
      'ar': '',
    },
  },
  // pendingproducts
  {
    'quca7igo': {
      'en': 'Designer Dress ',
      'ar': '',
    },
    '11rde9tj': {
      'en': '250 KD',
      'ar': '',
    },
    'o5c7nqil': {
      'en':
          'A best-selling outfit made from sustainable fabric with a modern design touch.',
      'ar':
          'الملابس الأكثر مبيعاً مصنوعة من قماش مستدام مع لمسة تصميم عصرية.\n',
    },
  },
  // Add-Creator
  {
    'asraku32': {
      'en': 'Add Creator',
      'ar': '',
    },
    'emcdbfaw': {
      'en': 'Full Name',
      'ar': '',
    },
    'al205sam': {
      'en': 'e.g Noor Khalid',
      'ar': '',
    },
    'f5rcgv7q': {
      'en': 'Email',
      'ar': 'البريد إلكتروني\n',
    },
    'xd7flc76': {
      'en': 'johndoe@gmail.com',
      'ar': '',
    },
    'lpof1d08': {
      'en': 'Mobile Number',
      'ar': '',
    },
    'e6lcnqnj': {
      'en': 'e.g Noor Khalid',
      'ar': '',
    },
    '5twqa3xg': {
      'en': 'Location/City',
      'ar': '',
    },
    '9wdpt9l1': {
      'en': 'e.g Kuwait City',
      'ar': '',
    },
    'ujkvxesi': {
      'en': 'Preferred Model',
      'ar': '',
    },
    'kkcilycq': {
      'en': 'Select Category',
      'ar': '',
    },
    'kd1xlc2a': {
      'en': 'Search...',
      'ar': '',
    },
    '1huz4942': {
      'en': 'Option 1',
      'ar': '',
    },
    '1zlg3wp9': {
      'en': 'Option 2',
      'ar': 'active',
    },
    '2t0xr583': {
      'en': 'Option 3',
      'ar': '',
    },
    'euqqj0w6': {
      'en': 'Years of Experience in Designing',
      'ar': '',
    },
    '9fqr395t': {
      'en': 'e.g 5 Years',
      'ar': '',
    },
    'uq4oz19r': {
      'en': 'Instagram Profile',
      'ar': '',
    },
    '7ji4ye7i': {
      'en': 'Paste link here',
      'ar': '',
    },
    '5o3j9n5m': {
      'en': 'TikTok Handle',
      'ar': 'البريد إلكتروني\n',
    },
    '9hgbelh1': {
      'en': 'Paste link here',
      'ar': '',
    },
    '2bkjg7u4': {
      'en': 'YouTube Channel',
      'ar': '',
    },
    'kdmp4amm': {
      'en': 'Paste link here',
      'ar': '',
    },
    '0dl9p3v2': {
      'en': 'Other Social Links',
      'ar': 'روابط  وسائل تواصل أخرى\n',
    },
    '6riljd0q': {
      'en': 'Paste link here',
      'ar': '',
    },
    '1o9ge20d': {
      'en': 'Cancel',
      'ar': 'الغاء\n',
    },
    '2v3oz3t4': {
      'en': 'Next',
      'ar': '',
    },
    '3pawtrz8': {
      'en': 'Available for Campaigns',
      'ar': '',
    },
    'cnq2xp70': {
      'en': 'Yes',
      'ar': '',
    },
    'av995nl9': {
      'en': 'Yes',
      'ar': '',
    },
    'oxtcrau1': {
      'en': 'Search...',
      'ar': '',
    },
    'qr33jez2': {
      'en': 'Yes',
      'ar': '',
    },
    '8o3k0ymj': {
      'en': 'No',
      'ar': '',
    },
    '32h9sn2z': {
      'en': 'Open to Brand Collaborations',
      'ar': '',
    },
    'dmbi5zru': {
      'en': 'Select...',
      'ar': '',
    },
    'h3uhp2ma': {
      'en': 'Search...',
      'ar': '',
    },
    '1ww80sd6': {
      'en': 'Option 1',
      'ar': '',
    },
    'm8c8m8mm': {
      'en': 'Option 2',
      'ar': '',
    },
    'alkrud11': {
      'en': 'Option 3',
      'ar': '',
    },
    'dizd3xrx': {
      'en': 'Areas of Interest',
      'ar': '',
    },
    'mhbebw11': {
      'en': 'Bridal, Partywear, Modestwear',
      'ar': '',
    },
    'nw80x7hg': {
      'en': 'Personal Bio / Intro',
      'ar': '',
    },
    'g1tnwuy6': {
      'en': 'Brief Bio',
      'ar': '',
    },
    '5q4uebfy': {
      'en': 'Sample Work or Campaigns',
      'ar': '',
    },
    'fabuwnad': {
      'en': '+ Upload Photo / PDF',
      'ar': '',
    },
    '3e4rz4ye': {
      'en': 'You can upload upto 5 PDF or image file max size 5 MB each.',
      'ar':
          'يمكنك تحميل ما يصل إلى 5 ملفات PDF أو صور بحد أقصى 5 ميجا بايت لكل ملف.\n',
    },
    'gp0nra7w': {
      'en': 'Nora Designs.pdf',
      'ar': '',
    },
    'xa243byx': {
      'en': '4.2 MB PDF',
      'ar': '',
    },
    'dbrhm0tf': {
      'en': 'Identity Verification',
      'ar': '',
    },
    'uy692k2i': {
      'en': '+ Upload Photo / PDF',
      'ar': '',
    },
    '1gibv5es': {
      'en': 'You can upload upto 5 PDF or image file max size 5 MB each.',
      'ar': '',
    },
    'xoof2v0h': {
      'en': 'Nora Designs.pdf',
      'ar': '',
    },
    '74erovd3': {
      'en': '4.2 MB PDF',
      'ar': '',
    },
    '8pyaz8b3': {
      'en': 'Cancel',
      'ar': '',
    },
    'gh0i9dbb': {
      'en': 'Add Creator',
      'ar': '',
    },
  },
  // test1
  {
    'd2walxt0': {
      'en': '+2',
      'ar': '',
    },
    'zydwdawl': {
      'en': 'ID: ',
      'ar': '',
    },
    'ewp4piub': {
      'en': 'AC3455',
      'ar': '',
    },
    'tf5dmbzn': {
      'en': 'https://instagram.com/loislane',
      'ar': '',
    },
    'l677dvja': {
      'en': 'Urban Style Dress',
      'ar': '',
    },
    'qz77w3ic': {
      'en': '150',
      'ar': '',
    },
    'bx8dp6j3': {
      'en': ' KD',
      'ar': '',
    },
    'ukgvccgh': {
      'en': 'Hello World',
      'ar': '',
    },
    'ercru1nv': {
      'en': '4.8',
      'ar': '',
    },
    'e64ro0zb': {
      'en': '(87)',
      'ar': '',
    },
    'r515j9hq': {
      'en': '1,360',
      'ar': '',
    },
    'dmj8m2l7': {
      'en': ' Sales',
      'ar': '',
    },
    'sdri0leq': {
      'en': '37.8',
      'ar': '',
    },
    'i1th4d2m': {
      'en': '%',
      'ar': '',
    },
  },
  // ProductsGrid
  {
    '0onbetkc': {
      'en': 'ID: ',
      'ar': '',
    },
    'rx3svnul': {
      'en': 'https://instagram.com/loislane',
      'ar': '',
    },
    'ry5grwq2': {
      'en': ' KD',
      'ar': '',
    },
    '1kutqthk': {
      'en': 'Hello World',
      'ar': '',
    },
    '0wf1a8ll': {
      'en': '(',
      'ar': '',
    },
    't4d4yj40': {
      'en': ')',
      'ar': '',
    },
    'di5zsuix': {
      'en': ' Sales',
      'ar': 'مبيعات',
    },
    'i9jobbe4': {
      'en': '37.8',
      'ar': '',
    },
    'vbmeq8qd': {
      'en': '%',
      'ar': '',
    },
  },
  // Stockinput
  {
    'pe8oc8il': {
      'en': '',
      'ar': '',
    },
    't1o183ym': {
      'en': 'Input here',
      'ar': '',
    },
  },
  // Edit-Weight
  {
    'lv9b1l68': {
      'en': 'Edit weight',
      'ar': 'تعديل الوزن',
    },
    'k1qtfs0o': {
      'en': 'Apply the same weight to all items',
      'ar': 'تطبيق نفس الوزن على جميع العناصر',
    },
    'ytct8tye': {
      'en': 'TextField',
      'ar': 'حقل النص',
    },
    'sgstmwtm': {
      'en': 'kg',
      'ar': 'كجم',
    },
    'bpu8an8m': {
      'en': '40.00 KWD',
      'ar': '',
    },
    '3s4arfpc': {
      'en': 'Apply to all',
      'ar': 'تنطبق على الكل\n',
    },
    '60y7skfy': {
      'en': 'Urban Style Dress ',
      'ar': 'فستان على الطراز الحضري',
    },
    '9z4gwx38': {
      'en': 'White',
      'ar': 'أبيض',
    },
    'olpf5piq': {
      'en': ' / ',
      'ar': '',
    },
    '8p6f5d3u': {
      'en': 'XS ',
      'ar': 'XS',
    },
    'cyvpt6r0': {
      'en': 'Urban Style Dress ',
      'ar': '',
    },
    'ggrucski': {
      'en': '0',
      'ar': '',
    },
    '75xotxru': {
      'en': 'lb',
      'ar': 'رطل',
    },
    '8lw7inj1': {
      'en': '40.00 KWD',
      'ar': '',
    },
    'hhl4e11n': {
      'en': 'Save weight to product details',
      'ar': 'حفظ الوزن  في تفاصيل المنتج\n',
    },
    'yt9g68e8': {
      'en': 'Shipping date',
      'ar': '',
    },
    'qe456pa1': {
      'en': 'Cancel',
      'ar': 'الغاء\n',
    },
    '1018vxj1': {
      'en': 'Done',
      'ar': 'تم  \n',
    },
  },
  // Media_Video
  {
    'xc52ayvv': {
      'en': 'Video Title',
      'ar': 'عنوان الفيديو',
    },
    'sm69yyei': {
      'en': '28-03-2025',
      'ar': '',
    },
    'efu0ym97': {
      'en': 'Format ',
      'ar': 'الشكل \n',
    },
    'dfqew0bk': {
      'en': 'mp4 ',
      'ar': 'mp4',
    },
    '3moncra5': {
      'en': 'Size',
      'ar': 'مقاس',
    },
    '6dlmyfyy': {
      'en': 'Duration',
      'ar': 'مدة',
    },
  },
  // partner-menu-popup
  {
    '7nt3c14m': {
      'en': 'Designers',
      'ar': 'المصممون',
    },
    'vpg7vdp7': {
      'en': 'Creators',
      'ar': 'المبدعون',
    },
  },
  // Logout
  {
    '9cy32b0d': {
      'en': 'Log out',
      'ar': 'تسجيل الخروج',
    },
    'p6cpnutu': {
      'en': 'Are you sure you want to leave?',
      'ar': 'هل أنت متأكد أنك تريد المغادرة؟',
    },
    '95tc7h4q': {
      'en': 'YES',
      'ar': 'نعم',
    },
    'lkq67h4u': {
      'en': 'CANCEL',
      'ar': 'الغاء\n',
    },
  },
  // AddDamaged
  {
    'zkds4q6k': {
      'en': 'Add Damaged',
      'ar': '',
    },
    'kz916prk': {
      'en': 'Quantity',
      'ar': '',
    },
    'no1xywwr': {
      'en': '',
      'ar': '',
    },
    'fhdc71ui': {
      'en': 'Input here',
      'ar': '',
    },
  },
  // UnavailableInventory
  {
    'plxmtv9d': {
      'en': 'Unavailable inventory',
      'ar': '',
    },
    '4v5ofrnr': {
      'en': 'Damaged',
      'ar': 'متضرر',
    },
    'dkzd98mq': {
      'en': '',
      'ar': '',
    },
    'gb1r7u4h': {
      'en': '0',
      'ar': '',
    },
    'rm0cnlkg': {
      'en': '0',
      'ar': '',
    },
    'ptfdvec6': {
      'en': 'Search...',
      'ar': '',
    },
    '7mpfkplh': {
      'en': '0',
      'ar': '',
    },
    'g25quqh7': {
      'en': 'Option 2',
      'ar': '',
    },
    'uojmjyrw': {
      'en': 'Option 3',
      'ar': '',
    },
    'r58a9vbp': {
      'en': 'Quantity control',
      'ar': '',
    },
    'uhny4oif': {
      'en': '0',
      'ar': '',
    },
    'f7jcri7e': {
      'en': 'Search...',
      'ar': '',
    },
    'nbm9s95m': {
      'en': '0',
      'ar': '',
    },
    'cgsp37u9': {
      'en': 'Option 2',
      'ar': '',
    },
    '2j89e4v4': {
      'en': 'Option 3',
      'ar': '',
    },
    'dd3gnn0w': {
      'en': 'Safety stock',
      'ar': '',
    },
    'w89b0hsi': {
      'en': '0',
      'ar': '',
    },
    'rw5wppnd': {
      'en': 'Search...',
      'ar': '',
    },
    'ziw67i3f': {
      'en': '0',
      'ar': '',
    },
    'b6ar8dtr': {
      'en': 'Option 2',
      'ar': '',
    },
    'muxp92be': {
      'en': 'Option 3',
      'ar': '',
    },
    'b4x9pa78': {
      'en': 'Others',
      'ar': '',
    },
    '8tdoiu24': {
      'en': '0',
      'ar': '',
    },
    'wifu0db0': {
      'en': 'Search...',
      'ar': '',
    },
    '2yqd0myb': {
      'en': '0',
      'ar': '',
    },
    'omjgoe6k': {
      'en': 'Option 2',
      'ar': '',
    },
    'rp9pobyv': {
      'en': 'Option 3',
      'ar': '',
    },
  },
  // AddInventory
  {
    'dpjq6okt': {
      'en': 'Add Inventory',
      'ar': '',
    },
    '1zisdlp0': {
      'en': 'Move to Available',
      'ar': '',
    },
    'v86w5nns': {
      'en': 'Delete Inventory',
      'ar': '',
    },
  },
  // AdjustAvailable
  {
    'teqzfyw4': {
      'en': 'Adjust Available',
      'ar': 'تعديل المتاح\n',
    },
    '56a1xc8s': {
      'en': 'Search...',
      'ar': 'بحث\n',
    },
    'r8orofz2': {
      'en': 'Adjust Available',
      'ar': 'تعديل المتاح\n',
    },
    '7qmoechk': {
      'en': 'Option 2',
      'ar': '',
    },
    'ut7o0w7j': {
      'en': 'Option 3',
      'ar': '',
    },
    'ijctf9cm': {
      'en': 'Adjust by',
      'ar': '',
    },
    'lleiy3v9': {
      'en': '',
      'ar': '',
    },
    '5gtkhjjf': {
      'en': 'Reason',
      'ar': 'السبب\n',
    },
    'gdcy70ql': {
      'en': 'Correction (default)',
      'ar': '',
    },
    'fga5crw0': {
      'en': 'Search...',
      'ar': 'بحث\n',
    },
    'gq35v0v2': {
      'en': 'Correction (default)',
      'ar': '',
    },
    'hy1sx0l4': {
      'en': 'Option 2',
      'ar': '',
    },
    '4vdh0i4a': {
      'en': 'Option 3',
      'ar': '',
    },
  },
  // SupportTicketDetailed
  {
    'moic2b6g': {
      'en': 'Support Ticket Detailed',
      'ar': '',
    },
    '70n08p6k': {
      'en': 'Ticket ID',
      'ar': '',
    },
    'lmpwbncz': {
      'en': '#O-4501',
      'ar': '',
    },
    '939f588e': {
      'en': 'Customer Name',
      'ar': '',
    },
    'guhbq8y2': {
      'en': 'Rajanikanth',
      'ar': '',
    },
    'uxqpabgq': {
      'en': 'Issue Type',
      'ar': '',
    },
    'qx58cxta': {
      'en': 'Order not delivered',
      'ar': '',
    },
    'qa1nm4pm': {
      'en': 'Order ID',
      'ar': '',
    },
    'amb3jipk': {
      'en': '#O-45023',
      'ar': '',
    },
    'lyexok9g': {
      'en': 'Date Created',
      'ar': '',
    },
    'a2mng39y': {
      'en': 'March 10, 2025',
      'ar': '',
    },
    'b67voc0j': {
      'en': 'Status',
      'ar': 'الحالة\n',
    },
    '6hmw9be2': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    '4v5bn9sa': {
      'en': 'Search...',
      'ar': '',
    },
    '4qixevv6': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
    },
    'rodt285z': {
      'en': 'Option 2',
      'ar': '',
    },
    'iqcws26x': {
      'en': 'Option 3',
      'ar': '',
    },
    '7iz48jxh': {
      'en': 'Assigned To',
      'ar': '',
    },
    'jz1z26kf': {
      'en': 'John',
      'ar': '',
    },
    '5u3v4ada': {
      'en': 'Search...',
      'ar': '',
    },
    '8p0k984p': {
      'en': 'John',
      'ar': '',
    },
    '8er6j5iu': {
      'en': 'Option 2',
      'ar': '',
    },
    'z4vaqo30': {
      'en': 'Option 3',
      'ar': '',
    },
    'l9fbyrew': {
      'en': 'Customer Action',
      'ar': '',
    },
    '3lusjwyg': {
      'en': 'Request more information',
      'ar': '',
    },
    '9eg8md8l': {
      'en': 'Search...',
      'ar': '',
    },
    'ulr12wre': {
      'en': 'Request more information',
      'ar': '',
    },
    'anlj6gwl': {
      'en': 'Option 2',
      'ar': '',
    },
    'lv0s4igf': {
      'en': 'Option 3',
      'ar': '',
    },
    'eyqa5g3r': {
      'en': 'Send Customer Update',
      'ar': '',
    },
    '8e9c2xq9': {
      'en': 'Cancel',
      'ar': '',
    },
    's5knm0jk': {
      'en': 'Resolve and Close Ticket',
      'ar': '',
    },
    'ro073n1o': {
      'en': 'Search...',
      'ar': '',
    },
    'eij73wu9': {
      'en': 'Resolve and Close Ticket',
      'ar': '',
    },
    'bspvttos': {
      'en': 'Option 2',
      'ar': '',
    },
    'qvpamken': {
      'en': 'Option 3',
      'ar': '',
    },
  },
  // LiveChat
  {
    '2y4wcsr3': {
      'en': 'Live Chat',
      'ar': '',
    },
    '6dy6d3e1': {
      'en': 'Customer Name',
      'ar': '',
    },
    'pyrvdzlo': {
      'en': 'Arfa',
      'ar': '',
    },
    '9w442hy4': {
      'en': 'Query',
      'ar': '',
    },
    '44yt2vbj': {
      'en': 'Product enquiry',
      'ar': '',
    },
    '1p1mxx6j': {
      'en': 'Time',
      'ar': '',
    },
    '7xgnsnty': {
      'en': 'Just now',
      'ar': '',
    },
    'p264frdw': {
      'en': 'Cancel',
      'ar': 'الغاء\n',
    },
    'o1smkqwh': {
      'en': 'Done',
      'ar': 'تم\n',
    },
  },
  // RefundRequestProcessing
  {
    'l8wzlihw': {
      'en': 'Refund Request Processing',
      'ar': 'جاري معالجة طلب استرداد الأموال\n',
    },
    'dlo2ci0x': {
      'en': 'Refund Case ID',
      'ar': '',
    },
    'vx6gvzab': {
      'en': '#O-4501',
      'ar': '',
    },
    'p6y0igm5': {
      'en': 'Customer Name',
      'ar': '',
    },
    '1zqhqj8i': {
      'en': 'Rajanikanth',
      'ar': '',
    },
    'uebfv1a5': {
      'en': 'Order ID',
      'ar': '',
    },
    'x3v107tr': {
      'en': '#O-45023',
      'ar': '',
    },
    'j1u3psd4': {
      'en': 'Refund Amount Requested',
      'ar': '',
    },
    '3qeaot7z': {
      'en': 'Order not delivered',
      'ar': '',
    },
    '9nxml0p6': {
      'en': 'Reason for Refund',
      'ar': '',
    },
    'g3uhzmfu': {
      'en': 'Damaged product',
      'ar': '',
    },
    '3wcbm2jc': {
      'en': 'Proof Submitted',
      'ar': '',
    },
    'lu46xtga': {
      'en': 'View attached images',
      'ar': '',
    },
    'lwqc8rxe': {
      'en': 'Status',
      'ar': 'الحالة\n',
    },
    '645zm37i': {
      'en': 'Pending',
      'ar': '',
    },
    'tevjcjdy': {
      'en': 'Search...',
      'ar': '',
    },
    '0jxf3ghp': {
      'en': 'Pending',
      'ar': '',
    },
    'qluq82q8': {
      'en': 'Option 2',
      'ar': '',
    },
    'mmc59jzv': {
      'en': 'Option 3',
      'ar': '',
    },
    'buhbqflp': {
      'en': 'Cancel',
      'ar': 'الغاء\n',
    },
    '945b4pk2': {
      'en': 'Process Refund & Close Case',
      'ar': '',
    },
    'gq5adbqd': {
      'en': 'Search...',
      'ar': '',
    },
    'mp1fvkio': {
      'en': 'Process Refund & Close Case',
      'ar': '',
    },
    '1vg48gqm': {
      'en': 'Option 2',
      'ar': '',
    },
    'q3bidm36': {
      'en': 'Option 3',
      'ar': '',
    },
  },
  // DiscountType
  {
    'ygyfc7r0': {
      'en': 'Select discount type',
      'ar': '',
    },
    'aqkp1g2r': {
      'en': 'Amount Off products',
      'ar': '',
    },
    'c7ca24k9': {
      'en': 'Discount specific products or collections of products.',
      'ar': '',
    },
    'j5rupnwo': {
      'en': 'Product discount',
      'ar': '',
    },
    '5t81ciwn': {
      'en': 'Buy X get Y',
      'ar': '',
    },
    'cqvpg1zs': {
      'en': 'Discount products based on a customer’s purchase.',
      'ar': '',
    },
    '9ueuzrqn': {
      'en': 'Product discount',
      'ar': '',
    },
    'w7m3l8dj': {
      'en': 'Amount off order',
      'ar': '',
    },
    '40bustht': {
      'en': 'Discount the total order amount.',
      'ar': '',
    },
    'j72eeaw2': {
      'en': 'Order discount',
      'ar': '',
    },
    'zs3s6mu9': {
      'en': 'Free shipping',
      'ar': '',
    },
    '60k42lbt': {
      'en': 'Offer free shipping on an order.',
      'ar': '',
    },
    '9zhw2c4i': {
      'en': 'Shipping discount',
      'ar': '',
    },
    'yt3fzhre': {
      'en': 'Cancel',
      'ar': 'الغاء\n',
    },
  },
  // Reject-Reason
  {
    'volwnmml': {
      'en': 'Reject Submission',
      'ar': 'رفض الإرسال',
    },
    '0r2zu3vj': {
      'en': 'Please specify the reason for rejecting this designer.',
      'ar': 'يرجى تحديد سبب رفض هذا المصمم.',
    },
    'qhlvhlik': {
      'en': 'Reason for Rejection',
      'ar': 'سبب الرفض',
    },
    '2aj68jn2': {
      'en': 'Select..',
      'ar': 'يختار..',
    },
    'x51tavc6': {
      'en': 'Search...',
      'ar': '',
    },
    'p4koowmv': {
      'en': 'Reason for Rejection',
      'ar': 'سبب الرفض',
    },
    '28gf915q': {
      'en': 'Provide more details if necessary...',
      'ar': 'تقديم المزيد من التفاصيل إذا لزم الأمر...',
    },
    'hvrgwx0b': {
      'en': 'Cancel',
      'ar': 'الغاء\n',
    },
    'xa8sw8wp': {
      'en': 'Done',
      'ar': 'تم\n',
    },
  },
  // Edit-Reject-Reason
  {
    'rmjqh3w1': {
      'en': 'Edit Reject Submission',
      'ar': 'تعديل رفض الإرسال',
    },
    'msixbrx2': {
      'en': 'Please specify the reason for rejecting.',
      'ar': 'يرجى تحديد سبب الرفض.',
    },
    '0y4qx5cx': {
      'en': 'Reason for Rejection',
      'ar': 'سبب الرفض',
    },
    '4h46uvck': {
      'en': 'Select..',
      'ar': 'يختار..',
    },
    '9zh4wfz3': {
      'en': 'Search...',
      'ar': '',
    },
    'gsfsrvpd': {
      'en': 'Reason for Rejection',
      'ar': 'سبب الرفض',
    },
    'kc94tg36': {
      'en': 'Provide more details if necessary...',
      'ar': 'تقديم المزيد من التفاصيل إذا لزم الأمر...',
    },
    'zb26a3fl': {
      'en': 'Cancel',
      'ar': 'الغاء\n',
    },
    'fd3xgcvo': {
      'en': 'Save',
      'ar': 'حفظ\n',
    },
  },
  // Image_Upload
  {
    'rpwqtorn': {
      'en': 'Upload New Image',
      'ar': 'تحميل صورة جديدة',
    },
  },
  // Media_Picture
  {
    'd9axd46q': {
      'en': 'PCOS | Day 16 - Lowerbody',
      'ar': '',
    },
    '1hba53vq': {
      'en': 'Alt text',
      'ar': '',
    },
    'ulxm287i': {
      'en': 'jpeg',
      'ar': '',
    },
  },
  // PromotionAutoApproved
  {
    '63wpteg7': {
      'en': 'PR-1045',
      'ar': '',
    },
    'evsui3k4': {
      'en': ' • ',
      'ar': '',
    },
    'g1q3gqwn': {
      'en': 'Approved',
      'ar': '',
    },
    'yfopd7a3': {
      'en': ' • ',
      'ar': '',
    },
    'pnusjva4': {
      'en': 'Auto Approved',
      'ar': '',
    },
    'qrqi2r1r': {
      'en': 'Product Preview',
      'ar': '',
    },
    'yj962jrz': {
      'en': 'Product Details',
      'ar': '',
    },
    'iaw64xqj': {
      'en': 'Product Name',
      'ar': '',
    },
    'urjk93sx': {
      'en': 'Category',
      'ar': '',
    },
    '99ut3i4h': {
      'en': 'Designer',
      'ar': '',
    },
    '6vpzkahj': {
      'en': 'Price',
      'ar': '',
    },
    'i08uefu4': {
      'en': 'Commission',
      'ar': '',
    },
    'h5ymwi2q': {
      'en': 'Creator Details',
      'ar': '',
    },
    'h8u8ztxk': {
      'en': 'Product Name',
      'ar': '',
    },
    'oish5gbl': {
      'en': 'Designed by',
      'ar': '',
    },
    '4sjmy6bz': {
      'en': 'SKU',
      'ar': '',
    },
    'a6chjbrm': {
      'en': 'Designer Price',
      'ar': '',
    },
    'ep1nr6hg': {
      'en': 'Azyaa Commission ',
      'ar': '',
    },
    'tih25ggs': {
      'en': 'Total Price',
      'ar': '',
    },
    '7xi0s60y': {
      'en': 'Reject',
      'ar': '',
    },
    'olouq5lu': {
      'en': 'Approve',
      'ar': '',
    },
    '9ih15qos': {
      'en': 'Cancel',
      'ar': '',
    },
    '0x0l5r9o': {
      'en': 'Edit',
      'ar': '',
    },
  },
  // Reason
  {
    'h03dx6ll': {
      'en': '#0-4501',
      'ar': '',
    },
    'al7bzmbq': {
      'en': 'Reason',
      'ar': 'السبب\n',
    },
    'ej969yfc': {
      'en':
          'Product received is damaged The dress I received has a tear near the sleeve, and the stitching is loose. I would like a refund or a replacement.',
      'ar':
          'المنتج المستلم تالف. الفستان الذي استلمته به تمزق قرب الأكمام، والخياطة فضفاضة. أرغب في استرداد المبلغ أو استبداله.\n',
    },
    'n92chtdb': {
      'en': 'Customer Proof',
      'ar': '',
    },
    'b966z4l1': {
      'en':
          'Are you sure you want to proceed? This will process the refund, update inventory, and cannot be undone.',
      'ar':
          'هل أنت متأكد من رغبتك في المتابعة؟ سيؤدي هذا إلى معالجة عملية استرداد المبلغ وتحديث المخزون، ولا يمكن التراجع عنه.\n',
    },
    '57ficl65': {
      'en': 'Cancel',
      'ar': 'الغاء\n',
    },
    '9cud3yln': {
      'en': 'Process Payment',
      'ar': '',
    },
  },
  // FinanceDetails
  {
    'rsfgq4c0': {
      'en': 'View Details',
      'ar': '',
    },
    '6konu43w': {
      'en': 'Transaction ID',
      'ar': '',
    },
    '84bq6y5i': {
      'en': 'Custom Dress',
      'ar': 'فستان مفصل حسب الطلب\n',
    },
    '53xvv86a': {
      'en': 'Date',
      'ar': 'التاريخ\n',
    },
    'sutm19gh': {
      'en': 'Custom Dress',
      'ar': 'فستان مفصل حسب الطلب\n',
    },
    'zfg6kukx': {
      'en': 'Creator / Designer',
      'ar': '',
    },
    '6yreyx98': {
      'en': 'Custom Dress',
      'ar': 'فستان مفصل حسب الطلب\n',
    },
    'bwsqp53m': {
      'en': 'Fee Type',
      'ar': '',
    },
    'z3tdp0r0': {
      'en': 'Custom Dress',
      'ar': 'فستان مفصل حسب الطلب\n',
    },
    '3qmnoaqx': {
      'en': 'Original Earnings',
      'ar': '',
    },
    'alhqms39': {
      'en': 'Custom Dress',
      'ar': 'فستان مفصل حسب الطلب\n',
    },
    'hapttj13': {
      'en': 'Platform Deduction',
      'ar': '',
    },
    'lo6ans6d': {
      'en': 'Custom Dress',
      'ar': 'فستان مفصل حسب الطلب\n',
    },
    '11z780q0': {
      'en': 'Final Earnings After Deduction',
      'ar': '',
    },
    'uperxuq0': {
      'en': 'Custom Dress',
      'ar': 'فستان مفصل حسب الطلب\n',
    },
    'z9tbwoyq': {
      'en': 'Admin Notes',
      'ar': '',
    },
    '0h34bk3c': {
      'en': 'Custom Dress',
      'ar': 'فستان مفصل حسب الطلب\n',
    },
  },
  // inhand-input
  {
    'anqnfyt3': {
      'en': '',
      'ar': '',
    },
    'nygkwxj6': {
      'en': 'Input here',
      'ar': '',
    },
  },
  // Image_list
  {
    'pe5rkl9w': {
      'en': 'Select Image here',
      'ar': 'حدد الصورة هنا',
    },
    'g8mndiym': {
      'en': 'Cancel',
      'ar': '',
    },
    'a2qhxhy4': {
      'en': 'Done',
      'ar': 'منتهي',
    },
  },
  // customersPopup
  {
    'd0r621jn': {
      'en': 'Customers',
      'ar': 'العملاء',
    },
    'vi05tt3w': {
      'en': 'Designers',
      'ar': '',
    },
    'mp1heh9t': {
      'en': 'Waitlist',
      'ar': 'قائمة الانتظار',
    },
    'jpcgx9gq': {
      'en': 'Creators',
      'ar': '',
    },
  },
  // ProductQuickEdit
  {
    'rzi56gyk': {
      'en': 'Quick Edit',
      'ar': 'تحريرتعديل سريع',
    },
    '4te8u2t4': {
      'en':
          'Quickly update key product details without leaving the page. Modify product titles, pricing, stock status to ensure accurate and up-to-date listings.',
      'ar':
          'حدّث تفاصيل المنتج الرئيسية بسرعة دون مغادرة الصفحة. عدّل عناوين المنتجات وأسعارها وحالة المخزون لضمان دقة قوائم المنتجات وتحديثها باستمرار.',
    },
    '38ynqdvu': {
      'en': 'Title',
      'ar': 'العنوان',
    },
    'h3ewsntn': {
      'en': '',
      'ar': '',
    },
    'x2a2ble4': {
      'en': 'Enter product name',
      'ar': 'أدخل النص الخاص بك',
    },
    'zuzkp2uf': {
      'en': 'SKU ',
      'ar': 'رمز المنتج',
    },
    '3l5nmhuh': {
      'en': '',
      'ar': '',
    },
    'wsh6pod3': {
      'en': 'SKU',
      'ar': 'أدخل النص الخاص بك',
    },
    'c7kv2leo': {
      'en': 'Price',
      'ar': 'السعر',
    },
    'vyduftq1': {
      'en': '',
      'ar': '',
    },
    'xo62zkcc': {
      'en': 'Enter price ',
      'ar': 'أدخل النص الخاص بك',
    },
    'ldfl0ukk': {
      'en': 'Compare at Price (Optional)',
      'ar': 'مقارنة السعر (اختياري)',
    },
    'b9tl0pp3': {
      'en': '',
      'ar': '',
    },
    'd9fhbwkr': {
      'en': 'Enter regular price ',
      'ar': 'أدخل النص الخاص بك',
    },
    'r14giwuu': {
      'en': 'Stock',
      'ar': 'المخزون',
    },
    'ukv57gxd': {
      'en': '',
      'ar': '',
    },
    'lvqd9ln7': {
      'en': 'Enter stock',
      'ar': 'أدخل النص الخاص بك',
    },
    'mzfp6773': {
      'en': 'product name is required',
      'ar': '',
    },
    '1je9bhev': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'hp9p3ly7': {
      'en': 'product sku is required',
      'ar': '',
    },
    'do2qll3d': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '06ohscj1': {
      'en': 'product price is required',
      'ar': '',
    },
    'l3dyscjv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '16n6jjuv': {
      'en': 'product_regular_price is required',
      'ar': '',
    },
    'ztn5gdvt': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '63w78al9': {
      'en': 'product quantity is required',
      'ar': '',
    },
    'np0zv5k2': {
      'en': 'Invalid input',
      'ar': 'إدخال غير صالح',
    },
    '8w0szibj': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xae4xbpv': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    '3tbc3x88': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // Add-CTAT
  {
    'bwu476l2': {
      'en': 'Serial Number',
      'ar': 'الرقم السري',
    },
    'ntop8lsg': {
      'en': 'Enter Serial Number',
      'ar': '',
    },
    'r0v0l2xy': {
      'en': 'Name',
      'ar': ' الاسم',
    },
    '390m0ltv': {
      'en': 'Enter Name',
      'ar': '',
    },
    'd4fq9ob5': {
      'en': 'Description',
      'ar': 'الوصف',
    },
    'n7jir0n2': {
      'en': 'Enter Description',
      'ar': '',
    },
    'q82dzo32': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'ak1h94jk': {
      'en': 'active',
      'ar': '',
    },
    'jm7gsscz': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'xitfqop7': {
      'en': 'Search...',
      'ar': '',
    },
    'a1mryna4': {
      'en': 'active',
      'ar': 'active',
    },
    'gc2jgbbm': {
      'en': 'inactive',
      'ar': 'inactive',
    },
    '6gy6d6l0': {
      'en': 'draft',
      'ar': 'draft',
    },
    '7doiew0z': {
      'en': 'archived',
      'ar': 'archived',
    },
    'ihalx5jc': {
      'en': 'Color Swatch',
      'ar': 'سبب الرفض',
    },
    'saqezsi3': {
      'en': 'Thumbnail ',
      'ar': 'وسائط',
    },
    'vonhr1gg': {
      'en': 'Add Media',
      'ar': 'إضافة الوسائط',
    },
    'nxfyszea': {
      'en': 'Field is required',
      'ar': 'هذا الحقل مطلوب',
    },
    'f0uniz9v': {
      'en': 'Serial number not more then 5 numbers',
      'ar': 'رقم تسلسلي لا يزيد عن 5 أرقام',
    },
    'gc7mkcha': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'n1xuysj0': {
      'en': 'Field is required',
      'ar': 'عنوان الإشعار مطلوب',
    },
    'omrpkssb': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'l45sf5r7': {
      'en': 'Field is required',
      'ar': '',
    },
    'vq8lwplf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1eqntl1p': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'ohopbbvn': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // ProductMega-Menu-Popup
  {
    'wtmprmyy': {
      'en': 'All Products',
      'ar': 'جميع المنتجات',
    },
    'ksqx5bhl': {
      'en': 'Category',
      'ar': 'الفئة',
    },
    'kb4jwws8': {
      'en': 'Tags',
      'ar': 'السمات',
    },
    're30hwzv': {
      'en': 'Attributes',
      'ar': 'الخصائص',
    },
  },
  // Edit-CTAT
  {
    '2lq6pd03': {
      'en': 'Serial Number',
      'ar': 'الرقم السري',
    },
    'j2no9s7a': {
      'en': 'Enter Serial Number',
      'ar': '',
    },
    '17e6wcyb': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    '0ou7pd9z': {
      'en': 'Enter Name',
      'ar': '',
    },
    'lirjq9bg': {
      'en': 'Description',
      'ar': 'الوصف',
    },
    'r43resca': {
      'en': 'Enter Description',
      'ar': '',
    },
    'us867b5a': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'b4to25d0': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'l4g8rd5z': {
      'en': 'Search...',
      'ar': '',
    },
    'hytqrbs8': {
      'en': 'active',
      'ar': 'active',
    },
    'zjlmkt4r': {
      'en': 'inactive',
      'ar': 'inactive',
    },
    'jmk7p1j0': {
      'en': 'draft',
      'ar': 'draft',
    },
    'zpyvjiwh': {
      'en': 'archived',
      'ar': 'archived',
    },
    'h96jr81q': {
      'en': 'Color Swatch',
      'ar': 'سبب الرفض',
    },
    '1n8bvssf': {
      'en': 'Thumbnail ',
      'ar': 'وسائط',
    },
    'ph6yz2do': {
      'en': 'Add Media',
      'ar': 'إضافة الوسائط',
    },
    '6a5uek59': {
      'en': 'Serial number is required',
      'ar': 'الرقم التسلسلي مطلوب',
    },
    'qmxzzpsg': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '7kowpwxm': {
      'en': 'name is required',
      'ar': 'الاسم مطلوب',
    },
    'ywhf51cc': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qb4p8lnx': {
      'en': 'description is required',
      'ar': 'الوصف مطلوب',
    },
    '9w2vu45j': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5wcfv76t': {
      'en': 'Delete',
      'ar': 'يمسح',
    },
    'ka9ca5a5': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    '0shzja42': {
      'en': 'Update',
      'ar': 'يحفظ',
    },
  },
  // ProfilePopup
  {
    'm731ixjx': {
      'en': 'Profile Info',
      'ar': 'معلومات الملف الشخصي',
    },
    '8doodf87': {
      'en': 'Bank Details',
      'ar': 'تفاصيل البنك',
    },
    'slc1ojhp': {
      'en': 'Password & Security',
      'ar': 'كلمة المرور والأمان',
    },
    'z6b1sfrm': {
      'en': 'Preferences',
      'ar': 'التفضيلات',
    },
  },
  // EditBankInformation
  {
    'loylgewk': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    'yjr0yd13': {
      'en': 'Bank Name',
      'ar': 'عنوان',
    },
    'aj1f6itf': {
      'en': '',
      'ar': '',
    },
    'rozufqff': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    '7ylde6yw': {
      'en': 'Account Holder',
      'ar': 'رمز المنتج',
    },
    'ehmiqdme': {
      'en': '',
      'ar': '',
    },
    '40b32jfu': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'hi3vpcxs': {
      'en': 'Account Number',
      'ar': 'سعر',
    },
    'cyk2rtcx': {
      'en': '',
      'ar': '',
    },
    '4zs4wlf7': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'bqfa7fys': {
      'en': 'IBAN/IFSC Code',
      'ar': 'مقارنة السعر (اختياري)',
    },
    'tulndozk': {
      'en': '',
      'ar': '',
    },
    'z4bbykuj': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'vf6ov4wz': {
      'en': 'Preferred Payout Method',
      'ar': 'مخزون',
    },
    '0y2v6st6': {
      'en': '',
      'ar': '',
    },
    'l90mu2o5': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'rsyzcxjh': {
      'en': 'Bank name is required',
      'ar': '',
    },
    'yozxx45x': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '8egslq1y': {
      'en': 'Account holder field is required',
      'ar': '',
    },
    'wv19tjud': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'vkqr6j2o': {
      'en': 'Account number is required',
      'ar': '',
    },
    'kr6a94t6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'gitxbtyn': {
      'en': 'IFSC code is required',
      'ar': '',
    },
    'pvd6nid9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'szprqbz9': {
      'en': 'Payent method is required',
      'ar': '',
    },
    '4vb4880r': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'vi81idp4': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'ggqe8fj3': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // EditProfile1
  {
    'g6r4pgs6': {
      'en': 'Edit Profile',
      'ar': 'تحرير سريع',
    },
    'o65s3ehk': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    '7mr9jqt8': {
      'en': '',
      'ar': '',
    },
    'euidpgtn': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    '8mptatkt': {
      'en': 'Phone No',
      'ar': 'رمز المنتج',
    },
    'z9lxg5xy': {
      'en': '',
      'ar': '',
    },
    '9h6m74q6': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    '5bp0g8u6': {
      'en': 'Location / City',
      'ar': 'سعر',
    },
    '9oepr7fs': {
      'en': '',
      'ar': '',
    },
    '76tiquye': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'v5awsici': {
      'en': 'Email',
      'ar': 'مقارنة السعر (اختياري)',
    },
    '78lw5yyg': {
      'en': '',
      'ar': '',
    },
    'rw2ukucq': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    '9e9mfycg': {
      'en': 'Brand Name',
      'ar': 'مخزون',
    },
    'm5742fdv': {
      'en': '',
      'ar': '',
    },
    '9t2o098s': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'fxdlejn2': {
      'en': 'Experience',
      'ar': 'مخزون',
    },
    '698mmb51': {
      'en': '',
      'ar': '',
    },
    '66bdjjgj': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'ei9t6465': {
      'en': 'Platform Rate',
      'ar': 'نسبة المنصة',
    },
    'vkoj7w52': {
      'en': 'Select...',
      'ar': 'اختيار',
    },
    't6cahfx1': {
      'en': 'Search...',
      'ar': '',
    },
    'wo8av7s3': {
      'en': 'Option 1',
      'ar': '',
    },
    '4ovvu9af': {
      'en': 'Availability for Custom Orders',
      'ar': 'توافرالطلبات المخصصة',
    },
    'cqz7kcxv': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'mfe5570f': {
      'en': 'Search...',
      'ar': '',
    },
    '6a209335': {
      'en': 'Option 1',
      'ar': '',
    },
    'gj4ztjtt': {
      'en': 'Open for Events/Collaborations',
      'ar': 'مخزون',
    },
    'iuprt8ym': {
      'en': 'Select...',
      'ar': 'اختيار',
    },
    're6bwtkh': {
      'en': 'Search...',
      'ar': '',
    },
    'tyexdzed': {
      'en': 'Option 1',
      'ar': '',
    },
    'g1ff43b0': {
      'en': 'Production Capacity',
      'ar': 'مخزون',
    },
    '8vrowfdd': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    'fb9p99c0': {
      'en': 'Search...',
      'ar': '',
    },
    'rth5wllr': {
      'en': 'Option 1',
      'ar': '',
    },
    'aec2rpv5': {
      'en': 'Portfolio',
      'ar': 'المَلَفّ الشخصي',
    },
    'm2zswa3y': {
      'en': '',
      'ar': '',
    },
    'uo6hx4jz': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'z1k47jtp': {
      'en': 'Professional Insights',
      'ar': 'الرؤى المهنية',
    },
    'xdncoh04': {
      'en': '',
      'ar': '',
    },
    '6oy4n0qd': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'gj8x25zi': {
      'en': 'Other Certificate',
      'ar': 'مخزون',
    },
    '2djmokjq': {
      'en': 'Select...',
      'ar': 'اختيار',
    },
    '3rmauts5': {
      'en': 'Search...',
      'ar': '',
    },
    'haywlqun': {
      'en': 'Option 1',
      'ar': '',
    },
    'xlmf22aj': {
      'en': 'name is required',
      'ar': '',
    },
    'j5hxog3n': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'fyooz69r': {
      'en': 'product_sku is required',
      'ar': '',
    },
    'g15d268s': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'sm8vigpv': {
      'en': 'product_price is required',
      'ar': '',
    },
    'tr228wrf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'z9pxxfq7': {
      'en': 'product_regular_price is required',
      'ar': '',
    },
    'fx81tzgd': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qn6jqpk7': {
      'en': 'product_quantity is required',
      'ar': '',
    },
    '36qwa4yg': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'e6txfiqc': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'mb6met8d': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // RestockRequest1
  {
    '3bwdro5p': {
      'en': 'Restock Request for ',
      'ar': '',
    },
    'h0km904f': {
      'en': '\"Urban Style Dress - White / XS\"',
      'ar': '',
    },
    'kvmtugv0': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    'sl67yqoy': {
      'en': 'Product Name',
      'ar': 'عنوان',
    },
    'z3jlfahh': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    '5za5mivk': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'c4r0jhnm': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'h49qm8rc': {
      'en': 'Low Stock Alert Threshold',
      'ar': 'حد تنبيه انخفاض المخزون',
    },
    'n0vq46tm': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    '0kpi5ijg': {
      'en': 'Request Type',
      'ar': 'مقارنة السعر (اختياري)',
    },
    'ibrlphy1': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'i5a82hvu': {
      'en': 'Quantity',
      'ar': 'الكمية',
    },
    'q9c3ufpd': {
      'en': '',
      'ar': '',
    },
    'uly8eiqr': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'u59wz4jn': {
      'en': 'Preferred ETA Date',
      'ar': 'مخزون',
    },
    'supkew3w': {
      'en': '',
      'ar': '',
    },
    '22q09rla': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'dtlf6g2y': {
      'en': 'Restock Notes',
      'ar': 'مخزون',
    },
    '6qi88735': {
      'en': '',
      'ar': '',
    },
    '0zqdx3zl': {
      'en': 'Mention any delivery instructions or urgency notes.',
      'ar': 'أدخل النص الخاص بك',
    },
    'qar0oo0m': {
      'en': 'name is required',
      'ar': '',
    },
    '3oz9ogbb': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'z5i38z2v': {
      'en': 'product_sku is required',
      'ar': '',
    },
    'v5nkxjyn': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1ihb9cgp': {
      'en': 'product_price is required',
      'ar': '',
    },
    'ozwijei2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ng0enodp': {
      'en': 'product_regular_price is required',
      'ar': '',
    },
    'rk4rgo44': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '64fk05yg': {
      'en': 'product_quantity is required',
      'ar': '',
    },
    'iic6aq0a': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jla0r7yg': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'aozfjylx': {
      'en': 'Submit Restock Request',
      'ar': 'تحديث',
    },
  },
  // RestockRequestNew1
  {
    '9kfa7mr3': {
      'en': 'Restock Request for ',
      'ar': '',
    },
    'ggc3cm2w': {
      'en': '\"Urban Style Dress - White / XS\"',
      'ar': '',
    },
    'iybvyutn': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    'cff0u0tb': {
      'en': 'Select Product',
      'ar': 'مخزون',
    },
    'eeogqakx': {
      'en': 'Select...',
      'ar': 'اختيار',
    },
    '8xvt9ryu': {
      'en': 'Search...',
      'ar': '',
    },
    'xijffr2k': {
      'en': 'Option 1',
      'ar': '',
    },
    '0j66k3rv': {
      'en': 'SKU',
      'ar': 'عنوان',
    },
    'ayvczhhw': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    '1prynmcj': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'ksd19re7': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'rskprh63': {
      'en': 'Low Stock Alert Threshold',
      'ar': 'حد تنبيه انخفاض المخزون',
    },
    '5cnxg5s5': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'me73ohj6': {
      'en': 'Request Type',
      'ar': 'مقارنة السعر (اختياري)',
    },
    '9qw71mg3': {
      'en': 'Select...',
      'ar': 'اختيار',
    },
    'kutg987q': {
      'en': 'Search...',
      'ar': '',
    },
    'qiwjdgne': {
      'en': 'Option 1',
      'ar': '',
    },
    'q7br9u04': {
      'en': 'Quantity',
      'ar': 'الكمية',
    },
    'hey3rtqj': {
      'en': '',
      'ar': '',
    },
    'gafv1896': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'w6l354j6': {
      'en': 'Preferred ETA Date',
      'ar': 'تاريخ التسليم المتوقع ',
    },
    'gvlgkqq3': {
      'en': '',
      'ar': '',
    },
    '5j8nc9dv': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'u5g944m4': {
      'en': 'Notes',
      'ar': 'مخزون',
    },
    'zstknuib': {
      'en': '',
      'ar': '',
    },
    '15rvehk0': {
      'en': 'Urgent restock for weekend promo. Deliver to Warehouse.',
      'ar': 'تجديد مخزون عاجل لعروض نهاية الأسبوع. التوصيل إلى المستودع.',
    },
    'hy57mbxm': {
      'en': 'name is required',
      'ar': '',
    },
    'z3w7vo63': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jqs79taq': {
      'en': 'product_sku is required',
      'ar': '',
    },
    'qmmwhh0u': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'a23ka3l1': {
      'en': 'product_price is required',
      'ar': '',
    },
    '4z3haqw7': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '6v8zuj6i': {
      'en': 'product_regular_price is required',
      'ar': '',
    },
    '9n41vxhm': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'tpifb2kc': {
      'en': 'product_quantity is required',
      'ar': '',
    },
    'urtjthn3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'e5mj7v5r': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    '8zr0g4jw': {
      'en': 'Submit Restock Request',
      'ar': 'تحديث',
    },
  },
  // RestockRequestNewEdit1
  {
    'zsalui2a': {
      'en': 'Restock Request for ',
      'ar': '',
    },
    'lnrxcv1n': {
      'en': '\"Urban Style Dress - White / XS\"',
      'ar': '',
    },
    'vhoqu58x': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    'tyxvvfpj': {
      'en': 'Product Name',
      'ar': 'مخزون',
    },
    'fo0o1wss': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    '40995hlv': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'rm46dc6x': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'h36dzlsv': {
      'en': 'SKU',
      'ar': 'عنوان',
    },
    'vzsumovh': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'm1gamnug': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    '3ll1khlx': {
      'en': 'Pending',
      'ar': '',
    },
    'onoir9ut': {
      'en': 'Request Date',
      'ar': 'مخزون',
    },
    'j49nm2u0': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    '8xtr4ogc': {
      'en': 'Request Type',
      'ar': 'مقارنة السعر (اختياري)',
    },
    'bs8gaufq': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'kkpgh3eg': {
      'en': 'Quantity',
      'ar': 'الكمية',
    },
    'cu3rezf2': {
      'en': '',
      'ar': '',
    },
    'e9se5soc': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'prskp9rc': {
      'en': 'Preferred ETA Date',
      'ar': 'تاريخ التسليم المتوقع ',
    },
    'pfcx4n7m': {
      'en': '',
      'ar': '',
    },
    's4vikjn6': {
      'en': 'Input your text',
      'ar': 'أدخل النص الخاص بك',
    },
    'mb3e4l4y': {
      'en': 'Notes',
      'ar': 'ملاحظات',
    },
    '0o5474mg': {
      'en': '',
      'ar': '',
    },
    '54843twd': {
      'en': 'Urgent restock for weekend promo. Deliver to Warehouse.',
      'ar': 'تجديد مخزون عاجل لعروض نهاية الأسبوع. التوصيل إلى المستودع.',
    },
    'pizhl78l': {
      'en': 'name is required',
      'ar': '',
    },
    'imq7latd': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ndyu1tlo': {
      'en': 'product_sku is required',
      'ar': '',
    },
    'pnlfiszn': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'z3ymolm9': {
      'en': 'product_price is required',
      'ar': '',
    },
    'f7ip440h': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'yr1hf6hb': {
      'en': 'product_regular_price is required',
      'ar': '',
    },
    'wtql7btk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '6v5nmep1': {
      'en': 'product_quantity is required',
      'ar': '',
    },
    '4x5oahxv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ilmr56d7': {
      'en': 'Edit',
      'ar': 'تحرير',
    },
    '4hur4ds4': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'gkxl5mp9': {
      'en': 'Submit Restock Request',
      'ar': 'تحديث',
    },
  },
  // RestockRequestEnquiry1
  {
    'ucl2i33p': {
      'en': 'Enquiry for ',
      'ar': '',
    },
    'zdu42jy0': {
      'en': '\"Urban Style Dress - White / XS\"',
      'ar': '',
    },
    'bcvf99li': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    'd1z8naqj': {
      'en': 'Product Name',
      'ar': 'مخزون',
    },
    'k8avi6qd': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'hp48j8q5': {
      'en': 'SKU',
      'ar': 'عنوان',
    },
    '1pau36e3': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'foqtbnxg': {
      'en': 'Request Qty',
      'ar': 'مخزون',
    },
    'rw1szu0j': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    '2nzb20nk': {
      'en': 'Request Type',
      'ar': 'مقارنة السعر (اختياري)',
    },
    '7zbb5574': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'ic75dwgy': {
      'en': 'Issue Type',
      'ar': 'مخزون',
    },
    'n7maq0of': {
      'en': 'Select...',
      'ar': 'اختيار',
    },
    'pms3ppjn': {
      'en': 'Search...',
      'ar': '',
    },
    'y6lyyqpz': {
      'en': 'Option 1',
      'ar': '',
    },
    '0m084vxt': {
      'en': 'Affected Qty',
      'ar': 'مخزون',
    },
    '5n0ufs29': {
      'en': '',
      'ar': '',
    },
    'l66ugq1i': {
      'en': ' Enter number of affected items',
      'ar': 'أدخل النص الخاص بك',
    },
    '5yhpkci0': {
      'en': 'Description / Notes',
      'ar': 'مخزون',
    },
    'd0tzgq1i': {
      'en': '',
      'ar': '',
    },
    'ra12043p': {
      'en': 'Write a short description ',
      'ar': 'أدخل النص الخاص بك',
    },
    'dd5ny8ib': {
      'en': 'Attach Photos',
      'ar': 'مخزون',
    },
    '2f4pkoxn': {
      'en': 'Upload',
      'ar': '',
    },
    'u5kcu80g': {
      'en': 'Add up to 3 images (.JPG, .PNG, max 5MB each)',
      'ar': 'أضف حتي 3 صور (.JPG، .PNG، بحد أقصى 5 ميجابايت لكل صورة)',
    },
    'f2p78abk': {
      'en': 'Damaged.JPG',
      'ar': '',
    },
    'u201nxcw': {
      'en': '4.2 MB',
      'ar': '',
    },
    'giyf7a5f': {
      'en': '   .   ',
      'ar': '',
    },
    '8gvqkpyl': {
      'en': 'JPEG',
      'ar': '',
    },
    'd0jsetfw': {
      'en': 'Damaged.JPG',
      'ar': '',
    },
    'lmvpoq2c': {
      'en': '4.2 MB',
      'ar': '',
    },
    'zdbcwloc': {
      'en': '   .   ',
      'ar': '',
    },
    'jncp6u0e': {
      'en': 'JPEG',
      'ar': '',
    },
    'a53rnohy': {
      'en': 'name is required',
      'ar': '',
    },
    'vb6aoprf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '6ldd2iic': {
      'en': 'product_sku is required',
      'ar': '',
    },
    '4soy66a2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'mb8w613n': {
      'en': 'product_price is required',
      'ar': '',
    },
    'lf350bfl': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'oo3xat0y': {
      'en': 'product_regular_price is required',
      'ar': '',
    },
    'grdfnqzl': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'k4w9130u': {
      'en': 'product_quantity is required',
      'ar': '',
    },
    'er0yl83g': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'nq8y6k8z': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'x57e53sy': {
      'en': 'Submit Enquiry',
      'ar': 'تحديث',
    },
  },
  // RestockRequestEnquiryEdit1
  {
    '74e78pel': {
      'en': 'Enquiry for ',
      'ar': '',
    },
    '8joxn4p9': {
      'en': '\"Urban Style Dress - White / XS\"',
      'ar': '',
    },
    'knl71njr': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    'la9lcp5m': {
      'en': 'Product Name',
      'ar': 'مخزون',
    },
    'ntdq45qk': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'meorl2ze': {
      'en': 'SKU',
      'ar': 'عنوان',
    },
    'yr0n9kou': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'ivozolwr': {
      'en': 'Request Qty',
      'ar': 'مخزون',
    },
    '7bml52wk': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'iz2hbgj9': {
      'en': 'Request Type',
      'ar': 'مقارنة السعر (اختياري)',
    },
    'qzgvprt1': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    '3967n272': {
      'en': 'Fulfillment Stage',
      'ar': 'مخزون',
    },
    'bahb2h99': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'zkaj3buf': {
      'en': 'Issue Type',
      'ar': 'مخزون',
    },
    'a6y0voob': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    '4apqgyap': {
      'en': 'Affected Qty',
      'ar': 'مخزون',
    },
    'ma86oisg': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    '14v0pu90': {
      'en': 'Description / Notes',
      'ar': 'مخزون',
    },
    'j2g86ugf': {
      'en': 'Current Stock',
      'ar': 'رمز المنتج',
    },
    'h7fogpf5': {
      'en': 'Attach Photos',
      'ar': 'مخزون',
    },
    '8jqzj91y': {
      'en': 'Upload',
      'ar': '',
    },
    '3wksabta': {
      'en': 'Add up to 3 images (.JPG, .PNG, max 5MB each)',
      'ar': 'أضف حتي 3 صور (.JPG، .PNG، بحد أقصى 5 ميجابايت لكل صورة)',
    },
    'zob7e680': {
      'en': 'Damaged.JPG',
      'ar': '',
    },
    'nmw04f62': {
      'en': '4.2 MB',
      'ar': '',
    },
    'p67fwmnl': {
      'en': '   .   ',
      'ar': '',
    },
    'i0ki1xig': {
      'en': 'JPEG',
      'ar': '',
    },
    'zddnc9wq': {
      'en': 'Damaged.JPG',
      'ar': '',
    },
    'tv5gbnml': {
      'en': '4.2 MB',
      'ar': '',
    },
    'dlvzuopv': {
      'en': '   .   ',
      'ar': '',
    },
    'yvft9zm2': {
      'en': 'JPEG',
      'ar': '',
    },
    '25xizo8h': {
      'en': 'name is required',
      'ar': '',
    },
    'yqiznbez': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'fznprhwj': {
      'en': 'product_sku is required',
      'ar': '',
    },
    '3rg9tod2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5k4umxub': {
      'en': 'product_price is required',
      'ar': '',
    },
    '6xb15fyo': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'fgn5eng2': {
      'en': 'product_regular_price is required',
      'ar': '',
    },
    'k671zd8h': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'crqz45hu': {
      'en': 'product_quantity is required',
      'ar': '',
    },
    'l3k16wim': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '6j5zme4x': {
      'en': 'Delete',
      'ar': 'مسح',
    },
    'tcjms7l8': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'c7qlvphz': {
      'en': 'Submit Enquiry',
      'ar': 'تحديث',
    },
  },
  // RequestPopup1
  {
    'j4pk3vej': {
      'en': 'View Details',
      'ar': '',
    },
    'pc20fp1o': {
      'en': 'Edit',
      'ar': '',
    },
    '4r97hqdq': {
      'en': 'Delete',
      'ar': '',
    },
  },
  // inventorymenupopup1
  {
    'be83eunq': {
      'en': 'Inventory Overview',
      'ar': '',
    },
    'dlhfivpp': {
      'en': 'Inventory Overview',
      'ar': '',
    },
    '9h84yo9t': {
      'en': 'Restock & Returns',
      'ar': '',
    },
    'z1n2ku8c': {
      'en': 'Restock & Returns',
      'ar': '',
    },
  },
  // AlertThresholdinput
  {
    'hwm5dqk7': {
      'en': '',
      'ar': '',
    },
    '5h5v4b4a': {
      'en': '5',
      'ar': '',
    },
  },
  // AdjustAlertThreshold
  {
    'lol73kds': {
      'en': 'Alert Threshold',
      'ar': '',
    },
    '43kgjj1c': {
      'en': 'Search...',
      'ar': '',
    },
    '177rfbir': {
      'en': 'Set to',
      'ar': 'تعيين الي',
    },
    'p8ido1l5': {
      'en': '',
      'ar': '',
    },
    '3rtxtjaq': {
      'en': '0',
      'ar': '0',
    },
    'giovoi86': {
      'en': 'Reason',
      'ar': 'السبب',
    },
    'h1eqdnhd': {
      'en': 'Threshold change',
      'ar': 'تغيير قيمة الحد',
    },
    'ht9zsebn': {
      'en': 'Search...',
      'ar': '',
    },
    '9i9fk7m9': {
      'en': 'Correction ',
      'ar': '',
    },
    '9eut5gvi': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // RestockRequest
  {
    'zyz527vl': {
      'en': 'Restock Request for  ',
      'ar': 'طلب إعادة التخزين لـ',
    },
    'z7xl2jrp': {
      'en': '',
      'ar': '',
    },
    'ihz8zg28': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    '7xrg0mnx': {
      'en': 'Product Name',
      'ar': 'عنوان',
    },
    'vrzr294k': {
      'en': 'In-hand Stock',
      'ar': 'المخزون المتوفر',
    },
    '09wh6hfk': {
      'en': 'Low Stock Alert Threshold',
      'ar': ' تنبيه انخفاض المخزون',
    },
    '1g9n72j7': {
      'en': 'Request Type',
      'ar': 'مقارنة السعر (اختياري)',
    },
    'c7avb4zc': {
      'en': 'Restock',
      'ar': 'رمز المنتج',
    },
    'h5uwrgpl': {
      'en': 'Quantity',
      'ar': 'الكمية',
    },
    '8bm4acom': {
      'en': '',
      'ar': '',
    },
    'w2z26x58': {
      'en': '5',
      'ar': 'أدخل النص الخاص بك',
    },
    'qdcbi5bw': {
      'en': 'Package Count ',
      'ar': 'كمية',
    },
    '3jw6ttg1': {
      'en': '',
      'ar': '',
    },
    '6kly6mua': {
      'en': '1',
      'ar': 'أدخل النص الخاص بك',
    },
    'j5bokit2': {
      'en': 'Weight',
      'ar': 'وزن',
    },
    '4sjpuwfc': {
      'en': 'Weight',
      'ar': 'وزن',
    },
    'drrlzb9y': {
      'en': '0',
      'ar': '',
    },
    'spi1j6fc': {
      'en': 'gm',
      'ar': 'جنرال موتورز',
    },
    '8jua2zer': {
      'en': 'gm',
      'ar': '',
    },
    'kpy4cr2o': {
      'en': 'Search...',
      'ar': '',
    },
    '59car7x4': {
      'en': 'kg',
      'ar': 'كجم',
    },
    'o4ifh30r': {
      'en': 'gm',
      'ar': 'جنرال موتورز',
    },
    '9y9h4328': {
      'en': 'Preferred ETA Date',
      'ar': 'تاريخ التسليم المتوقع ',
    },
    '5kcubn44': {
      'en': '',
      'ar': '',
    },
    'evcg3c9o': {
      'en': '02-01-2026',
      'ar': 'أدخل النص الخاص بك',
    },
    'o2m8nf29': {
      'en': 'Restock Notes',
      'ar': 'ملاحظات إعادة التخزين',
    },
    '1yiyuoyn': {
      'en': '',
      'ar': '',
    },
    'pxuz3i77': {
      'en': 'Mention any delivery instructions or urgency notes.',
      'ar': 'أدخل النص الخاص بك',
    },
    'h8hs8e1b': {
      'en': 'Quantity is required',
      'ar': 'الكمية المطلوبة',
    },
    'et6uossv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'phachvfs': {
      'en': 'Enter package count',
      'ar': 'أدخل عدد الطرود',
    },
    '6ia2u9p6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'k0qp83pd': {
      'en': '0 is required',
      'ar': '',
    },
    'bxpdvoge': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5lqos02d': {
      'en': '02-01-2026 is required',
      'ar': '',
    },
    'y0nb1qd9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'o7hzxedh': {
      'en': 'Mention any delivery instructions or urgency notes. is required',
      'ar': '',
    },
    'yuv1vi1z': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'x42x3bv6': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'vob528lg': {
      'en': 'Submit Restock Pickup Request',
      'ar': 'إرسال طلب إعادة التخزين',
    },
  },
  // RestockRequest-Edit
  {
    'mjqphfsi': {
      'en': 'Restock Request for  ',
      'ar': 'طلب إعادة التخزين لـ',
    },
    'nzjwdxam': {
      'en': '',
      'ar': '',
    },
    '94hv9svf': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    'cbzup7uc': {
      'en': 'Product Name',
      'ar': 'اسم المنتج',
    },
    'gliao9kv': {
      'en': 'In-hand Stock',
      'ar': 'رمز المنتج',
    },
    'w49f55ld': {
      'en': 'Product ID',
      'ar': 'معرف المنتج',
    },
    'gvf5gzxd': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'cjhu4wy5': {
      'en': 'Pending',
      'ar': '',
    },
    'ak9o3670': {
      'en': 'Request Date',
      'ar': 'تاريخ الطلب',
    },
    'swlsnvg3': {
      'en': 'Request Type',
      'ar': 'نوع الطلب',
    },
    'ebkre6ur': {
      'en': 'Restock',
      'ar': 'رمز المنتج',
    },
    '9sz75ruc': {
      'en': 'Quantity',
      'ar': 'الكمية',
    },
    '0of2l7pj': {
      'en': '',
      'ar': '',
    },
    'lx0en445': {
      'en': '220',
      'ar': 'أدخل النص الخاص بك',
    },
    '25xql9y9': {
      'en': 'Preferred ETA Date',
      'ar': 'تاريخ التسليم المتوقع',
    },
    'wut1b5p1': {
      'en': '',
      'ar': '',
    },
    'cjzrazek': {
      'en': '  May 27, 2025',
      'ar': 'أدخل النص الخاص بك',
    },
    'e88iwl1i': {
      'en': 'Notes',
      'ar': 'ملاحظات',
    },
    'u71d9sxx': {
      'en': '',
      'ar': '',
    },
    'xicluf3y': {
      'en': 'Urgent restock for weekend promo. Deliver to Warehouse.',
      'ar': 'تجديد مخزون عاجل لعروض نهاية الأسبوع.  التوصيل إلى المستودع.',
    },
    '38wquncj': {
      'en': 'product_quantity is required',
      'ar': '',
    },
    'rli4wxab': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xfcb4mya': {
      'en': '  May 27, 2025 is required',
      'ar': '',
    },
    'ut6c71oz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'zpn8n7eo': {
      'en': 'admin_notes is required',
      'ar': '',
    },
    '8a2i6x8l': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'anwxtayh': {
      'en': 'Delete',
      'ar': 'مسح',
    },
    '116nsck3': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    '9edoxkan': {
      'en': 'Update Request ',
      'ar': 'طلب تعديل',
    },
  },
  // Enquiry
  {
    'yfxgvh1m': {
      'en': 'Raise Enquiry',
      'ar': 'رفع الاستفسار',
    },
    'n4d8zovi': {
      'en': 'Product Name',
      'ar': 'مخزون',
    },
    'bik2bpxj': {
      'en': 'Product ID',
      'ar': 'عنوان',
    },
    'vhr36mue': {
      'en': 'Requested Qty',
      'ar': 'مخزون',
    },
    '4mg0b8zf': {
      'en': 'Request Type',
      'ar': 'مقارنة السعر (اختياري)',
    },
    'gbo9xp8u': {
      'en': 'Restock',
      'ar': 'رمز المنتج',
    },
    'zb55wlrj': {
      'en': 'Issue Type',
      'ar': 'مخزون',
    },
    '2khz7azf': {
      'en': 'Select issue Type',
      'ar': 'يختار...',
    },
    'iebla5ud': {
      'en': 'Search...',
      'ar': '',
    },
    'vrhfd8bl': {
      'en': 'Short Quantity Received',
      'ar': 'نقص الكمية المستلمة',
    },
    'am1ucz6d': {
      'en': 'Damaged',
      'ar': '',
    },
    '1jj6jz0r': {
      'en': 'Affected Qty',
      'ar': 'مخزون',
    },
    'vl2i95hv': {
      'en': '',
      'ar': '',
    },
    'l0uv7dt0': {
      'en': ' Enter number of affected items',
      'ar': 'أدخل النص الخاص بك',
    },
    '22y3to8p': {
      'en': 'Description / Notes',
      'ar': 'مخزون',
    },
    'fn7o3urm': {
      'en': '',
      'ar': '',
    },
    'nrikt9hu': {
      'en': 'Write a short description ',
      'ar': 'أدخل النص الخاص بك',
    },
    'a5jj0qj8': {
      'en': 'Attach Photos',
      'ar': 'مخزون',
    },
    'ykxn1gia': {
      'en': 'Upload',
      'ar': 'تحميل',
    },
    'th7xqyao': {
      'en': 'Add up to 5 images (.JPG, .PNG)',
      'ar': 'أضف حتي 5 صور (.JPG، .PNG)',
    },
    'by8bqfnf': {
      'en': 'Damaged.JPG',
      'ar': '',
    },
    'ug6q5zh2': {
      'en': '4.2 MB',
      'ar': '',
    },
    'siw1q1a8': {
      'en': '   .   ',
      'ar': '',
    },
    'f4r4xmpf': {
      'en': 'JPEG',
      'ar': '',
    },
    'iewcr8df': {
      'en': ' Enter number of affected items ',
      'ar': '',
    },
    'rwmmm5ia': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '7sda26oc': {
      'en': 'Write a short description ',
      'ar': '',
    },
    'bmt0foyt': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'hj5i1s4b': {
      'en': 'Delete',
      'ar': 'مسح',
    },
    'qnxh4umi': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'gzo03ibz': {
      'en': 'Submit Enquiry',
      'ar': 'تحديث',
    },
  },
  // Enquiry-view
  {
    'btfmcdxu': {
      'en': 'Enquiry for ',
      'ar': '',
    },
    'ocq0p6jr': {
      'en': '',
      'ar': '',
    },
    '1ta14cwz': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    'v0tmmaw1': {
      'en': 'Product Name',
      'ar': 'مخزون',
    },
    '5ifuvliv': {
      'en': 'SKU',
      'ar': 'عنوان',
    },
    'gcaxehr0': {
      'en': 'Received Qty',
      'ar': 'مخزون',
    },
    'clkgdfy7': {
      'en': 'Request Type',
      'ar': 'مقارنة السعر (اختياري)',
    },
    'zobp0duy': {
      'en': 'Fulfillment Stage',
      'ar': 'مخزون',
    },
    'h2f2ix7x': {
      'en': 'Enquiry Open ',
      'ar': 'رمز المنتج',
    },
    '9w2go9m7': {
      'en': 'Issue Type',
      'ar': 'مخزون',
    },
    'pif7xmd9': {
      'en': 'Affected Qty',
      'ar': 'مخزون',
    },
    '1qhca2ti': {
      'en': 'Description / Notes',
      'ar': 'مخزون',
    },
    '2z4ujd33': {
      'en': 'Attach Photos',
      'ar': 'مخزون',
    },
    'tecmkfs1': {
      'en': 'Damaged.JPG',
      'ar': '',
    },
    'b6ualzbj': {
      'en': '4.2 MB',
      'ar': '',
    },
    'akovrwzg': {
      'en': '   .   ',
      'ar': '',
    },
    't7s0frt0': {
      'en': 'JPEG',
      'ar': '',
    },
    'cfpxbjll': {
      'en': 'Upload',
      'ar': '',
    },
    'qb7igal5': {
      'en': 'Add up to 3 images (.JPG, .PNG, max 5MB each)',
      'ar': 'أضف حتي 3 صور (.JPG، .PNG، بحد أقصى 5 ميجابايت لكل صورة)',
    },
    'hyan4n83': {
      'en': 'name is required',
      'ar': '',
    },
    'l4sxu0d5': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'roz9q46v': {
      'en': 'product_sku is required',
      'ar': '',
    },
    '3uic18g9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '2b61oxh2': {
      'en': 'product_price is required',
      'ar': '',
    },
    'tom2w8t8': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ddid9hdk': {
      'en': 'product_regular_price is required',
      'ar': '',
    },
    'gat7bbix': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'nw4og9eb': {
      'en': 'product_quantity is required',
      'ar': '',
    },
    '76wjzeya': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '94obcsa8': {
      'en': 'Delete',
      'ar': 'مسح',
    },
    '1rkhr1mf': {
      'en': 'Submit Enquiry',
      'ar': 'إرسال الاستعلام',
    },
    '5ylsbb0v': {
      'en': 'Accept',
      'ar': '',
    },
    'kwh0q7er': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
  },
  // NewRequest-add
  {
    'snghdmfw': {
      'en': 'Add New Request',
      'ar': 'إضافة طلب جديد',
    },
    '9l4svq3x': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    'oro57d13': {
      'en': 'Select Product',
      'ar': 'اختيار المنتج',
    },
    'pdm69i8m': {
      'en': 'Select Product',
      'ar': 'اختيار المنتج',
    },
    'ktvieggw': {
      'en': 'Search...',
      'ar': '',
    },
    'qivhjfpy': {
      'en': 'Product ID',
      'ar': 'عنوان',
    },
    'x5hvnb4u': {
      'en': 'In-hand Stock',
      'ar': 'رمز المنتج',
    },
    'fxxgfr0v': {
      'en': 'Low Stock Alert Threshold',
      'ar': 'تنبيه انخفاض المخزون',
    },
    'hbjwmelj': {
      'en': 'Request Type',
      'ar': 'نوع الطلب',
    },
    '25z7jcyj': {
      'en': 'Request Type',
      'ar': 'مقارنة السعر (اختياري)',
    },
    '4zhqhoyr': {
      'en': 'Restock',
      'ar': '',
    },
    'bqn72myr': {
      'en': 'Restock',
      'ar': 'يختار...',
    },
    'cryg5cx9': {
      'en': 'Search...',
      'ar': '',
    },
    'cnucbd8i': {
      'en': 'Restock',
      'ar': '',
    },
    '4u23wmpy': {
      'en': 'Quantity',
      'ar': 'الكمية',
    },
    'cwm59zwo': {
      'en': '',
      'ar': '',
    },
    '71hka3s7': {
      'en': 'Enter quanity',
      'ar': '',
    },
    'ixpidsor': {
      'en': 'Preferred ETA Date',
      'ar': 'تاريخ التسليم المتوقع ',
    },
    '4ua1hs5k': {
      'en': '',
      'ar': '',
    },
    'pf71ynp1': {
      'en': 'Notes',
      'ar': 'ملاحظات',
    },
    '0w9i9061': {
      'en': '',
      'ar': '',
    },
    'ri0gn93h': {
      'en': 'Urgent restock for weekend promo. Deliver to Warehouse.',
      'ar': 'تجديد مخزون عاجل لعروض نهاية الأسبوع.التوصيل إلى المستودع.',
    },
    'eu50qo8a': {
      'en': 'product_quantity is required',
      'ar': 'كمية المنتج مطلوبة',
    },
    'ylmhpsuo': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'o0e3cvmn': {
      'en': 'Field is required',
      'ar': '',
    },
    '5djoa51b': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'px23m41b': {
      'en':
          'Urgent restock for weekend promo. Deliver to Warehouse. is required',
      'ar': '',
    },
    'oirhjman': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'kxp0m004': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'pw1uve1c': {
      'en': 'Submit Request',
      'ar': 'إرسال الطلب',
    },
  },
  // Request-Accept
  {
    'ffd4lotv': {
      'en': 'Restock Request for  ',
      'ar': '',
    },
    'm0sjezmb': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    '7zhy0fkt': {
      'en': 'Designer ETA Date',
      'ar': 'تاريخ التسليم المتوقع من المصمم ',
    },
    'ua302htl': {
      'en': '',
      'ar': '',
    },
    'uk59xo46': {
      'en': '02-01-2026',
      'ar': 'أدخل النص الخاص بك',
    },
    'yvkenbwk': {
      'en': 'Notes (Optional)',
      'ar': 'ملاحظات (اختياري)',
    },
    'wx11nysc': {
      'en': '',
      'ar': '',
    },
    'h4045spb': {
      'en': 'Notes',
      'ar': '',
    },
    'nwecnqyj': {
      'en': '02-01-2026 is required',
      'ar': '',
    },
    'uy28w4uh': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'n1xuysj0': {
      'en': 'Field is required',
      'ar': 'عنوان الإشعار مطلوب',
    },
    'bxpdvoge': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'fkv8firg': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'lbxeknzt': {
      'en': 'Accept',
      'ar': 'قبول',
    },
  },
  // inventory-menu-New
  {
    'bv6ojsn2': {
      'en': 'Product Management',
      'ar': 'إدارة المنتجات',
    },
    '6by4jmel': {
      'en': 'Stock Management',
      'ar': 'إدارة المخزون',
    },
  },
  // RequestPopupOption
  {
    'b1dbq3vl': {
      'en': 'View Details',
      'ar': '',
    },
    'rcevvu7s': {
      'en': 'Edit',
      'ar': 'يحرر',
    },
    '7pv073ql': {
      'en': 'Delete',
      'ar': 'يمسح',
    },
  },
  // notificationcomponent
  {
    'kzbbckq5': {
      'en': '',
      'ar': '',
    },
    'nd7miklj': {
      'en': 'Search',
      'ar': 'بحث',
    },
    '2nx89ds5': {
      'en': 'Showing',
      'ar': 'عرض',
    },
    'f48q75k2': {
      'en': 'Message...',
      'ar': '',
    },
    'pmm0fh61': {
      'en': 'New Users',
      'ar': 'المستخدمون الجدد',
    },
    'ephsopsr': {
      'en': '',
      'ar': '',
    },
    'gf2j5wvi': {
      'en': 'Items in cart',
      'ar': 'العناصر الموجودة في سلة التسوق',
    },
    'ki8g124f': {
      'en': '',
      'ar': '',
    },
    'e53rgm1u': {
      'en': 'Regular',
      'ar': 'عادي',
    },
    '679y5q9q': {
      'en': '',
      'ar': '',
    },
    '6fqcll2p': {
      'en': 'Abandoned checkout',
      'ar': 'دفع غيرمكتمل',
    },
    'o0fhb7dh': {
      'en': '',
      'ar': '',
    },
    'xybt1qia': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'ko4p1zb2': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // azyaa_sidebar_backup1
  {
    'mni3zlcr': {
      'en': 'AZYAA14',
      'ar': 'أزيا',
    },
    'hd0oaicd': {
      'en': 'Azyaa',
      'ar': '',
    },
    'iu9eml3y': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
    },
    'un00whau': {
      'en': 'Dashoard',
      'ar': '',
    },
    'mls8h1zr': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '1hrb24ki': {
      'en': 'Customers',
      'ar': '',
    },
    'xqaxjnxh': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    '08ly9yiw': {
      'en': 'Customers',
      'ar': '',
    },
    'h8cxjs0f': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'vqweu4nb': {
      'en': 'Customers',
      'ar': '',
    },
    '8n5hl3od': {
      'en': 'WaitListCustomers',
      'ar': 'عملاء',
    },
    'e51fu4k6': {
      'en': 'WaitListCustomers',
      'ar': '',
    },
    'js7rofki': {
      'en': 'Wait List',
      'ar': 'قائمة الانتظار',
    },
    'ur95ekmy': {
      'en': 'Wait List',
      'ar': '',
    },
    'a2c9rffw': {
      'en': 'Customers',
      'ar': 'عملاء',
    },
    'tjs6uoyp': {
      'en': 'Customers',
      'ar': '',
    },
    '67ms7s84': {
      'en': 'WaitListCustomers',
      'ar': 'عملاء',
    },
    'us5c7nlb': {
      'en': 'WaitListCustomers',
      'ar': '',
    },
    'gua3yjy7': {
      'en': 'Wait List',
      'ar': 'قائمة الانتظار',
    },
    'fwrm9b0k': {
      'en': 'Wait List',
      'ar': '',
    },
    'fa2ehxtd': {
      'en': 'Partners',
      'ar': 'الشركاء',
    },
    'bn757hgi': {
      'en': 'Partners',
      'ar': '',
    },
    'mxr80egf': {
      'en': 'Partners',
      'ar': 'الشركاء',
    },
    '0cs7wmn5': {
      'en': 'Partners',
      'ar': '',
    },
    'unabx6nj': {
      'en': 'Designers',
      'ar': 'المصممون',
    },
    'lh6o7exq': {
      'en': 'Designers',
      'ar': '',
    },
    'njgog6gh': {
      'en': 'Creators',
      'ar': 'المبدعون',
    },
    'keklf9hq': {
      'en': 'Creators',
      'ar': '',
    },
    '826onkbu': {
      'en': 'Products',
      'ar': 'منتجات',
    },
    'wa87ebng': {
      'en': 'Products',
      'ar': '',
    },
    'q9x1ooju': {
      'en': 'Products',
      'ar': 'المنتجات',
    },
    'f6c20j6m': {
      'en': 'Products',
      'ar': '',
    },
    'l5bpmtkl': {
      'en': 'All Products',
      'ar': 'كل المنتجات',
    },
    '0p1wzxgm': {
      'en': 'All Products',
      'ar': '',
    },
    'tijn93yc': {
      'en': 'Categories ',
      'ar': 'الفئات ',
    },
    'fjsvyuiy': {
      'en': 'Categories',
      'ar': '',
    },
    'cdc6xpns': {
      'en': 'Tags',
      'ar': 'السمات',
    },
    'yqf1uni6': {
      'en': 'Tags',
      'ar': '',
    },
    'plyum1mn': {
      'en': 'Attributes',
      'ar': 'الخصائص',
    },
    'qe8726pa': {
      'en': 'Attributes',
      'ar': '',
    },
    'tne9p89v': {
      'en': 'Orders',
      'ar': 'الطلبات',
    },
    '8x5tc5tr': {
      'en': 'Orders',
      'ar': '',
    },
    '1wm028wv': {
      'en': 'Media',
      'ar': 'الوسائط',
    },
    'ema8zcuk': {
      'en': 'Media Management',
      'ar': '',
    },
    'hymfjcyy': {
      'en': 'User Role',
      'ar': 'صلاحيات المستخدم',
    },
    'b5l51mj4': {
      'en': 'User Role',
      'ar': '',
    },
    's0f9wij5': {
      'en': 'Inventory',
      'ar': '',
    },
    'vz0p9558': {
      'en': 'Inventory',
      'ar': '',
    },
    'fghiim54': {
      'en': 'Inventory',
      'ar': 'الجرد',
    },
    '5o5p5flf': {
      'en': 'Inventory',
      'ar': '',
    },
    'p4wcje13': {
      'en': 'Inventory Overview',
      'ar': 'المصممون',
    },
    '1imfobvn': {
      'en': 'Inventory Overview',
      'ar': '',
    },
    'anj84gvn': {
      'en': 'Restock & Returns',
      'ar': 'إعادة التخزين والإرجاعات',
    },
    '94rp20ns': {
      'en': 'Restock & Returns',
      'ar': '',
    },
    'p849kvgf': {
      'en': 'Inventory',
      'ar': '',
    },
    'l6kdy3oo': {
      'en': 'Inventory',
      'ar': '',
    },
    'hpx0kwon': {
      'en': 'Inventory',
      'ar': 'جرد',
    },
    '8g9e56yn': {
      'en': 'Inventory',
      'ar': '',
    },
    '5fv8d6ir': {
      'en': 'Product Management',
      'ar': 'المصممون',
    },
    'ftpono9t': {
      'en': 'Inventory Overview',
      'ar': '',
    },
    'vg4tfr2o': {
      'en': 'Stock Management',
      'ar': 'المبدعون',
    },
    '9my57isw': {
      'en': 'Restock & Returns',
      'ar': '',
    },
    'vfqzr1wn': {
      'en': 'Finance',
      'ar': '',
    },
    'bhn7qfml': {
      'en': 'Finance',
      'ar': '',
    },
    'ppdmsr8d': {
      'en': 'Analytics',
      'ar': '',
    },
    '462uttce': {
      'en': 'Analytics',
      'ar': '',
    },
    'ona02wz1': {
      'en': 'Support',
      'ar': '',
    },
    'nlsoa9ga': {
      'en': 'Customer & Support',
      'ar': '',
    },
    'ii7vbzfh': {
      'en': 'Collapse',
      'ar': '',
    },
    'cwlhc90n': {
      'en': 'Collapse',
      'ar': '',
    },
    '66egsxv5': {
      'en': 'Expand',
      'ar': '',
    },
    'x6qdq5m6': {
      'en': 'Expand',
      'ar': '',
    },
    'gjhbjcib': {
      'en': 'Analytics',
      'ar': '',
    },
    'sk5nmfpk': {
      'en': 'Analytics',
      'ar': '',
    },
    '1dy1pc1a': {
      'en': 'Discount',
      'ar': '',
    },
    'o2g4135g': {
      'en': 'Discount',
      'ar': '',
    },
    'alkxc5gt': {
      'en': 'Marketing',
      'ar': '',
    },
    '16oroe1i': {
      'en': 'Marketing',
      'ar': '',
    },
    'w3hw32h6': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'ip2sdxln': {
      'en': 'Settings',
      'ar': '',
    },
    'gnv41o6y': {
      'en': 'Logout',
      'ar': 'تسجيل الخروج',
    },
    'npg1ppnh': {
      'en': 'Logout',
      'ar': '',
    },
  },
  // Reject-Return
  {
    '8ha62dha': {
      'en': 'Reject Return Submission',
      'ar': 'رفض طلب الإرجاع',
    },
    'cg4mn0au': {
      'en': 'Please specify the reason for rejecting the return',
      'ar': 'يرجى تحديد سبب رفض هذا المصمم.',
    },
    '7xw7v4n1': {
      'en': 'Reason for Rejection',
      'ar': 'سبب الرفض',
    },
    'o9ymkffm': {
      'en': ' No evidence of damage/defect',
      'ar': '',
    },
    'xwhib35f': {
      'en': 'Select..',
      'ar': 'اختيار',
    },
    'phgjku0g': {
      'en': 'Search...',
      'ar': '',
    },
    '7yz74f3q': {
      'en': ' No evidence of damage/defect',
      'ar': '',
    },
    '7qqzbzk6': {
      'en': ' Return window expired',
      'ar': '',
    },
    'jrcpe6xj': {
      'en': 'Missing original packaging or accessories',
      'ar': '',
    },
    'f88rvmtz': {
      'en': 'Invalid reason for return',
      'ar': '',
    },
    'e9zutq2e': {
      'en': 'Policy violation',
      'ar': '',
    },
    'g5r3uera': {
      'en': 'Others',
      'ar': '',
    },
    'b67nmd19': {
      'en': 'Additional message for Rejection',
      'ar': 'سبب الرفض',
    },
    'e3nagykv': {
      'en': 'Provide more details if necessary...',
      'ar': 'تقديم المزيد من التفاصيل إذا لزم الأمر...',
    },
    'j9x8v6fw': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'cpfztx1i': {
      'en': 'Done',
      'ar': 'تم',
    },
  },
  // Coupon
  {
    'fazpic1f': {
      'en': 'View Details',
      'ar': '',
    },
    'cnl7ek2g': {
      'en': 'Create New Coupon',
      'ar': 'إنشاء قسيمة جديدة',
    },
    '879uos6v': {
      'en': 'Add New Promotion',
      'ar': 'إضافة عرض ترويجي جديد',
    },
  },
  // PickUpAddressAdd
  {
    'a6qz7uuv': {
      'en': 'PickUp Address Details',
      'ar': 'تحرير سريع',
    },
    'dd4n57td': {
      'en': 'Contact name',
      'ar': 'اسم جهة الاتصال',
    },
    'q0zib4se': {
      'en': '',
      'ar': '',
    },
    'qclhgxjw': {
      'en': 'Enter contact name',
      'ar': 'أدخل اسم جهة الاتصال',
    },
    'qyuslp1j': {
      'en': 'Contact phone',
      'ar': 'هاتف التواصل',
    },
    'ertg25bt': {
      'en': '',
      'ar': '',
    },
    'q437wnfa': {
      'en': 'Enter contact phone',
      'ar': 'أدخل هاتف التواصل',
    },
    'act2xga8': {
      'en': 'Street',
      'ar': 'الشارع',
    },
    'bnjpeih7': {
      'en': '',
      'ar': '',
    },
    '1xo2bm4q': {
      'en': 'Enter street',
      'ar': 'أدخل الشارع',
    },
    '4z4qifoa': {
      'en': 'City',
      'ar': 'المدينة',
    },
    'ocsmqafw': {
      'en': '',
      'ar': '',
    },
    'vmqah2pb': {
      'en': 'Enter your city',
      'ar': 'أدخل النص الخاص بك',
    },
    'nqi7otwh': {
      'en': 'Governorate',
      'ar': 'المحافظة',
    },
    'nof9hnbj': {
      'en': '',
      'ar': '',
    },
    '8y0x2hh9': {
      'en': 'Enter governorate',
      'ar': 'أدخل المحافظة',
    },
    'izgvz9bs': {
      'en': 'Country',
      'ar': 'الدولة',
    },
    'p5mvztz4': {
      'en': 'Select...',
      'ar': 'اختيار',
    },
    '9lyejw86': {
      'en': 'Search...',
      'ar': '',
    },
    'jj7l3wal': {
      'en': 'Building',
      'ar': 'المبنى',
    },
    'ozw9oh32': {
      'en': '',
      'ar': '',
    },
    '4jfhhusb': {
      'en': 'Enter building',
      'ar': 'أدخل المبنى',
    },
    'svaddrblk': {
      'en': 'Block',
      'ar': 'القطعة',
    },
    'svaddrblkh': {
      'en': 'Enter block',
      'ar': 'أدخل القطعة',
    },
    '6ce6jgbp': {
      'en': 'Map Location',
      'ar': 'الموقع علي الخريطة',
    },
    'pk0brogw': {
      'en': 'Contact name is required',
      'ar': '',
    },
    'w9jchib9': {
      'en': 'Minimum 2 characters are required',
      'ar': 'الحد الأدنى المطلوب هو حرفان',
    },
    'qj9deeld': {
      'en': 'Maximum 30 characters are required',
      'ar': 'الحد الأقصى المطلوب هو 30 حرفًا',
    },
    'lq7pevz9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5r4gge7t': {
      'en': 'Contact phone is required',
      'ar': '',
    },
    'alhr05qs': {
      'en': 'Please enter a valid mobile number.(GCC)',
      'ar': 'الرجاء إدخال رقم جوال صحيح. (GCC)',
    },
    'wqnmmu6v': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'b70a42t8': {
      'en': 'Street is required',
      'ar': '',
    },
    '567oemd0': {
      'en': 'Minimum 3 characters are required',
      'ar': 'الحد الأدنى المطلوب هو 3 أحرف',
    },
    'daedc84h': {
      'en': 'Maximum 250 characters are required',
      'ar': 'الحد الأقصى لعدد الأحرف هو 250 حرفًا',
    },
    '9ks1s8r5': {
      'en': 'Invalid address format.',
      'ar': 'تنسيق عنوان غير صالح.',
    },
    '6jm7qtea': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jh36447r': {
      'en': 'City is required',
      'ar': '',
    },
    '9zp6swzh': {
      'en': 'Minimum 2 characters are required',
      'ar': '',
    },
    '7ysjzdyo': {
      'en': 'Maximum 50 characters are required',
      'ar': 'الحد الأقصى المطلوب هو 50 حرفًا',
    },
    'naso4i63': {
      'en': 'Invalid city format.',
      'ar': '',
    },
    '9myhbw23': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '8wcfk7yw': {
      'en': 'Region  is required',
      'ar': '',
    },
    '9l6fppyl': {
      'en': 'Minimum 2 characters are required',
      'ar': '',
    },
    'z9id15z4': {
      'en': 'Maximum 50 characters are required',
      'ar': 'الحد الأقصى المطلوب هو 50 حرفًا',
    },
    'hzozors6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'kdcf430y': {
      'en': 'Country is required',
      'ar': '',
    },
    '9jty2tam': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '6jqdhx4m': {
      'en': 'Postal Code is required',
      'ar': '',
    },
    'z4ssnbc5': {
      'en': 'Invalid forrmat',
      'ar': '',
    },
    'dpszy3gj': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '9m98v3lc': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    '0dugh0uo': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // PickUpAddressEdit
  {
    '6t8o926f': {
      'en': 'PickUp Address Details',
      'ar': 'تحرير سريع',
    },
    'npyqduu0': {
      'en': 'Contact name',
      'ar': 'اسم جهة الاتصال',
    },
    'g2nwfyim': {
      'en': '',
      'ar': '',
    },
    'c5w0pa23': {
      'en': 'Enter contact name',
      'ar': 'أدخل اسم جهة الاتصال',
    },
    '5bqv64zn': {
      'en': 'Contact phone',
      'ar': 'هاتف التواصل',
    },
    '8dm26fl3': {
      'en': '',
      'ar': '',
    },
    'gcudb4m8': {
      'en': 'Enter contact phone',
      'ar': 'أدخل هاتف التواصل',
    },
    'hl43lc93': {
      'en': 'Street',
      'ar': 'الشارع',
    },
    'xy5ehs5u': {
      'en': '',
      'ar': '',
    },
    'olwp5iad': {
      'en': 'Enter street',
      'ar': 'أدخل الشارع',
    },
    'liagh04m': {
      'en': 'City',
      'ar': 'المدينة',
    },
    '8wzvac0y': {
      'en': '',
      'ar': '',
    },
    '253u1t1a': {
      'en': 'Enter your city',
      'ar': 'أدخل النص الخاص بك',
    },
    'ms4jdlub': {
      'en': 'Governorate',
      'ar': 'المحافظة',
    },
    'fs5xnn04': {
      'en': '',
      'ar': '',
    },
    'hg6ruy3s': {
      'en': 'Enter governorate',
      'ar': 'أدخل المحافظة',
    },
    'rfoijop1': {
      'en': 'Country',
      'ar': 'الدولة',
    },
    'm2elfjta': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    '9lyejw86': {
      'en': 'Search...',
      'ar': '',
    },
    'xmp52o2p': {
      'en': 'Building',
      'ar': 'المبنى',
    },
    '4vh6w3tk': {
      'en': '',
      'ar': '',
    },
    'xv791nvi': {
      'en': 'Enter building',
      'ar': 'أدخل المبنى',
    },
    'jhsefxxe': {
      'en': 'Map Location',
      'ar': 'الموقع علي الخريطة',
    },
    '90au1n4s': {
      'en': 'Contact name is required',
      'ar': 'اسم جهة الاتصال مطلوب',
    },
    'ullys7yv': {
      'en': 'Minimum 3 characters are required',
      'ar': 'الحد الأدنى المطلوب هو 3 أحرف',
    },
    '9r6g14bw': {
      'en': 'Maximum 30 characters are required',
      'ar': 'الحد الأقصى المطلوب هو 30 حرفًا',
    },
    '40s0rlbi': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'hs616f7h': {
      'en': 'Contact phone is required',
      'ar': 'هاتف التواصل مطلوب',
    },
    'y48wlijm': {
      'en': 'Please enter a valid mobile number.(GCC)',
      'ar': 'الرجاء إدخال رقم جوال صالح.(خليجي)',
    },
    'seqc3uqz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1brfhh1l': {
      'en': 'Street is required',
      'ar': 'الشارع مطلوب',
    },
    '8jiditsv': {
      'en': 'Minimum 3 characters are required',
      'ar': 'الحد الأدنى المطلوب هو 3 أحرف',
    },
    '1rkibh4d': {
      'en': 'Maximum 250 characters are required',
      'ar': 'الحد الأقصى المطلوب هو 250 حرفًا',
    },
    'xt72fiw2': {
      'en': 'Invalid address format.',
      'ar': 'تنسيق العنوان غير صالح.',
    },
    'ur969fdw': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'a4f12svx': {
      'en': 'City is required',
      'ar': 'المدينة مطلوبة',
    },
    'qqsfscbe': {
      'en': 'Minimum 2 characters are required',
      'ar': 'يجب أن يكون الحد الأدنى من الأحرف 2',
    },
    'j3podglh': {
      'en': 'Maximum 50 characters are required',
      'ar': 'الحد الأقصى المطلوب هو 50 حرفًا',
    },
    '0de7diou': {
      'en': 'Invalid city format.',
      'ar': '',
    },
    '4ja88i8p': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'e82pfs1l': {
      'en': 'Region is required.',
      'ar': 'المنطقة مطلوبة',
    },
    'hotzbekc': {
      'en': 'Minimum 2 characters are required',
      'ar': 'يجب أن يكون الحد الأدنى من الأحرف 2',
    },
    'ogstumje': {
      'en': 'Maximum 50 characters are required',
      'ar': 'الحد الأقصى المطلوب هو 50 حرفًا',
    },
    '31lbz9hq': {
      'en': 'Invalid region format',
      'ar': 'تنسيق المنطقة غير صالح',
    },
    'so5pfj8m': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '56rjsq5f': {
      'en': 'Postal code is required',
      'ar': 'الرمز البريدي مطلوب',
    },
    'bgc7ub2f': {
      'en': 'Invalid input',
      'ar': 'إدخال غير صالح',
    },
    'qr5k2vec': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'lenjhmke': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'fi5nhluy': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // DeliveryPartner-Add
  {
    'pwnflz9e': {
      'en': 'Add Delivery Partner',
      'ar': 'إضافة شريك التوصيل',
    },
    'v5v2a9jo': {
      'en': ' Name',
      'ar': '',
    },
    'f1hxajde': {
      'en': '*',
      'ar': '',
    },
    '7ekztiya': {
      'en': ' Name',
      'ar': ' الاسم',
    },
    'j8tarp4o': {
      'en': 'Name',
      'ar': ' الاسم',
    },
    'tolmppvg': {
      'en': 'Email',
      'ar': '',
    },
    'q2u004am': {
      'en': '*',
      'ar': '',
    },
    's062jmvd': {
      'en': 'Email',
      'ar': 'البريد إلكتروني',
    },
    '5jzwgztb': {
      'en': 'Email',
      'ar': 'البريد إلكتروني',
    },
    'e2ff7xbp': {
      'en': 'Password',
      'ar': '',
    },
    'dp2ncpvx': {
      'en': '*',
      'ar': '',
    },
    'ni5x2axl': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '24njpfps': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'zcx9g280': {
      'en': 'Status',
      'ar': '',
    },
    '1px3lac3': {
      'en': '*',
      'ar': '',
    },
    't7j4uyib': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    '7mg5sl4l': {
      'en': 'active',
      'ar': 'نشيط',
    },
    'p3ck61ep': {
      'en': 'Select...',
      'ar': 'يختار...',
    },
    '05qzj17v': {
      'en': 'Search...',
      'ar': '',
    },
    'deobnfhh': {
      'en': 'active',
      'ar': '',
    },
    'ohdd2aqa': {
      'en': 'archived',
      'ar': 'archived',
    },
    '892pc4bt': {
      'en': 'Name is required',
      'ar': '',
    },
    't16xggjh': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'uwb2px4c': {
      'en': 'Email is required',
      'ar': '',
    },
    'kz4ydirb': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'r620mhh7': {
      'en': 'Password is required',
      'ar': '',
    },
    '9w1e9ldn': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '4yluhc8p': {
      'en': 'Create Delivery Partner Account',
      'ar': 'إنشاء حساب شريك التوصيل',
    },
  },
  // DeliveryPartner-Edit
  {
    'sl3cy842': {
      'en': 'Edit Delivery Partner',
      'ar': 'تعديل شريك التسليم',
    },
    '1be24a6y': {
      'en': ' Name',
      'ar': 'الاسم',
    },
    't1uqwb77': {
      'en': 'Name',
      'ar': '',
    },
    'givn9m8s': {
      'en': 'Email',
      'ar': 'البريد إلكتروني',
    },
    '0kgufilk': {
      'en': 'Email',
      'ar': 'البريد إلكتروني',
    },
    'yv5pmkxv': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '2xi0xzrv': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '5bkv5mk2': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'e6g5atob': {
      'en': 'Select...',
      'ar': 'اختيار',
    },
    'ru6miolv': {
      'en': 'Search...',
      'ar': '',
    },
    'ysic66v7': {
      'en': 'active',
      'ar': '',
    },
    '6maz2nci': {
      'en': 'archived',
      'ar': '',
    },
    '13lu1pb2': {
      'en': 'Name is required',
      'ar': '',
    },
    'guy0ykdl': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ac17r1mc': {
      'en': 'Email is required',
      'ar': '',
    },
    'xf130jpr': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'wryuc7eb': {
      'en': 'Password is required',
      'ar': '',
    },
    '1tq9qcws': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'zu7uhrs6': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // home_setting_banner_add
  {
    'r0dr1dxs': {
      'en': 'Add Banner',
      'ar': 'أضف بانر',
    },
    'i097msnj': {
      'en': 'Title',
      'ar': 'العنوان',
    },
    'hxf76ppz': {
      'en': 'Enter Name ',
      'ar': '',
    },
    'b1rxko5k': {
      'en': 'Subtitle',
      'ar': 'الترجمة الفرعية',
    },
    'vas14dyx': {
      'en': 'Enter Subtitle',
      'ar': '',
    },
    'ymxj78hs': {
      'en': 'Upload Photo',
      'ar': 'تحميل صورة',
    },
    'f0j9v67o': {
      'en': 'Upload',
      'ar': '',
    },
    '820q3si9': {
      'en': 'Title is required',
      'ar': '',
    },
    'fhqznoxx': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'zzo32h4p': {
      'en': 'Subtitle is Required',
      'ar': '',
    },
    '72wiv5jw': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '85nc7zdc': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // home_setting_banner_edit
  {
    'cnnxzxpp': {
      'en': 'Edit Banner',
      'ar': 'تعديل الشعار',
    },
    'fv3q9lw8': {
      'en': 'Title',
      'ar': 'العنوان',
    },
    'ssaxsgtp': {
      'en': 'Enter Name ',
      'ar': '',
    },
    'ka9frs7z': {
      'en': 'Subtitle',
      'ar': 'الترجمة الفرعية',
    },
    'j2rxy7ev': {
      'en': 'Enter Subtitle',
      'ar': '',
    },
    'u0r7ju1o': {
      'en': 'Upload Photo',
      'ar': 'تحميل صورة',
    },
    'vjxjzisi': {
      'en': 'Upload',
      'ar': 'رفع',
    },
    '6b8wbesp': {
      'en': 'Title is required',
      'ar': '',
    },
    'y6qbn6ze': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'j2rwozfk': {
      'en': 'Subtitle is required',
      'ar': '',
    },
    'fkwgsoad': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'r5tc9j8g': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // TryonAdd
  {
    'lfr63ew4': {
      'en': 'Add Credit Pack',
      'ar': 'إضافة حزمة الائتمان',
    },
    'wijpnzd4': {
      'en': 'Pack Name',
      'ar': 'اسم الحزمة',
    },
    'o85b7uh7': {
      'en': '',
      'ar': '',
    },
    '1oiuyixh': {
      'en': 'Enter Pack Name',
      'ar': 'أدخل اسم الحزمة',
    },
    'akagnf47': {
      'en': 'Number of Credits',
      'ar': 'رمز المنتج',
    },
    'ig48mfl0': {
      'en': '',
      'ar': '',
    },
    '8i7b5nkg': {
      'en': 'Enter Number of Credits',
      'ar': 'أدخل عدد الساعات المعتمدة',
    },
    '60tz3oel': {
      'en': 'Price (KD)',
      'ar': 'السعر (دينار كويتي)',
    },
    '2po1micp': {
      'en': '',
      'ar': '',
    },
    'a1yxavwa': {
      'en': 'Enter Price (KD)',
      'ar': 'أدخل السعر (دينار كويتي)',
    },
    'rwre8lt5': {
      'en': 'name is required',
      'ar': 'الاسم مطلوب',
    },
    'ggyzn1uv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5oz8ino0': {
      'en': 'credits is required',
      'ar': 'يُشترط الحصول على الاعتمادات',
    },
    'opz7e06l': {
      'en': 'Credit  must be greater than zero',
      'ar': 'يجب أن يكون الرصيد أكبر من الصفر',
    },
    'hkqq8vt1': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'gtteb8ck': {
      'en': 'price is required',
      'ar': 'السعر مطلوب',
    },
    'pi87sbgk': {
      'en': 'Price  must be greater than zero',
      'ar': 'يجب أن يكون السعر أكبر من الصفر',
    },
    'blosnh70': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'my0kac8p': {
      'en': 'Save Pack',
      'ar': 'حفظ الحزمة',
    },
  },
  // TryonAddCopy
  {
    '3yxtn8by': {
      'en': 'Add / Edit Credit Pack',
      'ar': 'تحرير سريع',
    },
    'oxomn6st': {
      'en': 'Pack Name',
      'ar': 'عنوان',
    },
    '2pcp95i1': {
      'en': '',
      'ar': '',
    },
    'wivkskhw': {
      'en': 'Number of Credits',
      'ar': 'رمز المنتج',
    },
    'qnh2cchm': {
      'en': '',
      'ar': '',
    },
    'w7297sy1': {
      'en': 'Price (KD)',
      'ar': 'سعر',
    },
    'z5axm9ve': {
      'en': '',
      'ar': '',
    },
    'b672qqf1': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'wiht9tqv': {
      'en': 'Select',
      'ar': '',
    },
    'o7u8xcom': {
      'en': 'Search...',
      'ar': '',
    },
    'jw53qrw1': {
      'en': 'Active ',
      'ar': '',
    },
    '9ygbc3g7': {
      'en': 'Option 2',
      'ar': '',
    },
    'iqr0f202': {
      'en': 'Option 3',
      'ar': '',
    },
    'l1np6js2': {
      'en': 'Label/Tag (optional)',
      'ar': 'مخزون',
    },
    '18p0kph7': {
      'en': '',
      'ar': '',
    },
    'xe586p6g': {
      'en': 'name is required',
      'ar': '',
    },
    '2dmjq2n2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '7ye7y8hk': {
      'en': 'product_sku is required',
      'ar': '',
    },
    'ylaccysz': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    't08yov3u': {
      'en': 'product_price is required',
      'ar': '',
    },
    'pxz0ev6h': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'idsgebxb': {
      'en': 'product_regular_price is required',
      'ar': '',
    },
    'won4ogxc': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    't2czpai1': {
      'en': 'product_quantity is required',
      'ar': '',
    },
    'gbnb6fx6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'bic6lnsp': {
      'en': 'Delete',
      'ar': 'مسح',
    },
    'tvbijmrw': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    '1bes1dvb': {
      'en': 'Save Pack',
      'ar': 'حفظ الحزمة',
    },
  },
  // TryonEdit
  {
    'y5phro7b': {
      'en': 'Edit Credit Pack',
      'ar': 'تعديل حزمة الائتمان',
    },
    'rk8v1xr7': {
      'en': 'Pack Name',
      'ar': 'اسم الحزمة',
    },
    '5vs2d60k': {
      'en': '',
      'ar': '',
    },
    'w2r05t1f': {
      'en': 'Enter Pack Name',
      'ar': 'أدخل عدد الساعات المعتمدة',
    },
    'l2v67cr3': {
      'en': 'Number of Credits',
      'ar': 'عدد الاعتمادات',
    },
    'vwtdxqhh': {
      'en': '',
      'ar': '',
    },
    'cbxq7w2q': {
      'en': 'Enter Number of Credits',
      'ar': 'أدخل عدد الساعات المعتمدة',
    },
    '4bs79lt1': {
      'en': 'Price (KD)',
      'ar': 'السعر (دينار كويتي)',
    },
    'bv540ub4': {
      'en': '',
      'ar': '',
    },
    'bs9lpk96': {
      'en': 'Enter Price (KD)',
      'ar': 'أدخل السعر (دينار كويتي)',
    },
    'uvnsk5u2': {
      'en': 'name is required',
      'ar': 'الاسم مطلوب',
    },
    '31g40l2y': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'keoctu0g': {
      'en': 'credits is required',
      'ar': 'يُشترط الحصول على الاعتمادات',
    },
    'w4ouuf2j': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'wekisb47': {
      'en': 'price is required',
      'ar': 'السعر مطلوب',
    },
    '61ufpfq2': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'vfih4s39': {
      'en': 'Delete',
      'ar': 'مسح',
    },
    'dq1akp89': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // edit-coupon
  {
    '7yeux4kk': {
      'en': 'Edit Coupon',
      'ar': 'تعديل القسيمة',
    },
    '69hn0s6y': {
      'en':
          'Edit an existing coupon’s details such as code, discount, and validity.\nKeep your offers accurate and up to date.',
      'ar':
          'عدّل تفاصيل قسيمة حالية، مثل الرمز والخصم ومدة الصلاحية. حافظ على دقة عروضك وتحديثها باستمرار.',
    },
    '96xcwhxq': {
      'en': 'Coupon Code',
      'ar': 'كود القسيمة',
    },
    'hm8a7wn2': {
      'en': '',
      'ar': '',
    },
    'l677lmym': {
      'en': '(e.g., AZYS30)',
      'ar': '(على سبيل المثال، AZYS30)',
    },
    'lkp38qth': {
      'en': 'Discount Type',
      'ar': 'نوع الخصم',
    },
    'xl44hyxr': {
      'en': '',
      'ar': 'يختار...',
    },
    'rfb719a2': {
      'en': 'Search...',
      'ar': '',
    },
    'zcmhi3j0': {
      'en': 'Percentage',
      'ar': '',
    },
    '2ixkq7bd': {
      'en': 'Amount',
      'ar': '',
    },
    '35rvlsnp': {
      'en': 'Discount Value',
      'ar': 'قيمة الخصم',
    },
    'k1umvsyr': {
      'en': '',
      'ar': '',
    },
    'wx4uq1qb': {
      'en': 'Discount value',
      'ar': '',
    },
    '1na4vsiz': {
      'en': '(e.g., 30% or 10 KD)',
      'ar': '(على سبيل المثال، 30% أو 10 د.ك)',
    },
    '5vrui7r5': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'x8o00l9h': {
      'en': '',
      'ar': 'يختار...',
    },
    'yqp3xeam': {
      'en': 'Search...',
      'ar': '',
    },
    'pzkbygs7': {
      'en': 'Active',
      'ar': 'نشط',
    },
    'rcory3v3': {
      'en': 'Archived',
      'ar': 'مؤرشف',
    },
    'asdc3kod': {
      'en': ' ',
      'ar': '(على سبيل المثال، AZYS30)',
    },
    'luqzh04c': {
      'en': 'Target Audience',
      'ar': 'الجمهور المستهدف',
    },
    'hkgwbhdp': {
      'en': '',
      'ar': 'يختار...',
    },
    'onmv38e3': {
      'en': 'Search...',
      'ar': '',
    },
    'jdpdal35': {
      'en': 'Customer',
      'ar': '',
    },
    '1658mnbd': {
      'en': 'Creator',
      'ar': '',
    },
    'td3fa4ql': {
      'en': 'Designer',
      'ar': '',
    },
    '358tmvys': {
      'en': 'Total Usage Limit',
      'ar': 'حد الاستخدام الإجمالي',
    },
    'efysxv17': {
      'en': '',
      'ar': '',
    },
    'qq16qxpg': {
      'en': '1000',
      'ar': '',
    },
    'f9ziwcpm': {
      'en': '(e.g., 1000  users)',
      'ar': '(على سبيل المثال، 1000 مستخدم)',
    },
    '6x7z0788': {
      'en': 'Upload Coupon Image',
      'ar': '',
    },
    'cg93oce5': {
      'en': 'Click or drop image',
      'ar': 'انقر لتحديد الصورة',
    },
    '82glsbae': {
      'en': 'Minimum Order Amount',
      'ar': 'الحد الأدنى لمبلغ الطلب',
    },
    'hvbwskp6': {
      'en': '',
      'ar': '',
    },
    '6kxp62gt': {
      'en': 'Enter minimum order (KD)',
      'ar': '',
    },
    '079z8inh': {
      'en': 'Max Discount Cap',
      'ar': 'الحد الأقصى للخصم',
    },
    'sfmnncpo': {
      'en': '',
      'ar': '',
    },
    'tn9lu7ey': {
      'en': 'Enter max discount amount',
      'ar': '',
    },
    'uo611laj': {
      'en': 'Coupon Short Description',
      'ar': 'وصف القسيمة',
    },
    'mu4ijo4h': {
      'en': '',
      'ar': '',
    },
    '20rzlgth': {
      'en': 'Short internal note about coupon usage',
      'ar': '',
    },
    'cgf8gtm6': {
      'en': 'Coupon Description',
      'ar': 'وصف القسيمة',
    },
    'vfr26q4t': {
      'en': '',
      'ar': '',
    },
    'flvhgpf5': {
      'en': 'Short description note about coupon usage',
      'ar': 'ملاحظة وصفية مختصرة حول استخدام القسيمة',
    },
    'j68aes9i': {
      'en': 'Valid From',
      'ar': 'بيانات اعتماد الاختبار',
    },
    'j31y7f6q': {
      'en': 'Valid To',
      'ar': 'صالحة ل',
    },
    'nm0mje2o': {
      'en': 'coupon_value is required',
      'ar': '',
    },
    'duqo29of': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'l52c1wy8': {
      'en': 'Discount Value is required',
      'ar': '',
    },
    'cvghe033': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1ya9c9fo': {
      'en': 'Minimum order amount is required',
      'ar': '',
    },
    'jr0sijyf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'h9y0pmb4': {
      'en': 'coupon_maximum_discount is required',
      'ar': '',
    },
    'q6rwa2sj': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1g861yb8': {
      'en': 'main_description is required',
      'ar': '',
    },
    'pbmm5bks': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'otkid184': {
      'en': 'coupon limit is required',
      'ar': '',
    },
    'upy20ccw': {
      'en': 'Delete',
      'ar': 'مسح',
    },
    'nu6m2h70': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'q2h0uxa0': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // Custom-Promotion-view
  {
    'awovrtx0': {
      'en': ' • ',
      'ar': '',
    },
    'a156qni9': {
      'en': 'Product Preview',
      'ar': '',
    },
    '9df9vjsk': {
      'en': 'Products Info',
      'ar': '',
    },
    'kxyxfhmh': {
      'en': 'Product Name',
      'ar': '',
    },
    'pslpthf3': {
      'en':
          'A best-selling outfit made from sustainable fabric with a modern design touch.',
      'ar': '',
    },
    'hqgvmh9z': {
      'en': 'Category',
      'ar': '',
    },
    '8g8dshtl': {
      'en': 'Active',
      'ar': '',
    },
    '0mi4r0zf': {
      'en': 'Formal Wear',
      'ar': '',
    },
    'yh3hd05o': {
      'en': ' ',
      'ar': '',
    },
    'gzck1gye': {
      'en': 'ID: ',
      'ar': '',
    },
    'fmh0krm0': {
      'en': 'https://instagram.com/loislane',
      'ar': '',
    },
    '0awblynu': {
      'en': '150',
      'ar': '',
    },
    'se3x3djs': {
      'en': ' KD',
      'ar': '',
    },
    'km8f9oq0': {
      'en': 'Hello World',
      'ar': '',
    },
    'yjqdebnr': {
      'en': '4.8',
      'ar': '',
    },
    'nxnj7xj3': {
      'en': '(87)',
      'ar': '',
    },
    't7d382w9': {
      'en': '1,360',
      'ar': '',
    },
    'fynj8wvg': {
      'en': ' Sales',
      'ar': '',
    },
    'os6casna': {
      'en': '37.8',
      'ar': '',
    },
    'zlbjj297': {
      'en': '%',
      'ar': '',
    },
    'v0v9brcn': {
      'en': 'Price',
      'ar': '',
    },
    '9hohb036': {
      'en': 'SKU',
      'ar': '',
    },
    'ksisayok': {
      'en': '200',
      'ar': '',
    },
    'zx75ors9': {
      'en': 'Creator Submission',
      'ar': '',
    },
    'izcuq9ul': {
      'en': 'Creator Name',
      'ar': '',
    },
    'zetbtwj4': {
      'en': 'Carol Danvers',
      'ar': '',
    },
    'vzgse5s6': {
      'en': 'Promotion Caption',
      'ar': '',
    },
    'cs2ddhhb': {
      'en': 'Description',
      'ar': '',
    },
    'm8uuu9y4': {
      'en': 'SKU',
      'ar': '',
    },
    'unfj07fz': {
      'en': 'Designer Price',
      'ar': '',
    },
    'f2bu8dcj': {
      'en': 'Azyaa Commission ',
      'ar': '',
    },
    'ogbw4vhx': {
      'en': 'Total Price',
      'ar': '',
    },
    'ta5x8b46': {
      'en': 'LUX-GOWN-2024',
      'ar': '',
    },
    'ptlj1cfo': {
      'en': '84 KD',
      'ar': '',
    },
    '5oyn8kji': {
      'en': '100 KD',
      'ar': '',
    },
    '1ozvkjw6': {
      'en': 'Message Creator',
      'ar': '',
    },
    '1c383be5': {
      'en': 'Reject',
      'ar': '',
    },
    '5lqkchij': {
      'en': 'Approve',
      'ar': '',
    },
    'graoewea': {
      'en': 'Cancel',
      'ar': '',
    },
    'd7v5jbmk': {
      'en': 'Edit',
      'ar': '',
    },
  },
  // Contract-add
  {
    '6ljrqg4p': {
      'en': 'Add Contract',
      'ar': 'إضافة طلب جديد',
    },
    'ypatamju': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    'w7rmuxvm': {
      'en': 'Contract Type',
      'ar': 'اختر المنتج',
    },
    'myyb8lv3': {
      'en': 'Gold',
      'ar': 'Gold',
    },
    'phpjuwa3': {
      'en': 'Select...',
      'ar': 'اختر المنتج',
    },
    'zwo62432': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'wjao1sof': {
      'en': 'Gold',
      'ar': 'Gold',
    },
    'y0usb9wl': {
      'en': 'Silver',
      'ar': 'Silver',
    },
    'hv08yb5m': {
      'en': 'Start Date',
      'ar': 'تاريخ البدء',
    },
    'y9o4o79b': {
      'en': '',
      'ar': '',
    },
    'v60g9ysa': {
      'en': 'End Date',
      'ar': 'تاريخ الانتهاء',
    },
    'i5s8czmx': {
      'en': '',
      'ar': '',
    },
    'ikj5pnjo': {
      'en': 'product_quantity is required',
      'ar': '',
    },
    '86qgmhx0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'n3n3dbjn': {
      'en': 'Field is required',
      'ar': '',
    },
    'wty1wa3h': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '2k7t8fzj': {
      'en':
          'Urgent restock for weekend promo. Deliver to Warehouse. is required',
      'ar': '',
    },
    'dpl2epr6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '8vw43h1a': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    '44iet4yq': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // ReadytoPickup
  {
    '52fpsgdx': {
      'en': 'Ready To Pickup',
      'ar': 'طلب إعادة التخزين لـ',
    },
    '2nvkcfct': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    'kbj9qz59': {
      'en': 'Product Name',
      'ar': 'اسم المنتج',
    },
    'm7pz0lqm': {
      'en': 'In-hand Stock',
      'ar': 'رمز المنتج',
    },
    'y35569mm': {
      'en': 'Product ID',
      'ar': 'معرف المنتج',
    },
    '0caf3788': {
      'en': 'Status',
      'ar': 'الحالة',
    },
    'g7xhlrva': {
      'en': 'Pending',
      'ar': '',
    },
    '576z26oi': {
      'en': 'Request Date',
      'ar': 'تاريخ الطلب',
    },
    '08hu0wra': {
      'en': 'Quantity',
      'ar': 'الكمية',
    },
    'qq05vcbr': {
      'en': '',
      'ar': '',
    },
    'twck2wyw': {
      'en': '1',
      'ar': 'أدخل النص الخاص بك',
    },
    's5ir9mdc': {
      'en': 'Weight of each item',
      'ar': 'كمية',
    },
    'zzt33dw2': {
      'en': '10.0',
      'ar': '',
    },
    'n32p489i': {
      'en': 'gm',
      'ar': 'جنرال موتورز',
    },
    'e4vllznh': {
      'en': 'gm',
      'ar': '',
    },
    '6w7p9yao': {
      'en': 'Search...',
      'ar': '',
    },
    'gcjbpalc': {
      'en': 'kg',
      'ar': 'كجم',
    },
    'r79ux00s': {
      'en': 'gm',
      'ar': 'جنرال موتورز',
    },
    'eh4yzef9': {
      'en': 'Package Count ',
      'ar': 'كمية',
    },
    '1xfoxrph': {
      'en': '',
      'ar': '',
    },
    'ncf5lyqj': {
      'en': '1',
      'ar': 'أدخل النص الخاص بك',
    },
    'ja1xpow7': {
      'en': 'Preferred Date',
      'ar': 'تاريخ الوصول المتوقع المفضل',
    },
    'amy2ja6h': {
      'en': '',
      'ar': '',
    },
    'dlum266r': {
      'en': '  May 27, 2025',
      'ar': 'أدخل النص الخاص بك',
    },
    'khx5xykl': {
      'en': 'Notes',
      'ar': 'ملحوظات',
    },
    'bikad3zd': {
      'en': '',
      'ar': '',
    },
    'pkv7n7de': {
      'en': 'Urgent restock for weekend promo. Deliver to Warehouse.',
      'ar': 'تجديد مخزون عاجل لعروض نهاية الأسبوع. التوصيل  إلى المستودع.',
    },
    'vrk5u2le': {
      'en': 'Weoght of each item is required',
      'ar': '',
    },
    'bbadsxib': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'eoltye64': {
      'en': 'Package count is required',
      'ar': '',
    },
    'cvghe033': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'merkmw8u': {
      'en': '  May 27, 2025 is required',
      'ar': '',
    },
    'hpn2ljj3': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'clzt6u83': {
      'en': 'admin_notes is required',
      'ar': '',
    },
    'fxinqi3u': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'n2dh9a4g': {
      'en': 'Delete',
      'ar': 'مسح',
    },
    '97q1ogen': {
      'en': 'Cancel',
      'ar': 'الغاء ',
    },
    'y53k8yxa': {
      'en': 'Request Pickup',
      'ar': 'طلب تعديل',
    },
  },
  // ProductShippingDetails
  {
    '80b2vlqw': {
      'en': 'Create Shipping Order',
      'ar': 'طلب إعادة التخزين لـ',
    },
    'd4osirzt': {
      'en': ' for logistics',
      'ar': '',
    },
    'z3csiu14': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    '912ifs28': {
      'en': 'Delivery Instructions',
      'ar': '',
    },
    '3akhz1z8': {
      'en': 'First customer and order!',
      'ar': '',
    },
    'bc7qlku9': {
      'en': '',
      'ar': '',
    },
    'yqe93djl': {
      'en': 'First customer and order!',
      'ar': '',
    },
    'mpk9sdni': {
      'en': 'Shipping address',
      'ar': '',
    },
    'vzfgncao': {
      'en': 'Emma Williams',
      'ar': '',
    },
    'ag2hizin': {
      'en': 'Kuwait City, Dubai, Riyadh',
      'ar': '',
    },
    'q55xesh2': {
      'en': 'Pickup address',
      'ar': '',
    },
    'g7le2gir': {
      'en': 'Drop address',
      'ar': '',
    },
    'psmwvejn': {
      'en': 'Selected by customer',
      'ar': '',
    },
    'ou9482l3': {
      'en': 'Free shipping',
      'ar': '',
    },
    '9w96rmbn': {
      'en': 'KWD 0.00',
      'ar': '',
    },
    'rboatwz5': {
      'en': 'Shipping service',
      'ar': '',
    },
    'nh5arxhv': {
      'en': 'Sort by ',
      'ar': '',
    },
    'xcceuayl': {
      'en': '40.00 KWD',
      'ar': '',
    },
    'xfpphxyl': {
      'en': 'FedEx Home Delivery® by Shippo',
      'ar': '',
    },
    'mz4mtdl0': {
      'en': 'KWD 10.00',
      'ar': '',
    },
    '4pzxctzb': {
      'en': 'Including insurance (up to KWD 100.00), tracking',
      'ar': '',
    },
    'k4xczitp': {
      'en': '1 business day',
      'ar': '',
    },
    '18tarnpb': {
      'en': 'Item',
      'ar': '',
    },
    'p09x3gnt': {
      'en': 'Edit weight',
      'ar': '',
    },
    'hhu0135r': {
      'en': 'White',
      'ar': '',
    },
    'kg6mcpid': {
      'en': ' / ',
      'ar': '',
    },
    'h9jq4wwh': {
      'en': 'XS ',
      'ar': '',
    },
    '46fyar5j': {
      'en': 'Urban Style Dress ',
      'ar': '',
    },
    'u7rfiowr': {
      'en': 'Quantity',
      'ar': '',
    },
    'zl5txp7k': {
      'en': '1',
      'ar': '',
    },
    'lf416dld': {
      'en': ' of ',
      'ar': '',
    },
    'og6kyw54': {
      'en': '1',
      'ar': '',
    },
    'zhizwfuf': {
      'en': '40.00 KWD',
      'ar': '',
    },
    'lvfk8k9h': {
      'en': 'Package and weight',
      'ar': '',
    },
    '8xu4ppq9': {
      'en': 'Add package',
      'ar': '',
    },
    'chnbk9f7': {
      'en': 'Select Package and weight',
      'ar': '',
    },
    '5enfl1lg': {
      'en': 'Collapsed body text',
      'ar': '',
    },
    'dos629mg': {
      'en': 'Expanded body text',
      'ar': '',
    },
    'u3iw8mqv': {
      'en': 'Each Item Weight',
      'ar': '',
    },
    '5wgr1ule': {
      'en': 'TextField',
      'ar': '',
    },
    'eny7orne': {
      'en': 'gm',
      'ar': '',
    },
    'x8s0bxhz': {
      'en': 'Search...',
      'ar': '',
    },
    'mprdmsmx': {
      'en': 'kg',
      'ar': 'كجم',
    },
    'lw34els7': {
      'en': 'gm',
      'ar': 'جنرال موتورز',
    },
    'd77kcd9d': {
      'en': 'Total Weight',
      'ar': '',
    },
    'hhdw9ij7': {
      'en': 'TextField',
      'ar': '',
    },
    's6mno8hi': {
      'en': 'gm',
      'ar': '',
    },
    '854ycnyu': {
      'en': 'Search...',
      'ar': '',
    },
    '76krpaqo': {
      'en': 'kg',
      'ar': 'كجم',
    },
    'aaomozip': {
      'en': 'gm',
      'ar': 'جنرال موتورز',
    },
    '4klbsbeg': {
      'en': 'Package Count',
      'ar': '',
    },
    '0ejaqwki': {
      'en': 'TextField',
      'ar': '',
    },
    'vwfswuh6': {
      'en': 'Create shipping order',
      'ar': '',
    },
    'eo3frxry': {
      'en': 'check json',
      'ar': '',
    },
    'udfhkfet': {
      'en': 'Summary',
      'ar': '',
    },
    '5d2n4sr2': {
      'en': 'Subtotal',
      'ar': '',
    },
    'sx8s5jx3': {
      'en': 'KWD 20.00',
      'ar': '',
    },
    '6uazgtp5': {
      'en': 'Azyaa plan discount ',
      'ar': '',
    },
    'f9fgy4ce': {
      'en': 'KWD 20.00',
      'ar': '',
    },
    'eckdwqiq': {
      'en': 'Total',
      'ar': '',
    },
    'w704984a': {
      'en': 'KWD 20.00',
      'ar': '',
    },
    'ofjnu322': {
      'en': 'Shipping date',
      'ar': '',
    },
    '11vaw2t2': {
      'en': 'Today',
      'ar': '',
    },
    'l28triul': {
      'en': 'Collapsed body text',
      'ar': '',
    },
    'j0dtsdtn': {
      'en': 'Expanded body text',
      'ar': '',
    },
    '2t324atl': {
      'en': 'Send a ',
      'ar': '',
    },
    'hig93hi6': {
      'en': 'shipping information',
      'ar': '',
    },
    'fdpumjv6': {
      'en': ' to the customer now.',
      'ar': '',
    },
    'wt417ifw': {
      'en': 'Shipping date',
      'ar': '',
    },
    'gksg1rdi': {
      'en': 'By buying this Azyaa shipping label, I agree to the ',
      'ar': '',
    },
    'bz1xha2h': {
      'en': 'terms of services ',
      'ar': '',
    },
    '46vwe36s': {
      'en': 'Shipping date',
      'ar': '',
    },
  },
  // Location
  {
    '6c2gwft9': {
      'en': 'Address Details',
      'ar': 'تحرير سريع',
    },
    'xtjljdsh': {
      'en': 'Map Location',
      'ar': 'مخزون',
    },
    '2jne64m2': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'qowf4uik': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // timeline_for_inventory
  {
    '0y6axoyq': {
      'en': 'Shipping Timeline',
      'ar': 'تتبع الطلب',
    },
    'qdi3ur03': {
      'en': ' : ',
      'ar': '',
    },
  },
  // weightcomp
  {
    'axqaatsj': {
      'en': '500',
      'ar': '',
    },
    '3un8m9q2': {
      'en': 'gm',
      'ar': '',
    },
    '9304zd4q': {
      'en': 'gm',
      'ar': '',
    },
    '48tdc52o': {
      'en': 'Search...',
      'ar': '',
    },
    'asx3omwb': {
      'en': 'gm',
      'ar': '',
    },
    'lvdrp37m': {
      'en': 'kg',
      'ar': '',
    },
  },
  // Edit-Personal-Info
  {
    'xdlti151': {
      'en': 'Edit Personal Info',
      'ar': 'تحرير سريع',
    },
    'ksfp6kcl': {
      'en': 'Name',
      'ar': 'الاسم',
    },
    'b1ewh4jn': {
      'en': '',
      'ar': '',
    },
    '57yv80j2': {
      'en': 'Enter  your name',
      'ar': 'أدخل النص الخاص بك',
    },
    '42qn11x9': {
      'en': 'Phone No',
      'ar': 'رمز المنتج',
    },
    'lwu2amso': {
      'en': '',
      'ar': '',
    },
    '2jbbx8jv': {
      'en': 'Enter  your phone number',
      'ar': 'أدخل النص الخاص بك',
    },
    'w7i30n8p': {
      'en': 'Location / City',
      'ar': 'سعر',
    },
    'rxrz3dgh': {
      'en': '',
      'ar': '',
    },
    'xtehblhr': {
      'en': 'Enter your location/city',
      'ar': 'أدخل النص الخاص بك',
    },
    'xoulvjw6': {
      'en': 'Email',
      'ar': 'البريد إلكتروني',
    },
    'dx38b90t': {
      'en': '',
      'ar': '',
    },
    'quq8vos1': {
      'en': 'Enter your email',
      'ar': 'أدخل النص الخاص بك',
    },
    'qyt76ppi': {
      'en': 'Name is required',
      'ar': 'الاسم مطلوب',
    },
    'lc9w8fhe': {
      'en': 'Minimum 2 characters are required',
      'ar': 'يجب أن يكون الحد الأدنى من الأحرف 2',
    },
    'i0gtdgtr': {
      'en': 'Maximum 50 characters are required',
      'ar': 'الحد الأقصى المطلوب هو 50 حرفًا',
    },
    'vyfjmo49': {
      'en': 'Invalid name format',
      'ar': 'تنسيق الاسم غير صالح',
    },
    '74q3pbrq': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'bgyk47hj': {
      'en': 'Phone number is required',
      'ar': 'رقم الهاتف مطلوب',
    },
    'nqu8cqso': {
      'en': 'Please enter a valid  mobile number(GCC)',
      'ar': 'الرجاء إدخال رقم جوال صالح (GCC)',
    },
    'awlmvr0q': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'i3t3ri9s': {
      'en': 'Location/City is required',
      'ar': 'الموقع/المدينة مطلوبة',
    },
    'fmy2ls0z': {
      'en': 'Minimum 2 characters are required',
      'ar': 'يجب أن يكون الحد الأدنى من الأحرف 2',
    },
    'shkfmfn3': {
      'en': 'Maximum 50 characters are required',
      'ar': 'الحد الأقصى المطلوب هو 50 حرفًا',
    },
    'frmlsynl': {
      'en': 'Invalid format',
      'ar': 'تنسيق غير صالح',
    },
    'b1m2ktox': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5ldhnxnx': {
      'en': 'Email is required.',
      'ar': 'البريد الإلكتروني مطلوب.',
    },
    'uwmr3krt': {
      'en': 'Invalid email format.',
      'ar': 'تنسيق البريد الإلكتروني غير صالح.',
    },
    'csbciccx': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jfzcxtuq': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'ww6qvy2u': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // Edit-bank-details
  {
    'mp9t1kan': {
      'en': 'Edit Bank Details',
      'ar': 'تحرير سريع',
    },
    'kzjdlpka': {
      'en': 'Bank Name',
      'ar': 'عنوان',
    },
    '29q5g60d': {
      'en': '',
      'ar': '',
    },
    'zlt9593i': {
      'en': 'Enter  your Bank Name',
      'ar': 'أدخل النص الخاص بك',
    },
    'a1ile1j7': {
      'en': 'Account Holder',
      'ar': 'رمز المنتج',
    },
    '6htdqhde': {
      'en': '',
      'ar': '',
    },
    'dc5mwaiz': {
      'en': 'Enter  your Account Holder Name',
      'ar': 'أدخل النص الخاص بك',
    },
    'cvowjuus': {
      'en': 'Account Number',
      'ar': 'سعر',
    },
    'bhcq0e65': {
      'en': '',
      'ar': '',
    },
    'fz6pyfe9': {
      'en': 'Enter Account Number',
      'ar': 'أدخل النص الخاص بك',
    },
    'rmck9qfr': {
      'en': 'IBAN/IFSC Code',
      'ar': 'مقارنة السعر (اختياري)',
    },
    'm59x3pv9': {
      'en': '',
      'ar': '',
    },
    'r4x7ibp5': {
      'en': 'Enter IBAN/IFSC Code',
      'ar': 'أدخل النص الخاص بك',
    },
    'ggu815uy': {
      'en': 'Preferred Payout Method',
      'ar': 'مقارنة السعر (اختياري)',
    },
    'bmmdy03z': {
      'en': '',
      'ar': '',
    },
    '3b4lg7nw': {
      'en': 'Enter Preferred Payout Method',
      'ar': 'أدخل النص الخاص بك',
    },
    'ixrz7xv5': {
      'en': 'Bank name is required',
      'ar': 'اسم البنك مطلوب',
    },
    'xkv8yy1x': {
      'en': 'Minimum 2 charcters are required',
      'ar': 'يجب أن يكون هناك حرفين على الأقل',
    },
    '2jcdurnl': {
      'en': 'Maximum 50 characters are required',
      'ar': 'الحد الأقصى المطلوب هو 50 حرفًا',
    },
    'a7pqu2ez': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'yry6t2h5': {
      'en': 'Account holder is required',
      'ar': 'اسم صاحب الحساب مطلوب',
    },
    'boa66y1s': {
      'en': 'Minimum 2 charcters are required',
      'ar': 'يجب أن يكون هناك حرفين على الأقل',
    },
    'peo005d8': {
      'en': 'Maximum 50 characters are required',
      'ar': 'الحد الأقصى المطلوب هو 50 حرفًا',
    },
    'ohu5vyp0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'd9fv587y': {
      'en': 'Account number is required',
      'ar': 'رقم الحساب مطلوب',
    },
    'yy5xxwi5': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'f9g1yjf9': {
      'en': 'IBAN/IFSC code is required',
      'ar': 'مطلوب رمز IBAN/IFSC',
    },
    '0oyem434': {
      'en': 'Invalid IBAN/IFSC format.',
      'ar': 'صيغة IBAN/IFSC غير صالحة.',
    },
    '9xpweip5': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'h66vsu1q': {
      'en': 'Preferred Payout Method is required',
      'ar': 'يجب اختيار طريقة الدفع المفضلة',
    },
    '7uklum0z': {
      'en': 'Invalid payment method format',
      'ar': 'تنسيق طريقة الدفع غير صالح',
    },
    'jr0sijyf': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'p3r4k5e4': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    'g8ihrxvw': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // SizeChart
  {
    'o56rb4at': {
      'en': 'Upload size chart',
      'ar': 'تعديل رفض الإرسال',
    },
    '3qfdt20s': {
      'en': 'Chart Name',
      'ar': 'سبب الرفض',
    },
    'e2cqnfgv': {
      'en': 'Chart Name',
      'ar': '',
    },
    'ugfy0taw': {
      'en': 'Chart Type',
      'ar': 'سبب الرفض',
    },
    'paszq5vu': {
      'en': 'US',
      'ar': 'الولايات المتحدة',
    },
    'fnn2v423': {
      'en': 'UK',
      'ar': 'يغلق',
    },
    '2x2fomal': {
      'en': 'Metrics',
      'ar': 'سبب الرفض',
    },
    'mlldbcy1': {
      'en': 'Inches',
      'ar': 'حفظ ومتابعة',
    },
    'hqr58qt6': {
      'en': 'CM',
      'ar': 'يغلق',
    },
    '2td5y39w': {
      'en': 'Click or drop image',
      'ar': 'انقر أو أسقط الصورة',
    },
    'xsz6rdn1': {
      'en': 'Sizes',
      'ar': '',
    },
    'uzr9mbwi': {
      'en': 'Sizes',
      'ar': '',
    },
    'rpbmvmz9': {
      'en': 'Sizes',
      'ar': '',
    },
    'jwcvzgfo': {
      'en': 'Sizes',
      'ar': '',
    },
    'dn4a48ua': {
      'en': 'Sizes',
      'ar': '',
    },
    '7xehe1hb': {
      'en': 'Sizes',
      'ar': '',
    },
    'cajk86ya': {
      'en': 'Sizes',
      'ar': '',
    },
    'kinquhg3': {
      'en': 'Sizes',
      'ar': '',
    },
    'nl2q36pf': {
      'en': 'Sizes',
      'ar': '',
    },
    '6iwigyxi': {
      'en': 'Sizes',
      'ar': '',
    },
    'zkk21m4q': {
      'en': 'Sizes',
      'ar': '',
    },
    '7czabyuu': {
      'en': 'Sizes',
      'ar': '',
    },
    'wnlaa5og': {
      'en': 'Sizes',
      'ar': '',
    },
    'kfn4lms7': {
      'en': 'Sizes',
      'ar': '',
    },
    'kaz1d977': {
      'en': 'Sizes',
      'ar': '',
    },
    'xmudx50i': {
      'en': 'Sizes',
      'ar': '',
    },
    'biympx71': {
      'en': 'Sizes',
      'ar': '',
    },
    '6am8mjuj': {
      'en': 'Sizes',
      'ar': '',
    },
    'q85og66i': {
      'en': 'Sizes',
      'ar': '',
    },
    'xhiojd07': {
      'en': 'Sizes',
      'ar': '',
    },
    'y48zu959': {
      'en': 'Sizes',
      'ar': '',
    },
    'qiakf1s5': {
      'en': 'Sizes',
      'ar': '',
    },
    'lba84lpg': {
      'en': 'Sizes',
      'ar': '',
    },
    'txm8weda': {
      'en': 'Sizes',
      'ar': '',
    },
    't5vh1hjq': {
      'en': 'Sizes',
      'ar': '',
    },
    'mv873atd': {
      'en': 'Sizes',
      'ar': '',
    },
    '6y24ikll': {
      'en': 'Sizes',
      'ar': '',
    },
    'st8gctdh': {
      'en': 'Sizes',
      'ar': '',
    },
    '100fw6ag': {
      'en': 'Sizes',
      'ar': '',
    },
    'y5ro9whv': {
      'en': 'Sizes',
      'ar': '',
    },
    'jf3qg3ul': {
      'en': 'Sizes',
      'ar': '',
    },
    'rd5wlkqd': {
      'en': 'Sizes',
      'ar': '',
    },
    'sizvzefn': {
      'en': 'Sizes',
      'ar': '',
    },
    '4iwdyr07': {
      'en': 'Sizes',
      'ar': '',
    },
    'gac6msbv': {
      'en': 'Sizes',
      'ar': '',
    },
    'qvbkva6a': {
      'en': 'Sizes',
      'ar': '',
    },
    '6z1cl8b1': {
      'en': 'Sizes',
      'ar': '',
    },
    're44tbay': {
      'en': 'Sizes',
      'ar': '',
    },
    'zpzjh1d1': {
      'en': 'Sizes',
      'ar': '',
    },
    '271zd6jr': {
      'en': 'Sizes',
      'ar': '',
    },
    'e9204yah': {
      'en': 'Sizes',
      'ar': '',
    },
    'slh28521': {
      'en': 'Sizes',
      'ar': '',
    },
    '008ctcx6': {
      'en': 'Sizes',
      'ar': '',
    },
    'q2a94r0d': {
      'en': 'Sizes',
      'ar': '',
    },
    's4ivyva4': {
      'en': 'Sizes',
      'ar': '',
    },
    'b849323k': {
      'en': 'Sizes',
      'ar': '',
    },
    'hlibrpcd': {
      'en': 'Sizes',
      'ar': '',
    },
    '7xbxre7j': {
      'en': 'Sizes',
      'ar': '',
    },
    'qttlq5ik': {
      'en': 'Sizes',
      'ar': '',
    },
    '9hijmt7h': {
      'en': 'Sizes',
      'ar': '',
    },
    'ak17iezi': {
      'en': 'Sizes',
      'ar': '',
    },
    '8thvts0g': {
      'en': 'Sizes',
      'ar': '',
    },
    '8eg95cdb': {
      'en': 'Sizes',
      'ar': '',
    },
    'ima2b6x3': {
      'en': 'Sizes',
      'ar': '',
    },
    '5z42zfm3': {
      'en': 'Sizes',
      'ar': '',
    },
    'vzqaegtk': {
      'en': 'Sizes',
      'ar': '',
    },
    'xw0rz95b': {
      'en': '+',
      'ar': '',
    },
    '27ip9bnm': {
      'en': '+',
      'ar': '',
    },
    'pmghrw6t': {
      'en': 'Field is required',
      'ar': 'عنوان الإشعار مطلوب',
    },
    '931csh7a': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '43qp9dnx': {
      'en': 'Field is required',
      'ar': 'عنوان الإشعار مطلوب',
    },
    'tgeijyv0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'hpy1dhr3': {
      'en': 'Field is required',
      'ar': '',
    },
    'ehes6s8i': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xif9w2mh': {
      'en': 'Cancel',
      'ar': 'يلغي',
    },
    '1f1u7v4i': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
  },
  // theme
  {
    'ht4id3x6': {
      'en': 'Theme',
      'ar': 'سمة',
    },
    'vr6tuqqy': {
      'en': 'Primary Color',
      'ar': 'اللون الأساسي',
    },
    'k0bwaor5': {
      'en': 'Secondary Color',
      'ar': 'اللون الثانوي',
    },
    'v9qlmwy5': {
      'en': 'Primary Text  Color',
      'ar': 'لون النص الأساسي',
    },
    '9f9m7djx': {
      'en': 'Secondary Text Color',
      'ar': 'لون النص الثانوي',
    },
    '03rzy6tf': {
      'en': 'Primary Background Color',
      'ar': 'لون الخلفية الأساسي',
    },
    '0ncjdisn': {
      'en': 'Secondary Background Color',
      'ar': 'لون الخلفية الثانوي',
    },
    'c1l87teu': {
      'en': 'Primary Button Color',
      'ar': 'لون الزر الأساسي',
    },
    'iztjnh0f': {
      'en': 'Secondary Button Color',
      'ar': 'لون الزر الثانوي',
    },
    '1vwmif12': {
      'en': 'Primary Button Text Color',
      'ar': 'لون نص الزر الأساسي',
    },
    'rspdv370': {
      'en': 'Secondary Button Text Color',
      'ar': 'لون نص الزر الثانوي',
    },
    'oj1tgdi1': {
      'en': 'Primary Button Border ',
      'ar': 'حدود الزر الرئيسي',
    },
    '9r9fhoup': {
      'en': 'Secondary Button Border ',
      'ar': 'حدود الزر الثانوي',
    },
    'x4a14snz': {
      'en': 'Tertiary',
      'ar': '',
    },
    'dx077td0': {
      'en': 'Alternate',
      'ar': '',
    },
    '11kimds0': {
      'en': 'Set as default',
      'ar': 'تعيين كافتراضي',
    },
    '6we9zpx7': {
      'en': '',
      'ar': '',
    },
    'c85t1kz6': {
      'en': 'Field is required',
      'ar': '',
    },
    'b2afg8yr': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0iyyr47l': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    '1fktqxy6': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // testttt
  {
    '5kpdlufp': {
      'en': 'Save',
      'ar': '',
    },
  },
  // creator_space_banner_add
  {
    'qxk1t463': {
      'en': 'Add Banner',
      'ar': 'أضف بانر',
    },
    'tb2numw9': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '9g8oykr5': {
      'en': 'Enter Name ',
      'ar': '',
    },
    'xvey51hh': {
      'en': 'Subtitle',
      'ar': 'الترجمة الفرعية',
    },
    'f41yxh3o': {
      'en': 'Enter Subtitle',
      'ar': '',
    },
    'rhfbpblw': {
      'en': 'Upload Photo',
      'ar': 'تحميل صورة',
    },
    'q66f402k': {
      'en': 'Upload',
      'ar': 'رفع',
    },
    '3wrdxlbp': {
      'en': 'Title is required',
      'ar': '',
    },
    'tr73auf6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'n3mryrhe': {
      'en': 'Subtitle is Required',
      'ar': '',
    },
    '95fhwe4h': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'inqhjgg1': {
      'en': 'Save',
      'ar': 'يحفظ',
    },
  },
  // creator_space_banner_edit
  {
    'my7w3090': {
      'en': 'Edit  Creator Banner',
      'ar': 'تعديل بانر المُنشئ',
    },
    'nq4m9orr': {
      'en': 'Title',
      'ar': 'عنوان',
    },
    '2pt4379r': {
      'en': 'Enter Name ',
      'ar': '',
    },
    'pr5eexp3': {
      'en': 'Subtitle',
      'ar': 'الترجمة الفرعية',
    },
    'zw0ie1f4': {
      'en': 'Enter Subtitle',
      'ar': '',
    },
    'mbzcu3sd': {
      'en': 'Upload Photo',
      'ar': 'تحميل صورة',
    },
    '6kpywtfh': {
      'en': 'Upload',
      'ar': 'رفع',
    },
    'rchcxvg7': {
      'en': 'Title is required',
      'ar': '',
    },
    't60a1ty0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '60ayu2e0': {
      'en': 'Subtitle is required',
      'ar': '',
    },
    'grnv5tfg': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '49jp9ffk': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // Creator-AddAmount-old
  {
    '3knjmj1w': {
      'en': 'Add Amount',
      'ar': 'السبب',
    },
    'r8roqlpm': {
      'en': 'Amount Given',
      'ar': 'تعيين الي',
    },
    'q2tykoat': {
      'en': '',
      'ar': '',
    },
    '8oatm9nj': {
      'en': '0',
      'ar': '0',
    },
    'br7hlxq3': {
      'en': 'Cancel',
      'ar': 'حفظ',
    },
    'w5djyfgd': {
      'en': 'Save',
      'ar': 'حفظ',
    },
  },
  // Creator-PaymentDetails-Edit
  {
    '9cwe3vvf': {
      'en': 'Edit Payment Details ',
      'ar': 'تحريرتعديل سريع',
    },
    'vcej8s72': {
      'en':
          'Provide your bank information for smooth transactions. This helps ensure payments are processed correctly.',
      'ar':
          'حدّث تفاصيل المنتج الرئيسية بسرعة دون مغادرة الصفحة. عدّل عناوين المنتجات وأسعارها وحالة المخزون لضمان دقة قوائم المنتجات وتحديثها باستمرار.',
    },
    'sagozanf': {
      'en': 'Bank Name',
      'ar': 'العنوان',
    },
    'vw0sos40': {
      'en': '',
      'ar': '',
    },
    'wumo8i4e': {
      'en': 'Enter Bank Name',
      'ar': 'أدخل النص الخاص بك',
    },
    'f906ddpt': {
      'en': 'Account No',
      'ar': 'رمز المنتج',
    },
    'dxsnuzi5': {
      'en': '',
      'ar': '',
    },
    'b07vep2u': {
      'en': 'Enter Account No',
      'ar': 'أدخل النص الخاص بك',
    },
    'wy885gnw': {
      'en': 'Account Holder Name',
      'ar': 'السعر',
    },
    '9u49quu0': {
      'en': '',
      'ar': '',
    },
    'fmgofc2d': {
      'en': 'Enter Account Holder Name',
      'ar': 'أدخل النص الخاص بك',
    },
    'lq9r463n': {
      'en': 'IBAN Code',
      'ar': 'المخزون',
    },
    'azc94o6v': {
      'en': '',
      'ar': '',
    },
    '738bn7a3': {
      'en': 'Enter IBAN Code',
      'ar': 'أدخل النص الخاص بك',
    },
    '4ljnne3a': {
      'en': 'name is required',
      'ar': '',
    },
    'dm7sqw9i': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'jstjn6o8': {
      'en': 'product_sku is required',
      'ar': '',
    },
    'ndnwjr9k': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'upeeet8q': {
      'en': 'product_price is required',
      'ar': '',
    },
    '5bq8i620': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'mehu5eyw': {
      'en': 'product quantity is required',
      'ar': '',
    },
    'l2igz7pz': {
      'en': 'Invalid input',
      'ar': 'إدخال غير صالح',
    },
    'klsz6xsk': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'zmbth196': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'wrecwg4r': {
      'en': 'Update',
      'ar': 'تحديث',
    },
  },
  // AddAmount
  {
    'mny234zl': {
      'en': 'Add Payout Amount ',
      'ar': 'تحريرتعديل سريع',
    },
    'eblfzfqr': {
      'en':
          'Enter the amount you want to withdraw from your balance. Ensure the details are correct before submitting the payout.',
      'ar':
          'حدّث تفاصيل المنتج الرئيسية بسرعة دون مغادرة الصفحة. عدّل عناوين المنتجات وأسعارها وحالة المخزون لضمان دقة قوائم المنتجات وتحديثها باستمرار.',
    },
    '3q2h6po9': {
      'en': 'Partner Type ',
      'ar': 'العنوان',
    },
    '6qen9xa3': {
      'en': 'Email',
      'ar': 'العنوان',
    },
    'suyksdpb': {
      'en': 'Name',
      'ar': 'العنوان',
    },
    'xvx8i7o7': {
      'en': 'Account Holder Name',
      'ar': 'العنوان',
    },
    '073eyj46': {
      'en': 'Bank Name',
      'ar': 'العنوان',
    },
    'ma9l1yg8': {
      'en': 'Account Number',
      'ar': 'العنوان',
    },
    'kmn86s8x': {
      'en': 'IBAN Code',
      'ar': 'العنوان',
    },
    'qxeqmrhx': {
      'en': 'Previous Balance',
      'ar': 'العنوان',
    },
    'hnoumyzc': {
      'en': 'Payout Amount ',
      'ar': 'العنوان',
    },
    'hrvlj0f9': {
      'en': 'Enter Amount',
      'ar': '',
    },
    '3ojrf1xq': {
      'en': 'Current Balance',
      'ar': 'العنوان',
    },
    '4j0h5fcf': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'iqewfyxb': {
      'en': 'Update',
      'ar': 'تحديث',
    },
    'qcopsw9j': {
      'en': 'Enter Amount is required',
      'ar': '',
    },
    'obljpk07': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // Payouts-menu-Popup
  {
    'qsdw0j54': {
      'en': 'Payouts',
      'ar': 'جميع المنتجات',
    },
  },
  // ConfirmPayment
  {
    '0g7sphn6': {
      'en': 'Confirm Payment',
      'ar': 'جاري معالجة طلب استرداد الأموال\n',
    },
    'cfjnusnj': {
      'en':
          'Once mark as paid can’t be undone. \nIf you have the payment details add it here for future \nreference.',
      'ar': '',
    },
    'r133q2v9': {
      'en': 'Payment Method (Optional)',
      'ar': '',
    },
    'hs92vzey': {
      'en': '',
      'ar': '',
    },
    'on3ftlko': {
      'en': 'Bank Transfer',
      'ar': 'تغيير قيمة الحد',
    },
    'il5wnw6r': {
      'en': 'Search...',
      'ar': '',
    },
    'sdrcp9vq': {
      'en': 'Payment Reference ID (Optional)',
      'ar': '',
    },
    '4glictjv': {
      'en': '',
      'ar': '',
    },
    'u7kd79lu': {
      'en': 'Enter reference ID',
      'ar': '0',
    },
    'ozwwpnab': {
      'en': 'Cancel',
      'ar': 'الغاء\n',
    },
    'faf8s1i3': {
      'en': 'Confirm Payment',
      'ar': '',
    },
  },
  // RestockRequestCopy
  {
    '14pczfip': {
      'en': 'Restock Request for  ',
      'ar': 'طلب إعادة التخزين لـ',
    },
    'wwl6j4kr': {
      'en': '',
      'ar': '',
    },
    'z6vhkl0o': {
      'en': 'Edit Bank Information',
      'ar': 'تحرير سريع',
    },
    'jfif12co': {
      'en': 'Product Name',
      'ar': 'عنوان',
    },
    'afexe35v': {
      'en': 'In-hand Stock',
      'ar': 'المخزون المتوفر',
    },
    'de6e48a7': {
      'en': 'Low Stock Alert Threshold',
      'ar': ' تنبيه انخفاض المخزون',
    },
    'xw2xk3v8': {
      'en': 'Request Type',
      'ar': 'مقارنة السعر (اختياري)',
    },
    'gqqztnqs': {
      'en': 'Restock',
      'ar': 'رمز المنتج',
    },
    'o9yg6n9t': {
      'en': 'Quantity',
      'ar': 'الكمية',
    },
    'z06mcc39': {
      'en': '',
      'ar': '',
    },
    'dbd0ee2p': {
      'en': '05',
      'ar': 'أدخل النص الخاص بك',
    },
    'splajd08': {
      'en': 'Preferred ETA Date',
      'ar': 'تاريخ التسليم المتوقع ',
    },
    'wthnlpma': {
      'en': '',
      'ar': '',
    },
    'i3w5jttr': {
      'en': '02-01-2026',
      'ar': 'أدخل النص الخاص بك',
    },
    'einf82sr': {
      'en': 'Restock Notes',
      'ar': 'ملاحظات إعادة التخزين',
    },
    'u1jhsp7o': {
      'en': '',
      'ar': '',
    },
    'v371t4j4': {
      'en': 'Mention any delivery instructions or urgency notes.',
      'ar': 'أدخل النص الخاص بك',
    },
    '381virfq': {
      'en': 'Quantity is required',
      'ar': 'الكمية المطلوبة',
    },
    'fq985uwe': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'alj0wroj': {
      'en': '02-01-2026 is required',
      'ar': '',
    },
    'kc7qs1hb': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '7fu2pmqu': {
      'en': 'Mention any delivery instructions or urgency notes. is required',
      'ar': '',
    },
    'ddph0pua': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'eccgedio': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    '3uiskmwg': {
      'en': 'Submit Restock Request',
      'ar': 'إرسال طلب إعادة التخزين',
    },
  },
  // message
  {
    '8sw65sjd': {
      'en': 'Jack',
      'ar': 'تعيين الي',
    },
    'z14bzvoy': {
      'en':
          'when you land on a sample web page or open an email template and see content beginning with \"lorem ipsum,\" the page creator placed that apparent gibberish there on purpose.',
      'ar': 'السبب',
    },
    'nzufiisx': {
      'en': 'Jun 16, 2:30 pm',
      'ar': 'تعيين الي',
    },
    't3lcrvli': {
      'en': 'Jack',
      'ar': 'تعيين الي',
    },
    'czlgopq4': {
      'en':
          'when you land on a sample web page or open an email template and see content beginning with \"lorem ipsum,\" the page creator placed that apparent gibberish there on purpose.',
      'ar': 'السبب',
    },
    'w28spy6e': {
      'en': 'Jun 16, 2:30 pm',
      'ar': 'تعيين الي',
    },
    'znd4y7c4': {
      'en': 'Jack',
      'ar': 'تعيين الي',
    },
    'kp5zyxi2': {
      'en':
          'when you land on a sample web page or open an email template and see content beginning with \"lorem ipsum,\" the page creator placed that apparent gibberish there on purpose.',
      'ar': 'السبب',
    },
    '2qsxk03l': {
      'en': 'Jun 16, 2:30 pm',
      'ar': 'تعيين الي',
    },
  },
  // notification_message
  {
    'khk6lv0g': {
      'en': 'Notification',
      'ar': '',
    },
    '430pio8x': {
      'en': 'No Notifications!',
      'ar': 'لا إشعارات!',
    },
  },
  // Miscellaneous
  {
    's9gxiln0': {
      'en': 'Enter you name',
      'ar': '',
    },
    '3hcel7n4': {
      'en': 'Button',
      'ar': '',
    },
    'ihtj23wb': {
      'en': 'Button',
      'ar': '',
    },
    'inw0qb8y': {
      'en': 'Contact Us',
      'ar': '',
    },
    'gsueq7p8': {
      'en': 'Heading1',
      'ar': '',
    },
    'yo80065u': {
      'en': 'description1',
      'ar': '',
    },
    'w85uvmiz': {
      'en': 'label*',
      'ar': '',
    },
    'vt4q9a9d': {
      'en': 'Follow',
      'ar': '',
    },
    's4dugxvy': {
      'en': 'Option 1',
      'ar': '',
    },
    '9key1l6r': {
      'en': 'Option 2',
      'ar': '',
    },
    'cfff79jb': {
      'en': 'English',
      'ar': '',
    },
    'd6l0jhc9': {
      'en': 'English',
      'ar': '',
    },
    '40vljccc': {
      'en': 'Heading2',
      'ar': '',
    },
    'ue2dfqjn': {
      'en': 'for prfile photo.',
      'ar': '',
    },
    'bs452y21': {
      'en': 'for order photo.',
      'ar': '',
    },
    '2uhz2xet': {
      'en': '',
      'ar': '',
    },
    'zegvs5kv': {
      'en': '',
      'ar': '',
    },
    'mzttsn9k': {
      'en': 'for order.',
      'ar': '',
    },
    'qkkevvsw': {
      'en': 'for order updates.',
      'ar': '',
    },
    'n7aa5rbf': {
      'en': 'for order.',
      'ar': '',
    },
    'yqzsqbgq': {
      'en': '',
      'ar': '',
    },
    '5tvwjyiw': {
      'en': '',
      'ar': '',
    },
    '25okpw2b': {
      'en': '',
      'ar': '',
    },
    'rxbinupu': {
      'en': '',
      'ar': '',
    },
    'l62scwpg': {
      'en': '',
      'ar': '',
    },
    'njq53lx2': {
      'en': '',
      'ar': '',
    },
    'urzgyjy3': {
      'en': '',
      'ar': '',
    },
    'i04ghn2t': {
      'en': '',
      'ar': '',
    },
    's8csi5k9': {
      'en': '',
      'ar': '',
    },
    'q9usbayb': {
      'en': '',
      'ar': '',
    },
    'l3vl4921': {
      'en': '',
      'ar': '',
    },
    'ffuso1em': {
      'en': '',
      'ar': '',
    },
    '5r7myyd3': {
      'en': '',
      'ar': '',
    },
    '9w13o88x': {
      'en': '',
      'ar': '',
    },
    'rv7735nc': {
      'en': '',
      'ar': '',
    },
    'su1c8oi7': {
      'en': '',
      'ar': '',
    },
    '3aqci73t': {
      'en': '',
      'ar': '',
    },
    'fcv88eis': {
      'en': '',
      'ar': '',
    },
    'u953525x': {
      'en': '',
      'ar': '',
    },
    'z3jgetk1': {
      'en': '',
      'ar': '',
    },
    'z1k2nwuw': {
      'en': '',
      'ar': '',
    },
    'rg9kp55r': {
      'en': '',
      'ar': '',
    },
    'f75pq0yh': {
      'en': '',
      'ar': '',
    },
    'j3kzemnh': {
      'en': '',
      'ar': '',
    },
    'ghqi89ld': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
