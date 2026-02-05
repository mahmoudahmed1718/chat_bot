import 'package:chat_bot/app/data/gemine_model.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({this.error, this.isLoading, this.geminiModel});
  final String? error;
  final bool? isLoading;
  final GeminiModel? geminiModel;
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
