import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/widgets/input_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedPasswordInput extends StatefulWidget {
  final Function(String) callback;
  final String hint;

  const RoundedPasswordInput({
    Key? key,
    required this.hint,
    required this.callback,
  }) : super(key: key);

  @override
  State<RoundedPasswordInput> createState() => _RoundedPasswordInputState();
}

class _RoundedPasswordInputState extends State<RoundedPasswordInput> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        onChanged: widget.callback,
        cursorColor: AppColors.kPrimaryColor,
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
          icon: const Icon(Icons.lock, color: AppColors.kPrimaryColor),
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.white, fontSize: 12.sp),
          border: InputBorder.none,
          suffixIconConstraints: const BoxConstraints(maxHeight: 40),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off)),
        ),
      ),
    );
  }
}
