import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../features/home/controller/home_controller.dart';

class BottomChatBar extends StatelessWidget {
  const BottomChatBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.035,
        vertical: width * 0.03,
      ),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          TextField(
            controller: controller.chatController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'Ask Noorva Anything',
              hintStyle: AppTextStyles.body,
              border: InputBorder.none,
            ),
          ),

          SizedBox(height: width * 0.03),

          Row(
            children: [
              _icon(Icons.attach_file),

              SizedBox(width: width * 0.03),

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                    vertical: width * 0.025,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Guide',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: width * 0.03),

              GestureDetector(
                onTap: controller.sendMessage,
                child: _icon(Icons.send),
              ),

              SizedBox(width: width * 0.025),

              _icon(Icons.mic),
            ],
          )
        ],
      ),
    );
  }

  static Widget _icon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white10,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}