import 'package:chat_bot/features/home/actions/get_message_action.dart';

import 'candidate.dart';
import 'usage_metadata.dart';

class GemineModel {
  List<Candidate>? candidates;
  UsageMetadata? usageMetadata;
  String? modelVersion;
  String? responseId;

  GemineModel({
    this.candidates,
    this.usageMetadata,
    this.modelVersion,
    this.responseId,
  });

  factory GemineModel.fromJson(GeminiResponse json) => GemineModel(
    candidates: json.candidates?.map((e) => Candidate.fromJson(e)).toList(),

    modelVersion: json.modelVersion,
    responseId: json.responseId,
  );

  Map<String, dynamic> toJson() => {
    'candidates': candidates?.map((e) => e.toJson()).toList(),
    'usageMetadata': usageMetadata?.toJson(),
    'modelVersion': modelVersion,
    'responseId': responseId,
  };
}
