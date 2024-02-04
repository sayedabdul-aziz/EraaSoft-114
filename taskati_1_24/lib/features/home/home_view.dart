import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati_1_24/core/model/task_model.dart';
import 'package:taskati_1_24/core/utils/app_colors.dart';
import 'package:taskati_1_24/core/utils/text_styles.dart';
import 'package:taskati_1_24/core/widgets/custom_btn.dart';
import 'package:taskati_1_24/features/add-task/add_task_view.dart';
import 'package:taskati_1_24/features/home/widgets/home_header.dart';
import 'package:taskati_1_24/features/home/widgets/task_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedDate = DateFormat.yMd().format(DateTime.now());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                    width: 130,
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
                DateTime(2024, 1, 1),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.primaryColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    selectedDate = DateFormat.yMd().format(date);
                  });
                },
              ),

              // Tasks List

              Expanded(
                  child: ValueListenableBuilder<Box<TaskModel>>(
                valueListenable: Hive.box<TaskModel>('task').listenable(),
                builder: (context, Box<TaskModel> box, child) {
                  List<TaskModel> tasks = [];
                  for (var element in box.values) {
                    if (selectedDate == element.date) {
                    tasks.add(element);
                    }
                  }
                  return tasks.isEmpty
                      ? const Center(child: Text('Emptyy'))
                      : ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            TaskModel task = tasks[index];
                            return Dismissible(
                                key: UniqueKey(),
                                // delete continear
                                secondaryBackground: Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.all(10),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.delete),
                                      Text('Delete'),
                                    ],
                                  ),
                                ),
                                // complete continear
                                background: Container(
                                  color: Colors.green,
                                  padding: const EdgeInsets.all(10),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.check),
                                      Text('Complete'),
                                    ],
                                  ),
                                ),
                                onDismissed: (direction) {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    // complete
                                    box.put(
                                        task.id,
                                        TaskModel(
                                            id: task.id,
                                            title: task.title,
                                            note: task.note,
                                            date: task.date,
                                            startTime: task.startTime,
                                            endTime: task.endTime,
                                            color: 3,
                                            isCompleted: true));
                                  } else {
                                    // delete
                                    box.delete(task.id);
                                  }
                                },
                                child: TaskCardItem(task: task));
                          },
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
