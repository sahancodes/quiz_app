import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/firebase_ref/loading_status.dart';
import 'package:frontend/firebase_ref/references.dart';
import 'package:frontend/models/question_paper_model.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    //To upload data to the firebase backend but we do it only once
    //This will run once when the app starts for the first time
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs; //loadingStatus is observable

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading; //0

    final fireStore = FirebaseFirestore.instance;

    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json"); //! means not null

    final Map<String, dynamic> manifestMap = jsonDecode(manifestContent);

    //load json and print path
    final papersInAssets = manifestMap.keys
        .where((path) =>
            path.startsWith("assets/DB/papers") && path.contains(".json"))
        .toList();
    print(papersInAssets);

    List<QuestionPaperModel> questionPapers = [];

    for (var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      print(stringPaperContent);
      questionPapers
          .add(QuestionPaperModel.fromJson(jsonDecode(stringPaperContent)));
    }
    //print('Items number ${questionPapers[0].description}');

    var batch = fireStore.batch();

    for (var paper in questionPapers) {
      batch.set(questionPaperRF.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "Description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count": paper.questions == null ? 0 : paper.questions!.length
      });

      for (var questions in paper.questions!) {
        final questionPath =
            questionRF(paperId: paper.id, questionId: questions.id);
        batch.set(questionPath, {
          "question": questions.question,
          "correct_answer": questions.correctAnswer,
        });

        for (var answer in questions.answers) {
          batch.set(questionPath.collection("answers").doc(answer.identifier), {
            "identifier": answer.identifier,
            "answer": answer.answer,
          });
        }
      }
    }

    //1.31.43 youtube

    await batch.commit();
    print("Batch committed!");

    loadingStatus.value = LoadingStatus.completed;
  }
}
