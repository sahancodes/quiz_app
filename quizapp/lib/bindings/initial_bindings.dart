import 'package:frontend/controllers/auth_controller.dart';
import 'package:frontend/controllers/theme_controller.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}
