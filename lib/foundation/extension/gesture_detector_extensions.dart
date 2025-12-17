import 'package:flutter/material.dart';

extension GestureDetectorExt on Widget {
  Widget onDoubleTap(void Function() function) => GestureDetector(onDoubleTap: function, child: this);

  Widget onTap(void Function() function) => GestureDetector(onTap: function, child: this);

  Widget onLongPress(void Function() function) => GestureDetector(onLongPress: function, child: this);
}
