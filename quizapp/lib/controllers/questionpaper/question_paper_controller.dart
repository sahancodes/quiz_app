import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/firebase_ref/references.dart';
import 'package:frontend/models/question_paper_model.dart';
import 'package:frontend/services/firebase_storage_service.dart';
import 'package:get/get.dart';

import '../auth_controller.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  FirebaseStorageService firebaseStore = Get.put(FirebaseStorageService());

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl = await firebaseStore
            .getImage(paper.title); //Get complete image path from firebase
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
    print(allPaperImages);
  }

  void navigateToQuestions(
      {required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        //Get.offNamed();
      } else {
        //Get.toNamed();
      }
    } else {
      print("The title is ${paper.title}");
      _authController.showLoginAlertDialog();
    }
  }
}
