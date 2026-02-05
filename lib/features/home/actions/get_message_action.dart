import 'package:api_request/api_request.dart';

class GetMessageAction extends ApiRequestAction<GeminiResponse> {
  @override
  String get path => 'v1beta/models/gemini-3-flash-preview:generateContent';

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  ResponseBuilder<GeminiResponse> get responseBuilder =>
      (json) => GeminiResponse.fromJson(json);
}

class GeminiResponse {
  String? text;
  String? finishReason;
  int? index;
  String? role;
  int? promptTokenCount;
  int? candidatesTokenCount;
  int? totalTokenCount;
  int? thoughtsTokenCount;

  String? modelVersion;
  String? responseId;

  int? errorCode;
  String? errorMessage;
  String? errorStatus;

  bool get hasError => errorMessage != null;

  GeminiResponse.fromJson(Map<String, dynamic> json) {
    // ---------- ERROR ----------
    if (json['error'] != null) {
      errorCode = json['error']['code'];
      errorMessage = json['error']['message'];
      errorStatus = json['error']['status'];
      return;
    }

    // ---------- SUCCESS ----------
    text = json['candidates']?[0]?['content']?['parts']?[0]?['text'];
    finishReason = json['candidates']?[0]?['finishReason'];
    index = json['candidates']?[0]?['index'];
    role = json['candidates']?[0]?['content']?['role'];
    promptTokenCount = json['usageMetadata']?['promptTokenCount'];
    candidatesTokenCount = json['usageMetadata']?['candidatesTokenCount'];
    totalTokenCount = json['usageMetadata']?['totalTokenCount'];
    thoughtsTokenCount = json['usageMetadata']?['thoughtsTokenCount'];

    modelVersion = json['modelVersion'];
    responseId = json['responseId'];
  }
}
