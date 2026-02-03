import 'package:chat_bot/features/home/widgets/build__chat_app_bar_widget.dart';
import 'package:chat_bot/features/home/widgets/build_input_text.dart';
import 'package:chat_bot/features/home/widgets/build_suggetion_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildChatAppBar(context),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const BuildSuggetionWidget(),
              ),
            ),
            BuildInputText(),
          ],
        ),
      ),
    );
  }
}
