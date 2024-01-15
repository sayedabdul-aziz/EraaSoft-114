import 'package:flutter/material.dart';
import 'package:session_3/app_colors.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.res});

  final double res;

  String getClassification() {
    if (res < 16) {
      return 'Severe Thinness';
    } else if (res > 18.5 && res < 25) {
      return 'Normal';
    } else {
      return 'Obese Class III';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                getClassification(),
                style: TextStyle(color: AppColors.whiteColor, fontSize: 26),
              ),
              const SizedBox(height: 20),
              Text(
                res.toStringAsFixed(2),
                style: TextStyle(color: AppColors.whiteColor, fontSize: 26),
              ),
              const SizedBox(height: 30),
              SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.redColor,
                          foregroundColor: AppColors.whiteColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('RE-CALCULATE')))
            ],
          ),
        ),
      ),
    );
  }
}
