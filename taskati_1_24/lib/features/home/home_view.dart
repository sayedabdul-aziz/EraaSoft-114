import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati_1_24/core/utils/app_colors.dart';
import 'package:taskati_1_24/core/utils/text_styles.dart';
import 'package:taskati_1_24/core/widgets/custom_btn.dart';
import 'package:taskati_1_24/features/add-task/add_task_view.dart';
import 'package:taskati_1_24/features/home/widgets/home_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Header
              const HomeHeader(),
              // today
              const Gap(20),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMMd().format(DateTime.now()),
                        style: getTitleStyle(color: AppColors.blackColor),
                      ),
                      Text(
                        'Today',
                        style: getTitleStyle(color: AppColors.blackColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 45,
                    width: 120,
                    child: CustomButton(
                      text: '+ Add Task',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AddTaskView(),
                        ));
                      },
                    ),
                  )
                ],
              ),
              const Gap(20),
              DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  // setState(() {
                  //   _selectedValue = date;
                  // });
                },
              ),

              // Tasks List

              Expanded(
                  child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flutter Task 1',
                              style: getBodyStyle(color: AppColors.whiteColor),
                            ),
                            const Gap(5),
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  color: AppColors.whiteColor,
                                ),
                                const Gap(10),
                                Text(
                                  '12:00 - 12:00',
                                  style: getSmallStyle(
                                      color: AppColors.whiteColor),
                                )
                              ],
                            ),
                            const Gap(5),
                            Text(
                              'Flutter Task 1 noteeeeee',
                              style: getBodyStyle(color: AppColors.whiteColor),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          width: .5,
                          height: 60,
                          color: AppColors.whiteColor,
                        ),
                        const Gap(5),
                        RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            'TODO',
                            style: getTitleStyle(
                                color: AppColors.whiteColor, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
