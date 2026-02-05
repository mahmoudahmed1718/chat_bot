import 'package:chat_bot/app/models/gemine_model/gemine_model.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({
    this.error,
    this.isLoading = false,
    this.isChatting = false,
    this.geminiModel,
    this.messages = const [], // Correct
  });

  final String? error;
  final bool? isLoading;
  final bool isChatting;
  final GemineModel? geminiModel;
  final List<ChatMessage>? messages;

  HomeState copyWith({
    String? error,
    bool? isLoading,
    GemineModel? geminiModel,
    bool? isChatting,
    List<ChatMessage>? messages, // FIXED: Changed from List<Widget>
  }) => HomeState(
    error: error ?? this.error,
    isLoading: isLoading ?? this.isLoading,
    geminiModel: geminiModel ?? this.geminiModel,
    isChatting: isChatting ?? this.isChatting,
    messages: messages ?? this.messages, // FIXED: Added this line
  );

  List<Object?> get props => [
    error,

    isLoading,

    geminiModel,

    isChatting,

    messages,
  ];
}

class ChatMessage {
  final String text;
  final bool isUser;
  ChatMessage({required this.text, required this.isUser});
}
