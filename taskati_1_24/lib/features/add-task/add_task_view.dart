import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:taskati_1_24/core/model/task_model.dart';
import 'package:taskati_1_24/core/utils/app_colors.dart';
import 'package:taskati_1_24/core/utils/text_styles.dart';
import 'package:taskati_1_24/core/widgets/custom_btn.dart';
import 'package:taskati_1_24/features/home/home_view.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  String date = DateFormat.yMd().format(DateTime.now());
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)));
  int colorIndex = 1;

  var textCon = TextEditingController();
  var noteCon = TextEditingController();

  late Box<TaskModel> taskBox;

  @override
  void initState() {
    super.initState();
    taskBox = Hive.box('task');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // keyboard (floating)
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: getTitleStyle(color: AppColors.blackColor),
            ),
            const Gap(5),
            TextFormField(
              controller: textCon,
              decoration: const InputDecoration(hintText: 'Enter title here'),
            ),
            const Gap(10),
            Text(
              'Note',
              style: getTitleStyle(color: AppColors.blackColor),
            ),
            const Gap(5),
            TextFormField(
              controller: noteCon,
              maxLines: 4,
              decoration:
                  const InputDecoration(hintText: 'Enter note here ...'),
            ),
            const Gap(10),
            Text(
              'Date',
              style: getTitleStyle(color: AppColors.blackColor),
            ),
            const Gap(5),
            TextFormField(
              readOnly: true,
              onTap: () {},
              decoration: InputDecoration(
                  hintText: date,
                  suffixIcon: IconButton(
                      onPressed: () {
                        showDateDialog();
                      },
                      icon: Icon(
                        Icons.calendar_month,
                        color: AppColors.primaryColor,
                      ))),
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Start Time',
                    style: getTitleStyle(color: AppColors.blackColor),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Text(
                    'End Time',
                    style: getTitleStyle(color: AppColors.blackColor),
                  ),
                ),
              ],
            ),
            const Gap(5),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {},
                    decoration: InputDecoration(
                        hintText: startTime,
                        suffixIcon: IconButton(
                            onPressed: () {
                              showStartTime();
                            },
                            icon: Icon(
                              Icons.watch_later_outlined,
                              color: AppColors.primaryColor,
                            ))),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    onTap: () {},
                    decoration: InputDecoration(
                        hintText: endTime,
                        suffixIcon: IconButton(
                            onPressed: () {
                              showEndTime();
                            },
                            icon: Icon(
                              Icons.watch_later_outlined,
                              color: AppColors.primaryColor,
                            ))),
                  ),
                ),
              ],
            ),
            const Gap(20),
            Row(
              children: [
                // COLORS
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
                // BUTTON
                const Spacer(),
                SizedBox(
                  height: 45,
                  width: 130,
                  child: CustomButton(
                    text: '+ Add Task',
                    onPressed: () {
                      String id =
                          '${textCon.text}${DateTime.now().millisecond}';
                      taskBox.put(
                          id,
                          TaskModel(
                              id: id,
                              title: textCon.text,
                              note: noteCon.text,
                              date: date,
                              startTime: startTime,
                              endTime: endTime,
                              color: colorIndex,
                              isCompleted: false));
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ));
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  showDateDialog() async {
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null) {
      setState(() {
        date = DateFormat.yMd().format(pickedDate);
      });
    }
  }

  showStartTime() async {
    var startTimePicked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (startTimePicked != null) {
      setState(() {
        startTime = startTimePicked.format(context);
        int startMin = startTimePicked.minute;
        endTime =
            startTimePicked.replacing(minute: startMin + 15).format(context);
      });
    }
  }

  showEndTime() async {
    var startTimePicked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (startTimePicked != null) {
      setState(() {
        endTime = startTimePicked.format(context);
      });
    }
  }
}
