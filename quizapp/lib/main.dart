import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend/bindings/initial_bindings.dart';
import 'package:frontend/configs/themes/app_light_theme.dart';
import 'package:frontend/controllers/questionpaper/data_uploader_screen.dart';
import 'package:frontend/controllers/theme_controller.dart';
import 'package:frontend/firebase_options.dart';
import 'package:frontend/routes/app_routes.dart';
import 'package:frontend/screens/introduction/introduction.dart';
import 'package:frontend/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

import 'configs/themes/app_dark_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().lightTheme,
      getPages: AppRoutes.routes(),
    );
  }
}

/* Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(home: DataUploaderScreen()));
} */
