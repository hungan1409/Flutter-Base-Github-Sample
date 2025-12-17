import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  //region Padding

  Widget paddingLeft(double value) {
    return Padding(
      padding: EdgeInsets.only(left: value),
      child: this,
    );
  }

  Widget paddingTop(double value) {
    return Padding(
      padding: EdgeInsets.only(top: value),
      child: this,
    );
  }

  Widget paddingRight(double value) {
    return Padding(
      padding: EdgeInsets.only(right: value),
      child: this,
    );
  }

  Widget paddingBottom(double value) {
    return Padding(
      padding: EdgeInsets.only(bottom: value),
      child: this,
    );
  }

  Widget paddingH(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  Widget paddingV(double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  Widget paddingVH({required double vertical, required double horizontal}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget paddingOnly({
    double top = 0,
    double left = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        left: left,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  //endregion

  //region Margin
  Widget marginLeft(double value) {
    return Container(
      margin: EdgeInsets.only(left: value),
      child: this,
    );
  }

  Widget marginTop(double value) {
    return Container(
      margin: EdgeInsets.only(top: value),
      child: this,
    );
  }

  Widget marginRight(double value) {
    return Container(
      margin: EdgeInsets.only(right: value),
      child: this,
    );
  }

  Widget marginBottom(double value) {
    return Container(
      margin: EdgeInsets.only(bottom: value),
      child: this,
    );
  }

  Widget marginH(double value) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: value),
      child: this,
    );
  }

  Widget marginV(double value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: value),
      child: this,
    );
  }

  Widget marginVH({required double vertical, required double horizontal}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget marginOnly({
    double top = 0,
    double left = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return Container(
      margin: EdgeInsets.only(
        top: top,
        left: left,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  //endregion
}
