import 'package:flutter/material.dart';

class AppSize {
  static heightDivide(BuildContext context, double size) =>
      MediaQuery.of(context).size.height / size;

  static heightMultiply(BuildContext context, double size) =>
      MediaQuery.of(context).size.height * size;

  static widthDivide(BuildContext context, double size) =>
      MediaQuery.of(context).size.width / size;

  static widthMultiply(BuildContext context, double size) =>
      MediaQuery.of(context).size.width * size;
}

class SizedMedia {
  static SizedBox heightDivide(BuildContext context, double size) => SizedBox(
        height: AppSize.heightDivide(context, size),
      );

  static SizedBox heightMultiply(BuildContext context, double size) => SizedBox(
        height: AppSize.heightMultiply(context, size),
      );

  static SizedBox widthDivide(BuildContext context, double size) => SizedBox(
        width: AppSize.widthDivide(context, size),
      );

  static SizedBox widthMultiply(BuildContext context, double size) => SizedBox(
        width: AppSize.widthMultiply(context, size),
      );
}