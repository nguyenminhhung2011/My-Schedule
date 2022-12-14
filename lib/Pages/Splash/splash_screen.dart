import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_schedule/Pages/Splash/splash_controller.dart';

import '../../Templates/Misc/color.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final controller = Get.put(SplashC());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.primaryColor),
                shape: BoxShape.circle,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/gift/task.gif'),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text.rich(
              TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  fontFamily: 'Montserrat',
                ),
                children: [
                  TextSpan(
                    text: 'MSchedule ',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.primaryColor),
                  ),
                  TextSpan(
                    text: 'App',
                    style: TextStyle(
                        fontFamily: 'Montserrat', color: AppColors.textColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'You can easily manage your schedule \nwith MScheudle',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: AppColors.textColor1,
                fontSize: 11,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
