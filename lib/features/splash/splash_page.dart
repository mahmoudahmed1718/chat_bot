import 'package:app_features/app_features.dart';
import 'package:chat_bot/core/utils/assets.dart';
import 'package:chat_bot/features/splash/splash_feature.dart';
import 'package:chat_bot/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/utils/api_util.dart';

import '../home/home_feature.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ApiUtils.init(context);
    });

    Future.delayed(const Duration(seconds: 3), () {
      SplashFeature.to.pushToOnBoarding();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: SvgPicture.asset(Assets.assetsImagesSplashImage)),
    );
  }
}
