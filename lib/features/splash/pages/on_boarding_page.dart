import 'package:chat_bot/core/app_storage.dart';
import 'package:chat_bot/core/utils/assets.dart';
import 'package:chat_bot/core/utils/styles.dart';
import 'package:chat_bot/features/home/home_feature.dart';
import 'package:chat_bot/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(79),
                Text('You Ai Assistant', style: AppStyles.fontStyle23),
                Gap(14),
                const Text(
                  'Using this software, you can ask you\nquestions and receive articles using\nartificial intelligence assistant',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    height: 1.5, // Line height for readability
                  ),
                ),

                // Illustration Placeholder
                // Replace with Image.asset('assets/illustration.png')
                Gap(84),
                Image.asset(Assets.assetsImagesOnBoardPngImage),

                Gap(130),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      AppStorage.to.setOnboardingSeen();
                      HomeFeature.to.go();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          'Continue',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_forward, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
