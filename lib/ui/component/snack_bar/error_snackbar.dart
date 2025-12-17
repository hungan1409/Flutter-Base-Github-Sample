import 'package:app/ui/theme/layout_size.dart';
import 'package:flutter/material.dart';

void showErrorSnackBar({
  required BuildContext context,
  required String message,
}) {
  final snackBar = SnackBar(
    content: Text(message),
    margin: const EdgeInsets.only(
      bottom: LayoutSize.sizePadding16,
      right: LayoutSize.sizePaddingMedium,
      left: LayoutSize.sizePaddingMedium,
    ),
    padding: const EdgeInsets.symmetric(
      vertical: LayoutSize.sizePadding2,
      horizontal: LayoutSize.sizePadding16,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(LayoutSize.borderRadius12)),
    ),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
