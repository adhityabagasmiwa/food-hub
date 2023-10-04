import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_hub/presentation/misc/app_colors.dart';
import 'package:food_hub/presentation/misc/app_sizes.dart';
import 'package:food_hub/presentation/misc/app_styles.dart';

class CommonSearchBar extends StatelessWidget {
  final SearchController controller;
  final String hintText;
  final Function()? onTap, onClear;
  final Function(String)? onChanged, onSumbitted;
  final FocusNode? focusNode;
  final bool? showTrailingIcon;

  const CommonSearchBar({
    super.key,
    this.onTap,
    this.onClear,
    this.onChanged,
    this.onSumbitted,
    this.focusNode,
    this.showTrailingIcon,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      focusNode: focusNode,
      backgroundColor: const MaterialStatePropertyAll<Color>(
        AppColors.backgroundColor,
      ),
      hintText: hintText,
      hintStyle: MaterialStatePropertyAll<TextStyle>(
        textStyleW500S14.copyWith(color: AppColors.textColor),
      ),
      padding: MaterialStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: AppSizes.dimen16.w),
      ),
      elevation: const MaterialStatePropertyAll<double>(0.0),
      leading: const Icon(Icons.search, color: AppColors.textSecondaryColor),
      onTap: onTap,
      onChanged: onChanged,
      onSubmitted: onSumbitted,
      trailing: [
        Visibility(
          visible: showTrailingIcon ?? false,
          child: IconButton(
            onPressed: onClear,
            icon: Container(
              decoration: BoxDecoration(
                color: AppColors.textSecondaryColor.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(AppSizes.dimen2.w),
                child: const Icon(
                  Icons.clear_rounded,
                  size: AppSizes.size16,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
