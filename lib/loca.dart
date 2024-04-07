import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import 'main.dart';

class LocalizationCheck {
  static changelang(BuildContext context) {
    if (saveUserData.getLang() == 'ar') {
      EasyLocalization.of(context)!.setLocale(const Locale('ar', 'EG'));
    } else {
      EasyLocalization.of(context)!.setLocale(const Locale('en', 'US'));
    }
  }
}
