import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_1_24/core/utils/app_colors.dart';
import 'package:taskati_1_24/core/utils/text_styles.dart';
import 'package:taskati_1_24/features/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const UploadView(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/logo.json', width: 250),
            const Gap(15),
            Text(
              'Taskati',
              style: getTitleStyle(
                  fontWeight: FontWeight.normal,
                  color: AppColors.blackColor,
                  fontSize: 24),
            ),
            const Gap(20),
            Text(
              'It\'s time to be organized',
              style: getSmallStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
