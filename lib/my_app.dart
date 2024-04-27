import 'package:circletraning/core/theming/colors.dart';
import 'package:circletraning/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/splash/splash_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (child, context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: child.localizationDelegates,
          supportedLocales: child.supportedLocales,
          locale: child.locale,
          title: 'Circle App',
          theme: ThemeData(scaffoldBackgroundColor: ColorManger.white),
          navigatorKey: navigator,
          home: const SplashScreen(),
        );
      },
    );
  }
}
