import 'package:cpo_assists/database/database_operation.dart';
import 'package:cpo_assists/routes/app_pages.dart';
import 'package:cpo_assists/routes/app_routes.dart';
import 'package:cpo_assists/utils/app_colors.dart';
import 'package:cpo_assists/utils/app_theme.dart';
import 'package:cpo_assists/utils/locale_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future initDatabase() async {
  var dir = await getApplicationDocumentsDirectory();
// make sure it exists
  await dir.create(recursive: true);
// build the database path
  var dbPath = '${dir.path}/cpo_assist.db';
  Hive.init(dbPath);

  DatabaseOperation _databaseOperation = DatabaseOperation.databaseOperation;

  await Hive.openBox(_databaseOperation.boxAppUtils).then((val) {
    _databaseOperation.applicationUtils = val;
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDatabase();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) {
      runApp(const MyApp());
      configLoading();
    },
  );
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColors.kPrimaryColor
    ..backgroundColor = Colors.white
    ..indicatorColor = AppColors.kPrimaryColor
    ..textColor = AppColors.kPrimaryColor
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    return Opacity(
      opacity: controller.value,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          builder: EasyLoading.init(builder: (context1, child1) {
            return MediaQuery(
                data: MediaQuery.of(context1).copyWith(
                  textScaleFactor: 1.0,
                ),
                child: child1!);
          }),
          debugShowCheckedModeBanner: false,
          translations: LocaleString(),
          locale: const Locale('en', 'US'),
          initialRoute: AppRoutes.root,
          title: 'cpo_assist'.tr,
          theme: Themes.light,
          //darkTheme: Themes.dark,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
