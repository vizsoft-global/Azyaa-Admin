import 'package:store_valley_sdk/store_valley_sdk.dart';

class StoreValleyAddress {
  StoreValleyAddress._();

  static final _ordinalBlock = RegExp(
    r'^(\d+)\s*,\s*(\d+)(?:st|nd|rd|th)?\s+block\s*,\s*(.+?)\s*,\s*(.+)$',
    caseSensitive: false,
  );
  static final _namedBlock = RegExp(
    r'^(\d+)\s*,\s*block\s+(\d+)\s*,\s*(.+?)\s*,\s*(.+)$',
    caseSensitive: false,
  );
  static final _stAndBlock = RegExp(
    r'^(\d+)\s+st\s*(\d+)\s*,\s*block\s+(\d+)$',
    caseSensitive: false,
  );

  static const _areaAliases = {
    'hawaliy': 'Hawalli',
    'hawally': 'Hawalli',
    'hawalli': 'Hawalli',
    'salmiya': 'Salmiya',
    'salmiyah': 'Salmiya',
  };

  static const _areaGovernorate = {
    'Hawalli': 'Hawalli',
    'Salmiya': 'Hawalli',
    'Jabriya': 'Hawalli',
  };

  static Address fromParts({
    required String street,
    required String city,
    required String contactName,
    required String contactPhone,
    String? country,
    double? latitude,
    double? longitude,
    String? building,
    String? block,
    String? governorate,
  }) {
    final explicitBuilding = _optional(building);
    final explicitBlock = _optional(block);
    final explicitGovernorate = _optional(governorate);
    final parsed = (explicitBuilding == null && explicitBlock == null)
        ? _parse(street.trim())
        : null;
    final area = parsed == null
        ? null
        : _canonicalArea(parsed.area ?? '');
    final genericCity = _isGenericCity(city);
    final resolvedCity = (genericCity && area != null && area.isNotEmpty)
        ? area
        : city.trim();
    final district = area != null && area.isNotEmpty ? area : null;
    final resolvedGovernorate = explicitGovernorate ??
        (district != null ? (_areaGovernorate[district] ?? district) : null);
    return Address(
      street: parsed?.street ?? street.trim(),
      city: resolvedCity,
      country: _optional(country),
      governorate: resolvedGovernorate,
      district: district,
      block: explicitBlock ?? parsed?.block,
      building: explicitBuilding ?? parsed?.building,
      contactName: contactName.trim(),
      contactPhone: normalizePhone(contactPhone),
      latitude: latitude,
      longitude: longitude,
    );
  }

  static String? _optional(String? value) {
    final trimmed = value?.trim() ?? '';
    return trimmed.isEmpty ? null : trimmed;
  }

  static String normalizePhone(String phone) {
    final trimmed = phone.trim();
    if (trimmed.isEmpty) {
      return trimmed;
    }
    if (trimmed == '-') {
      return trimmed;
    }
    var value = trimmed.replaceAll(RegExp(r'[\s-]'), '');
    if (value.startsWith('00')) {
      value = '+${value.substring(2)}';
    }
    if (!value.startsWith('+')) {
      value = value.startsWith('965') ? '+$value' : '+965$value';
    }
    return value;
  }

  static Map<String, dynamic> prepareWarehouseIntakeBody(
    Map<String, dynamic> body, {
    bool generatePickupOtp = true,
  }) {
    if (generatePickupOtp) {
      body['requires_otp_proof'] = true;
      body.remove('delivery_otp');
    }
    if (body['special_instructions'] == '') {
      body.remove('special_instructions');
    }
    return body;
  }

  static _ParsedAddress? _parse(String street) {
    if (street.isEmpty) {
      return null;
    }
    final ordinal = _ordinalBlock.firstMatch(street);
    if (ordinal != null) {
      return _ParsedAddress(
        building: ordinal.group(1)!,
        block: ordinal.group(2)!,
        street: _formatStreet(ordinal.group(3)!),
        area: ordinal.group(4),
      );
    }
    final named = _namedBlock.firstMatch(street);
    if (named != null) {
      return _ParsedAddress(
        building: named.group(1)!,
        block: named.group(2)!,
        street: _formatStreet(named.group(3)!),
        area: named.group(4),
      );
    }
    final stAndBlock = _stAndBlock.firstMatch(street);
    if (stAndBlock != null) {
      return _ParsedAddress(
        building: stAndBlock.group(1)!,
        block: stAndBlock.group(3)!,
        street: _formatStreet('st ${stAndBlock.group(2)}'),
      );
    }
    return null;
  }

  static String _formatStreet(String raw) {
    final titled = raw.trim().split(RegExp(r'\s+')).map(_titleWord).join(' ');
    if (RegExp(r'\b(street|road|avenue|blvd|lane)\b', caseSensitive: false)
        .hasMatch(titled)) {
      return titled;
    }
    final stNumber = RegExp(r'^st\s*(\d+)$', caseSensitive: false).firstMatch(titled);
    if (stNumber != null) {
      return 'Street ${stNumber.group(1)}';
    }
    return '$titled Street';
  }

  static String _titleWord(String word) {
    if (RegExp(r'^\d+(st|nd|rd|th)$', caseSensitive: false).hasMatch(word)) {
      return word.toLowerCase();
    }
    if (word.isEmpty) {
      return word;
    }
    return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
  }

  static String _canonicalArea(String raw) {
    final trimmed = raw.trim();
    if (trimmed.isEmpty) {
      return trimmed;
    }
    return _areaAliases[trimmed.toLowerCase()] ??
        trimmed
            .split(RegExp(r'\s+'))
            .map(_titleWord)
            .join(' ');
  }

  static bool _isGenericCity(String city) {
    final normalized = city.trim().toLowerCase();
    return normalized.isEmpty ||
        normalized == 'kuwait' ||
        normalized == 'kuwait city' ||
        normalized == 'kuwaitcity';
  }
}

class _ParsedAddress {
  const _ParsedAddress({
    required this.building,
    required this.block,
    required this.street,
    this.area,
  });

  final String building;
  final String block;
  final String street;
  final String? area;
}
