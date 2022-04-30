import 'package:app/gen/assets.gen.dart';
import 'package:flutter/widgets.dart';

Image profileImage(String? imageUrl, {Image? imagePlaceholder}) {
  if (imageUrl == null || imageUrl.isEmpty) {
    if (imagePlaceholder != null) {
      return imagePlaceholder;
    }
    return Assets.images.iconPlaceholder.image();
  }
  return Image.network(imageUrl);
}

ImageProvider profileImageProvider(String? imageUrl,
    {ImageProvider? imageProviderPlaceholder}) {
  if (imageUrl == null || imageUrl.isEmpty) {
    if (imageProviderPlaceholder != null) {
      return imageProviderPlaceholder;
    }
    return Assets.images.iconPlaceholder;
  }
  return NetworkImage(imageUrl);
}

Image networkImage(String? url, {BoxFit? fit}) {
  final placeholder = Assets.images.articlePlaceholder.image(fit: fit);
  if (url == null || url.isEmpty) {
    return placeholder;
  }
  return Image.network(
    url,
    fit: fit,
    errorBuilder: (context, url, dynamic error) => placeholder,
  );
}
