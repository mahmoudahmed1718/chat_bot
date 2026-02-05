import 'package:chat_bot/app/models/gemine_model/gemine_model.dart';
// Import your ChatMessage model
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({
    this.error,
    this.isLoading = false,
    this.isChatting = false,
    this.geminiModel,
    // Initialize as an empty list
  });

  final String? error;
  final bool? isLoading;
  final bool isChatting;
  final GemineModel? geminiModel;
  // Added this to track chat history

  HomeState copyWith({
    String? error,
    bool? isLoading,
    GemineModel? geminiModel,
    bool? isChatting,
  }) => HomeState(
    error: error ?? this.error,
    isLoading: isLoading ?? this.isLoading,
    geminiModel: geminiModel ?? this.geminiModel,
    isChatting: isChatting ?? this.isChatting,
  );

  @override
  List<Object?> get props => [error, isLoading, geminiModel, isChatting];
}
