import 'package:frontend/controllers/questionpaper/question_paper_controller.dart';
import 'package:frontend/controllers/zoom_drawer_controller.dart';
import 'package:frontend/screens/home/home_screen.dart';
import 'package:frontend/screens/introduction/introduction.dart';
import 'package:frontend/screens/login/login_screen.dart';
import '../screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
            name: "/introduction", page: () => const AppIntroductionScreen()),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
              Get.put(MyZoomDrawerController());
            })),
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen())
      ];
}
