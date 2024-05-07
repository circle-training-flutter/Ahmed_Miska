import 'package:circletraning/data/repository/save_user_data.dart';
import 'package:circletraning/providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/injection.dart';
import 'my_app.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
SaveUserData saveUserData = getIt();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  init();

  runApp(
    GenerateMultiProvider(
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        fallbackLocale: const Locale('en', 'US'),
        path: 'assets/translations',
        child: const MyApp(),
      ),
    ),
  );
}

