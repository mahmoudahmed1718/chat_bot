import 'package:chat_bot/features/home/bloc/home_bloc.dart';
import 'package:chat_bot/features/home/bloc/home_state.dart';
import 'package:chat_bot/features/home/widgets/build__chat_app_bar_widget.dart';
import 'package:chat_bot/features/home/widgets/build_chat_bubble_widget.dart';
import 'package:chat_bot/features/home/widgets/build_input_text.dart';
import 'package:chat_bot/features/home/widgets/build_suggetion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

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
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: HomeBloc.to,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Expanded(
                    child: state.isChatting
                        ? ListView.builder(
                            itemCount:
                                state.geminiModel?.candidates?.length ?? 0,
                            itemBuilder: (context, index) {
                              return ChatBubble(
                                isUser: false,
                                geminiModel: state.geminiModel!,
                              );
                            },
                          )
                        : const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: SingleChildScrollView(
                              child: BuildSuggetionWidget(),
                            ),
                          ),
                  ),
                  BuildInputText(),
                  const Gap(16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
