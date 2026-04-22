import 'package:get/get.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/home/presentation/guide_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () =>  HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.guide,
      page: () => const GuideScreen(),
    ),
  ];
}