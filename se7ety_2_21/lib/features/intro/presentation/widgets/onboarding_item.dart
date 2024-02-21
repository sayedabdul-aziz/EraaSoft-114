import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety_2_21/core/utils/text_styles.dart';
import 'package:se7ety_2_21/features/intro/data/onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
    required this.model,
  });

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // image
        const Spacer(
          flex: 1,
        ),
        SvgPicture.asset(
          model.image,
          width: 300,
        ),
        const Spacer(
          flex: 1,
        ),
        Text(
          model.title,
          style: getTitleStyle(),
        ),
        const Gap(20),
        Text(
          model.body,
          textAlign: TextAlign.center,
          style: getbodyStyle(),
        ),
        const Spacer(
          flex: 2,
        )
      ],
    );
  }
}
