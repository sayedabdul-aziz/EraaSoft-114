import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_2_11/core/functions/routing.dart';
import 'package:insights_news_2_11/core/services/local_storage.dart';
import 'package:insights_news_2_11/core/utils/app_colors.dart';
import 'package:insights_news_2_11/core/utils/text_styles.dart';
import 'package:insights_news_2_11/features/home/presentation/view/nav_bar.dart';
import 'package:insights_news_2_11/features/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late bool isUpload;
  @override
  void initState() {
    super.initState();
    AppLocal.getCachedData(AppLocal.ISUPLOAD_KEY).then((value) {
      isUpload = value ?? false;
    });
    Future.delayed(const Duration(seconds: 3), () {
      pushWithReplacment(
          context, isUpload ? const NavBarWidget() : const UploadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 300,
            ),
            const Gap(10),
            Text(
              'Insights News',
              style: getTitleStyle(color: AppColors.white),
            ),
            const Gap(10),
            Text(
              'Stay Informed, Anytime, Anywhere.',
              style: getSmallStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
