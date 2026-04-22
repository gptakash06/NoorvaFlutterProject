import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/glass_card.dart';
import '../controller/home_controller.dart';

class SuggestionSlider extends StatefulWidget {
  const SuggestionSlider({super.key});

  @override
  State<SuggestionSlider> createState() => _SuggestionSliderState();
}

class _SuggestionSliderState extends State<SuggestionSlider> {
  final HomeController controller = Get.find<HomeController>();

  late final PageController pageController;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    pageController = PageController();

    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (controller.currentSlider.value < controller.sliderData.length - 1) {
        controller.currentSlider.value++;
      } else {
        controller.currentSlider.value = 0;
      }

      pageController.animateToPage(
        controller.currentSlider.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.24,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: controller.sliderData.length,
              onPageChanged: (index) {
                controller.currentSlider.value = index;
              },
              itemBuilder: (context, index) {
                final item = controller.sliderData[index];

                return GlassCard(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: const Text(
                            'Priority conversation',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.012),

                        Text(
                          item['title']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenHeight * 0.028,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: screenHeight * 0.012),

                        Text(
                          item['desc']!,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: screenHeight * 0.018,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: screenHeight * 0.015),

          Obx(
                () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.sliderData.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: controller.currentSlider.value == index ? 16 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: controller.currentSlider.value == index
                        ? Colors.white
                        : Colors.white38,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}