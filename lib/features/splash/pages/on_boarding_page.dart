import 'package:chat_bot/core/utils/styles.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(69),
              Text('You Ai Assistant', style: Styles.fontStyle23),
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
              // SvgPicture.asset(
              //   Assets.assetsImagesOnBordingImage,
              //   fit: BoxFit.fill,
              // ),
              Gap(66),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3D6BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
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
    );
  }
}
