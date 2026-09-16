String productThumbUrl(String? featureImage, List<String>? galleryImage) {
  final feature = (featureImage ?? '').trim();
  if (feature.isNotEmpty) {
    return feature;
  }
  for (final item in galleryImage ?? const <String>[]) {
    final url = item.trim();
    if (url.isNotEmpty) {
      return url;
    }
  }
  return '';
}
