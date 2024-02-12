import 'package:flutter/material.dart';
import 'package:insights_news_2_11/core/utils/app_colors.dart';
import 'package:insights_news_2_11/core/utils/text_styles.dart';
import 'package:insights_news_2_11/splash_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffoldBg,
          appBarTheme: AppBarTheme(
            color: AppColors.scaffoldBg,
            elevation: 0.0,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: AppColors.lemonadaColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.scaffoldBg,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: getBodyStyle(),
            fillColor: AppColors.containerBg,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          )),
      home: const SplashView(),
    );
  }
}
