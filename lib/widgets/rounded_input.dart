import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/widgets/input_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedInput extends StatelessWidget {
  final Function(String)? callback;
  final Function()? suffixCallback;
  final TextEditingController? controller;
  final bool? isFocusable;
  final String? suffixText;
  final Color? color;
  final String? label;
  final Color? textColor;
  final Color? textHintColor;
  final bool borderVisible;

  const RoundedInput(
      {Key? key,
      this.icon,
      required this.hint,
      this.callback,
      required this.textInputType,
      this.suffixIcon,
      this.suffixCallback,
      this.controller,
      this.isFocusable,
      this.suffixText,
      this.color,
      this.label,
      this.textColor,
      this.textHintColor,
      this.borderVisible = false,
      this.isExpanded = false})
      : super(key: key);

  final IconData? suffixIcon;
  final IconData? icon;
  final String hint;
  final TextInputType textInputType;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      isExpanded: isExpanded,
      borderVisible: borderVisible,
      color: color,
      child: TextField(
        style: TextStyle(
          color: (textColor != null) ? textColor : AppColors.kBlackColor,
          fontSize: 12.sp,
        ),
        focusNode: (isFocusable != null)
            ? (isFocusable!)
                ? null
                : AlwaysDisabledFocusNode()
            : null,
        controller: (controller != null) ? controller : null,
        keyboardType: textInputType,
        onChanged: callback,
        cursorColor: AppColors.kPrimaryColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 12),
          label: (label != null)
              ? Text(
                  label!,
                  style: TextStyle(fontSize: 12.sp),
                )
              : null,
          suffixText: suffixText,
          suffixIcon: (suffixIcon != null)
              ? IconButton(
                  onPressed: suffixCallback,
                  icon: Icon(suffixIcon,
                      color: AppColors.kPrimaryColor, size: 12))
              : null,
          icon: (icon != null)
              ? Icon(icon, color: AppColors.kPrimaryColor, size: 12)
              : null,
          hintText: hint,
          hintStyle: TextStyle(
            color: (textHintColor != null)
                ? textHintColor
                : AppColors.kPrimaryColor,
            fontSize: 10.sp,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
