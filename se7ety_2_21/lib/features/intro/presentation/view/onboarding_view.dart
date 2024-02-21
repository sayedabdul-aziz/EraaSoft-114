import 'package:flutter/material.dart';
import 'package:se7ety_2_21/core/functions/routing.dart';
import 'package:se7ety_2_21/core/utils/app_colors.dart';
import 'package:se7ety_2_21/core/utils/text_styles.dart';
import 'package:se7ety_2_21/core/widgets/custom_button.dart';
import 'package:se7ety_2_21/features/intro/data/onboarding_model.dart';
import 'package:se7ety_2_21/features/intro/presentation/view/welcom_view.dart';
import 'package:se7ety_2_21/features/intro/presentation/widgets/onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List<OnboardingModel> pages = [
    OnboardingModel(
        image: 'assets/on1.svg',
        title: 'ابحث عن دكتور متخصص',
        body:
            'اكتشف مجموعة واسعة من الأطباء الخبراء والمتخصصين في مختلف المجالات.'),
    OnboardingModel(
        image: 'assets/on2.svg',
        title: 'سهولة الحجز',
        body: 'احجز المواعيد بضغطة زرار في أي وقت وفي أي مكان.'),
    OnboardingModel(
        image: 'assets/on3.svg',
        title: 'آمن وسري',
        body: 'كن مطمئنًا لأن خصوصيتك وأمانك هما أهم أولوياتنا.')
  ];

  var pageController = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          TextButton(
              onPressed: () {
                pushWithReplacment(context, const WelcomeView());
              },
              child: Text(
                'تخطي',
                style: getbodyStyle(color: AppColors.color1),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                controller: pageController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return OnboardingItem(model: pages[index]);
                },
              ),
            ),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: WormEffect(
                      activeDotColor: AppColors.color1,
                      dotHeight: 10,
                    ),
                  ),
                  const Spacer(),

                  // if last page
                  (index == pages.length - 1)
                      ? CustomButton(
                          text: 'هيا بنا',
                          onPressed: () {
                            pushWithReplacment(context, const WelcomeView());
                          },
                        )
                      : const SizedBox()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
