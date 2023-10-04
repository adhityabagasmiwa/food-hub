import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/presentation/misc/app_styles.dart';

class CommonButton extends StatelessWidget {
  final Color backgroundColor, textColor;
  final String text;
  final double width, height;
  final Function() onPressed;

  const CommonButton({
    super.key,
    this.width = double.infinity,
    this.height = 48,
    required this.text,
    required this.textColor,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          fixedSize: Size(width, height.h),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyleW500S16.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
