import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketClosed extends StatefulWidget {
  const TicketClosed({Key? key}) : super(key: key);

  @override
  State<TicketClosed> createState() => _TicketClosedState();
}

class _TicketClosedState extends State<TicketClosed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: bodyWidget(),
      ),
    );
  }

  Widget bodyWidget() {
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 100, left: 75, right: 76),
            child: const Image(
              alignment: Alignment.center,
              image: AssetImage("assets/images/ticket_closed.png"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height / 2) + 10),
            child: Column(
              children: [
                Text(
                  "ticket_closed".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.kBlackColor),
                ),
                SizedBox(height: 50.h),
                Container(
                  width: double.infinity,
                  height: 40,
                  padding: const EdgeInsets.only(left: 38, right: 38),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.kBlackColor,
                      ),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      Get.offAndToNamed(AppRoutes.loginScreen);
                    },
                    child: Text("home".tr,
                        style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
