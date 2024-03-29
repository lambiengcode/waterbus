// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sizer/sizer.dart';
import 'package:superellipse_shape/superellipse_shape.dart';

class TimeCard extends StatelessWidget {
  final String text;
  final IconData? iconData;
  final Color? backgroundColor;
  const TimeCard({
    super.key,
    required this.text,
    this.backgroundColor,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.sp),
      child: Material(
        color: backgroundColor ??
            Theme.of(context).primaryColorLight.withOpacity(.08),
        shape: SuperellipseShape(
          borderRadius: BorderRadius.circular(30.sp),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.sp,
            vertical: 6.sp,
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 4.sp),
                child: Icon(
                  iconData,
                  size: 12.sp,
                  color: Colors.white,
                ),
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 9.sp,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
