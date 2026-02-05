import 'package:chat_bot/features/home/actions/get_message_action.dart';

class GeminiModel {
  String? text;
  String? role;
  String? finishReason;

  int? totalTokens;
  String? modelVersion;

  bool? hasError;
  String? errorMessage;

  GeminiModel({
    this.text,
    this.role,
    this.finishReason,
    this.totalTokens,
    this.modelVersion,
    this.hasError,
    this.errorMessage,
  });

  GeminiModel.fromJson(GeminiResponse json) {
    hasError = json.hasError;
    errorMessage = json.errorMessage;
    text = json.text;
    role = json.role;
    finishReason = json.finishReason;
    totalTokens = json.totalTokenCount;
    modelVersion = json.modelVersion;
  }
}
