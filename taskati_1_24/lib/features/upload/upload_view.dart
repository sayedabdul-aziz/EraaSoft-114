import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati_1_24/core/utils/app_colors.dart';
import 'package:taskati_1_24/core/widgets/custom_btn.dart';

String? path;

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
        actions: [TextButton(onPressed: () {}, child: const Text('Done'))],
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
                  width: 200,
                  height: 45,
                  child: CustomButton(
                      text: 'Upload From Camera',
                      onPressed: () {
                        uploadFromCamera();
                      })),
              const Gap(7),
              SizedBox(
                  width: 200,
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
                color: AppColors.primaryColor,
              ),
              const Gap(20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.primaryColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.primaryColor)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.redColor)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: AppColors.redColor)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  uploadFromCamera() async {
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
