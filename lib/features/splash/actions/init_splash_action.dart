import 'package:chat_bot/core/app_storage.dart';
import 'package:chat_bot/core/utils/api_util.dart';
import 'package:chat_bot/features/home/home_feature.dart';
import 'package:chat_bot/features/splash/splash_feature.dart';
import 'package:flutter/material.dart';

class InitSplashAction {
  static Future<void> execute(BuildContext context) async {
    ApiUtils.init(context);

    await Future.delayed(const Duration(seconds: 3));

    final isOnboardingSeen = AppStorage.to.getOnboardingSeen();

    if (isOnboardingSeen) {
      HomeFeature.to.go();
    } else {
      SplashFeature.to.goToOnBoarding();
    }
  }
}
