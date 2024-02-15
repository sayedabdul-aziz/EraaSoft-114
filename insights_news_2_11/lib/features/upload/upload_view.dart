import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news_2_11/core/functions/dialogs.dart';
import 'package:insights_news_2_11/core/functions/routing.dart';
import 'package:insights_news_2_11/core/services/local_storage.dart';
import 'package:insights_news_2_11/core/utils/app_colors.dart';
import 'package:insights_news_2_11/core/utils/text_styles.dart';
import 'package:insights_news_2_11/core/widgets/custom_btn.dart';
import 'package:insights_news_2_11/features/home/presentation/view/nav_bar.dart';

String? path;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                // image and name
                // no image
                // no name
                // no image and no name
                if (path != null && name.isNotEmpty) {
                  AppLocal.cacheData(AppLocal.IMAGE_KEY, path);
                  AppLocal.cacheData(AppLocal.NAME_KEY, name);
                  AppLocal.cacheData(AppLocal.ISUPLOAD_KEY, true);
                  pushWithReplacment(context, const NavBarWidget());
                } else if (path == null && name.isNotEmpty) {
                  showErrorDialog(context, 'Please Upload Your image');
                } else if (path != null && name.isEmpty) {
                  showErrorDialog(context, 'Enter Your Name');
                } else {
                  showErrorDialog(
                      context, 'Please Upload Your image and Enter Your Name');
                }
              },
              child: const Text('Done'))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: (path != null)
                    ? FileImage(File(path!)) as ImageProvider
                    : const AssetImage(
                        'assets/user.png',
                      ),
              ),
              const Gap(20),
              SizedBox(
                  width: 220,
                  height: 45,
                  child: CustomButton(
                      text: 'Upload From Camera',
                      onPressed: () {
                        uploadFromCamera();
                      })),
              const Gap(7),
              SizedBox(
                  width: 220,
                  height: 45,
                  child: CustomButton(
                      text: 'Upload From Gallery',
                      onPressed: () {
                        uploadFromGallery();
                      })),
              const Gap(20),
              Divider(
                thickness: .5,
                endIndent: 20,
                indent: 20,
                color: AppColors.lemonadaColor,
              ),
              const Gap(20),
              TextFormField(
                style: getBodyStyle(),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColors.lemonadaColor,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  uploadFromCamera() async {
    // OPEN CAMERA AND PICK IMAGE
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }

  uploadFromGallery() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
