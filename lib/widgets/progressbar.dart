import 'package:cpo_assists/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final Stream<bool>? isLoading;

  const ProgressBar({Key? key, this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: isLoading,
        builder: (context, snapshot) {
          if (snapshot.hasData && (snapshot.data == true)) {
            return const LinearProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.kPrimaryColor),
            );
          } else {
            return Container();
          }
        });
  }
}
