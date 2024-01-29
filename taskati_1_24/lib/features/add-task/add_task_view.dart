import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_1_24/core/utils/app_colors.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  int colorIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      colorIndex = 0;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: (colorIndex == 0)
                        ? Icon(
                            Icons.check,
                            color: AppColors.whiteColor,
                          )
                        : const SizedBox(),
                  ),
                ),
                const Gap(5),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      colorIndex = 1;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.orangeColor,
                    child: (colorIndex == 1)
                        ? Icon(
                            Icons.check,
                            color: AppColors.whiteColor,
                          )
                        : const SizedBox(),
                  ),
                ),
                const Gap(5),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      colorIndex = 2;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.redColor,
                    child: (colorIndex == 2)
                        ? Icon(
                            Icons.check,
                            color: AppColors.whiteColor,
                          )
                        : const SizedBox(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
