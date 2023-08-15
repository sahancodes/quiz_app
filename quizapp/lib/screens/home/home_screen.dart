import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:frontend/configs/themes/ui_parameters.dart';
import 'package:frontend/controllers/questionpaper/question_paper_controller.dart';
import 'package:frontend/screens/home/question_card.dart';
import 'package:frontend/widgets/content_area.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
        body: ContentArea(
      addPadding: false,
      child: Obx(() => ListView.separated(
          padding: UIParameters.mobileScreenPadding,
          itemBuilder: (BuildContext context, int index) {
            return QuestionCard(
              model: _questionPaperController.allPapers[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: _questionPaperController.allPapers.length)),
    ));
  }
}
