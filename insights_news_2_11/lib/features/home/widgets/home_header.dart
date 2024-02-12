import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insights_news_2_11/core/services/local_storage.dart';
import 'package:insights_news_2_11/core/utils/text_styles.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? name;
  String? path;
  @override
  void initState() {
    super.initState();
    AppLocal.getCachedData(AppLocal.IMAGE_KEY).then((value) {
      setState(() {
        path = value;
      });
    });
    AppLocal.getCachedData(AppLocal.NAME_KEY).then((value) {
      setState(() {
        name = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $name',
              style: getTitleStyle(),
            ),
            Text(
              'Have A Nice Day',
              style: getBodyStyle(),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          backgroundImage: path != null
              ? FileImage(File(path!)) as ImageProvider
              : const AssetImage('assets/user.png'),
        )
      ],
    );
  }
}
