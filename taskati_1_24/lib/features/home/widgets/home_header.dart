import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati_1_24/core/network/local_storage.dart';
import 'package:taskati_1_24/core/utils/text_styles.dart';

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
    path = AppLocal.getCachedData(AppLocal.IMAGE_KEY);
    name = AppLocal.getCachedData(AppLocal.NAME_KEY);
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
