import 'package:flutter/material.dart';
import 'package:frontend/controllers/questionpaper/data_uploader.dart';
import 'package:frontend/firebase_ref/loading_status.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});

  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Obx(() => Text(
          controller.loadingStatus.value == LoadingStatus.completed
              ? "Upload completed!"
              : "Uploading in Progress..")),
    ));
  }
}
