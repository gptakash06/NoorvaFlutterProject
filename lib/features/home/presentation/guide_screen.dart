import 'package:flutter/material.dart';
import '../../../../common_widgets/circle_icon_button.dart';
import '../../../../common_widgets/bottom_chat_bar.dart';
import '../../../../common_widgets/glass_card.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Stack(
            children: [
              Positioned(
                bottom: 90,
                right: -10,
                child: Hero(
                  tag: 'wizard',
                  child: Image.asset(
                    AppAssets.wizard,
                    height: 430,
                  ),
                ),
              ),

              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircleIconButton(icon: Icons.menu),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const Text(
                          'Noorva Guide',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const CircleIconButton(icon: Icons.edit),
                    ],
                  ),

                  const SizedBox(height: 80),

                  const SizedBox(
                    width: 240,
                    child: GlassCard(
                      child: Text(
                        'I see you are ready for guidance. I will walk with you from here.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const Spacer(),

                  const BottomChatBar(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}