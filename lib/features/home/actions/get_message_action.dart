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

  // Changed to List<dynamic> to match JSON structure
  List<dynamic>? candidates;
  String? modelVersion;
  String? responseId;

  int? errorCode;
  String? errorMessage;
  String? errorStatus;

  bool get hasError => errorMessage != null;

  GeminiResponse.fromJson(Map<String, dynamic> json) {
    // ---------- ERROR HANDLING ----------
    if (json['error'] != null) {
      errorCode = json['error']['code'];
      errorMessage = json['error']['message'];
      errorStatus = json['error']['status'];
      return;
    }

    // ---------- SUCCESS MAPPING ----------
    // Using explicit casting or null-aware operators for deep nesting
    final candidateList = json['candidates'] as List?;
    candidates = candidateList;

    if (candidateList != null && candidateList.isNotEmpty) {
      final firstCandidate = candidateList[0];
      final content = firstCandidate['content'];
      final parts = content?['parts'] as List?;

      text = (parts != null && parts.isNotEmpty) ? parts[0]['text'] : null;
      role = content?['role'];
      finishReason = firstCandidate['finishReason'];
      index = firstCandidate['index'];
    }

    // Mapping Usage Metadata
    final usage = json['usageMetadata'];
    if (usage != null) {
      promptTokenCount = usage['promptTokenCount'];
      candidatesTokenCount = usage['candidatesTokenCount'];
      totalTokenCount = usage['totalTokenCount'];
      thoughtsTokenCount = usage['thoughtsTokenCount'];
    }

    modelVersion = json['modelVersion'];
    responseId = json['responseId'];
  }
}
