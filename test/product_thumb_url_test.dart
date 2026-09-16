import 'package:flutter_test/flutter_test.dart';

import 'package:azyaa_admin_panel/flutter_flow/product_thumb_url.dart';

void main() {
  test('productThumbUrl prefers feature image and never throws on empty gallery',
      () {
    expect(
      productThumbUrl(
        'https://example.com/feature.png',
        const [],
      ),
      'https://example.com/feature.png',
    );
    expect(productThumbUrl('', const []), '');
    expect(productThumbUrl(null, null), '');
    expect(
      productThumbUrl('', const ['https://example.com/gallery.png']),
      'https://example.com/gallery.png',
    );
  });
}
