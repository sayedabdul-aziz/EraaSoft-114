import 'package:flutter/material.dart';
import 'package:session_3/app_colors.dart';
import 'package:session_3/result_view.dart';

class BmiView extends StatefulWidget {
  const BmiView({super.key});

  @override
  State<BmiView> createState() => _BmiViewState();
}

class _BmiViewState extends State<BmiView> {
  int age = 19;
  int weight = 60;
  int height = 150;
  bool isMale = true;

  Color getColor(bool isMale) {
    // if (isMale) {
    //   return AppColors.redColor;
    // } else {
    //   return AppColors.containerColor;
    // }
    Color color = (isMale) ? AppColors.redColor : AppColors.containerColor;
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR APP',
          style: TextStyle(color: AppColors.whiteColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // male
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: (isMale)
                              ? AppColors.redColor
                              : AppColors.containerColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male_rounded,
                                size: 40, color: AppColors.whiteColor),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Male',
                              style: TextStyle(
                                  color: AppColors.whiteColor, fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: (isMale)
                              ? AppColors.containerColor
                              : AppColors.redColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.female_rounded,
                                size: 40, color: AppColors.whiteColor),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                  color: AppColors.whiteColor, fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
            //height
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: AppColors.containerColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(
                            color: AppColors.whiteColor, fontSize: 20),
                      ),
                      Text(
                        '$height cm',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor),
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 90,
                        max: 220,
                        thumbColor: AppColors.redColor,
                        activeColor: AppColors.redColor,
                        inactiveColor: AppColors.btnColor,
                        onChanged: (value) {
                          setState(() {
                            height = value.toInt();
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            // age and weight
            Expanded(
                child: Row(
              children: [
                //age =============
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 20),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: AppColors.whiteColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  style: IconButton.styleFrom(
                                    backgroundColor: AppColors.btnColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: AppColors.whiteColor,
                                  )),
                              const SizedBox(width: 20),
                              IconButton(
                                  style: IconButton.styleFrom(
                                    backgroundColor: AppColors.btnColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: AppColors.whiteColor,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        color: AppColors.containerColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                                color: AppColors.whiteColor, fontSize: 20),
                          ),
                          Text(
                            '$weight KG',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: AppColors.whiteColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  style: IconButton.styleFrom(
                                    backgroundColor: AppColors.btnColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: AppColors.whiteColor,
                                  )),
                              const SizedBox(width: 20),
                              IconButton(
                                  style: IconButton.styleFrom(
                                    backgroundColor: AppColors.btnColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: AppColors.whiteColor,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
            //btn
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
                      double res = weight / (height * .01 * height * .01);
                      // navigate to a new screen
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ResultView(res: res),
                      ));
                    },
                    child: const Text('CALCULATE')))
          ],
        ),
      ),
    );
  }
}
