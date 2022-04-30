import 'package:flutter/cupertino.dart';

extension PaddingExtends on Widget {
  Widget padding(
      {double left = 0.0,
      double right = 0.0,
      double top = 0.0,
      double bottom = 0.0}) {
    return Padding(
        padding:
            EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
        child: this);
  }

  Widget paddingEdge(EdgeInsets value) {
    return Padding(
      padding: value,
      child: this,
    );
  }
}
