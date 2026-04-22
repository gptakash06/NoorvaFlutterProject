import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noorva_flutter_project/routes/app_pages.dart';
import 'package:noorva_flutter_project/routes/app_routes.dart';
import 'core/constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noorva',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bg,
      ),
      initialRoute: AppRoutes.home,
      getPages: AppPages.routes,
    );
  }
}