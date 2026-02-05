import 'package:chat_bot/app/data/gemine_model.dart';
// Import your ChatMessage model
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({
    this.error,
    this.isLoading = false,
    this.geminiModel,
    // Initialize as an empty list
  });

  final String? error;
  final bool? isLoading;
  final GeminiModel? geminiModel;
  // Added this to track chat history

  HomeState copyWith({
    String? error,
    bool? isLoading,
    GeminiModel? geminiModel,
  }) => HomeState(
    error: error ?? this.error,
    isLoading: isLoading ?? this.isLoading,
    geminiModel: geminiModel ?? this.geminiModel,
  );

  @override
  List<Object?> get props => [error, isLoading, geminiModel];
}
