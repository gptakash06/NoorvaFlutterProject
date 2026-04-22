import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../controller/home_controller.dart';
import '../widgets/suggestion_slider.dart';
import '../../../../common_widgets/circle_icon_button.dart';
import '../../../../common_widgets/bottom_chat_bar.dart';
import '../../../../common_widgets/glass_card.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.045),
          child: Stack(
            children: [
              Positioned(
                bottom: height * 0.10,
                right: -width * 0.05,
                child: Hero(
                  tag: 'wizard',
                  child: Image.asset(
                    AppAssets.wizard,
                    height: height * 0.48,
                  ),
                ),
              ),

              Column(
                children: [
                  SizedBox(height: height * 0.015),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleIconButton(icon: Icons.menu),
                      CircleIconButton(icon: Icons.notifications_none),
                    ],
                  ),

                  SizedBox(height: height * 0.06),

                  SizedBox(
                    width: width * 0.58,
                    child: GlassCard(
                      child: Column(
                        children: [
                          Text(
                            'Hey Rakesh',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.07,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            'You need to look into your weekend marathon training plan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: width * 0.038,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  Expanded(
                    child: Obx(
                          () => ListView.builder(
                        itemCount: controller.messages.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          final msg =
                          controller.messages.reversed.toList()[index];

                          return Align(
                            alignment: msg.isUser
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: height * 0.006,
                              ),
                              padding: EdgeInsets.all(width * 0.03),
                              decoration: BoxDecoration(
                                color: msg.isUser
                                    ? Colors.blueGrey
                                    : Colors.white10,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                msg.message,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      controller.nextSlide();
                      Get.toNamed(AppRoutes.guide);
                    },
                    child: const SuggestionSlider(),
                  ),

                  SizedBox(height: height * 0.02),

                  const BottomChatBar(),

                  SizedBox(height: height * 0.015),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}