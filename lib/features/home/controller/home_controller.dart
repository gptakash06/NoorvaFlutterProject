import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/chat_message_model.dart';

class HomeController extends GetxController {
  RxInt currentSlider = 0.obs;

  TextEditingController chatController = TextEditingController();

  RxList<ChatMessageModel> messages = <ChatMessageModel>[].obs;

  final sliderData = [
    {
      "title": "Help me plan my weekend marathon",
      "desc": "A wise choice—preparation shapes endurance."
    },
    {
      "title": "Guide my focus today",
      "desc": "Small steps shape bigger wins."
    },
  ];

  void nextSlide() {
    if (currentSlider.value < sliderData.length - 1) {
      currentSlider.value++;
    } else {
      currentSlider.value = 0;
    }
  }

  void sendMessage() {
    final text = chatController.text.trim();

    if (text.isEmpty) return;

    messages.add(
      ChatMessageModel(
        message: text,
        isUser: true,
      ),
    );

    chatController.clear();

    Future.delayed(const Duration(milliseconds: 500), () {
      messages.add(
        ChatMessageModel(
          message: "Noorva response for: $text",
          isUser: false,
        ),
      );
    });
  }
}