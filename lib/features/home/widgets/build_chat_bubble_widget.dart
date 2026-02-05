import 'package:chat_bot/app/models/gemine_model/gemine_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final bool isUser;

  const ChatBubble({
    super.key,

    required this.isUser,
    required this.geminiModel,
  });
  final GemineModel geminiModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isUser ? const Color(0xFF2F66F6) : const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: isUser
                ? const Radius.circular(18)
                : const Radius.circular(4),
            bottomRight: isUser
                ? const Radius.circular(4)
                : const Radius.circular(18),
          ),
        ),
        child: Text(
          geminiModel.candidates?.first.content?.parts?.first.text ?? '',
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ),
    );
  }
}
