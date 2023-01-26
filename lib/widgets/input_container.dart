import 'package:cpo_assists/utils/app_colors.dart';
import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  const InputContainer(
      {Key? key,
      required this.child,
      this.color,
      this.borderVisible = false,
      this.isExpanded = false})
      : super(key: key);

  final Widget child;
  final Color? color;
  final bool borderVisible;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: isExpanded ? double.infinity : (size.width * 0.9),
      height: 35,
      decoration: BoxDecoration(
        border:
            borderVisible ? Border.all(color: AppColors.kPrimaryColor) : null,
        borderRadius: BorderRadius.circular(16),
        color: (color != null) ? color : Colors.white,
      ),
      child: child,
    );
  }
}
