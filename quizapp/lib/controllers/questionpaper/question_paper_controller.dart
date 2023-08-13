import 'package:frontend/services/firebase_storage_service.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  FirebaseStorageService fireStore = Get.put(FirebaseStorageService());

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];
    try {
      for (var img in imgName) {
        final imgUrl = await fireStore
            .getImage(img); //Get complete image path from firebase
        allPaperImages.add(imgUrl!);
      }
    } catch (e) {
      print(e);
    }
    print(allPaperImages);
  }
}
