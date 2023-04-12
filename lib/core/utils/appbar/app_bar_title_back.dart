// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:sizer/sizer.dart';

// Project imports:
import 'package:waterbus/core/navigator/app_navigator.dart';
import 'package:waterbus/core/utils/gesture/gesture_wrapper.dart';

AppBar appBarTitleBack(
  BuildContext context,
  String title, {
  List<Widget>? actions,
  Function? onBackPressed,
  Color? backgroundColor,
  Brightness? brightness,
  double? paddingLeft,
  Color? colorChild,
  PreferredSizeWidget? bottom,
  Widget? titleWidget,
  Widget? leading,
  double? elevation,
  bool centerTitle = true,
  bool isVisibleBackButton = true,
  double? titleSpacing,
  double? titleTextSize,
  double? toolbarHeight,
}) {
  return AppBar(
    toolbarHeight: toolbarHeight,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: (brightness ?? Theme.of(context).brightness) ==
              (Platform.isAndroid ? Brightness.dark : Brightness.light)
          ? Brightness.light
          : Brightness.dark,
      statusBarIconBrightness: (brightness ?? Theme.of(context).brightness) ==
              (Platform.isAndroid ? Brightness.dark : Brightness.light)
          ? Brightness.light
          : Brightness.dark,
    ),
    elevation: elevation ?? 0.0,
    backgroundColor: backgroundColor ?? Colors.transparent,
    automaticallyImplyLeading: false,
    centerTitle: centerTitle,
    leadingWidth: 40.sp,
    titleSpacing: titleSpacing,
    title: titleWidget ??
        Text(
          title,
          style: TextStyle(
            fontSize: titleTextSize ?? 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
    leading: leading ??
        GestureWrapper(
          onTap: () {
            if (onBackPressed != null) {
              onBackPressed();
            } else {
              AppNavigator.pop();
            }
          },
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: paddingLeft ?? 3.sp),
            child: Image.asset(
              ' Assets.icons.icBack.path',
              width: 33.sp,
              height: 33.sp,
              color: colorChild,
            ),
          ),
        ),
    actions: actions,
    bottom: bottom,
  );
}