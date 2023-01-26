import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final Function callback;
  final double circularBorder;
  final Color? backgroundColor;
  final Color? textColor;

  const RoundedButton(
      {Key? key,
      required this.title,
      required this.callback,
      this.backgroundColor = Colors.white,
      this.textColor = AppColors.kPrimaryColor,
      this.circularBorder = 30})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        callback();
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: (size.width * 0.9),
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.kPrimaryColor),
          borderRadius: BorderRadius.circular(circularBorder),
          color: backgroundColor,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 38),
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
              color: textColor,
              fontSize: 12.sp,
              fontFamily: fontFamily,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
