import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_1_24/core/model/task_model.dart';
import 'package:taskati_1_24/core/utils/app_colors.dart';
import 'package:taskati_1_24/core/utils/text_styles.dart';

class TaskCardItem extends StatelessWidget {
  const TaskCardItem({
    super.key,
    required this.task,
  });

  final TaskModel task;

  Color getColor(index) {
    if (index == 0) {
      return AppColors.primaryColor;
    } else if (index == 1) {
      return AppColors.orangeColor;
    } else if (index == 2) {
      return AppColors.redColor;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: getColor(task.color), borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
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
                    '${task.startTime} - ${task.startTime}',
                    style: getSmallStyle(color: AppColors.whiteColor),
                  )
                ],
              ),
              const Gap(5),
              Text(
                task.note,
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
              (task.isCompleted) ? 'COMPLETED' : 'TODO',
              style: getTitleStyle(color: AppColors.whiteColor, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
