import 'dart:convert';

class SaveUserResultModel {
  late final List questionIds;
  late final String questionType;
  late final int totalNoOfAttempted;
  late final int totalNoOfCorrectAnswered;
  late final int totalNoOfInCorrectAnswered;
  SaveUserResultModel({
    required this.questionIds,
    required this.questionType,
    required this.totalNoOfAttempted,
    required this.totalNoOfCorrectAnswered,
    required this.totalNoOfInCorrectAnswered,
  });

  SaveUserResultModel.fromJson(Map<String, dynamic> json) {
    questionIds = json['questionIds'];
    questionType = json['questionType'];
    totalNoOfAttempted = json['totalNoOfAttempted'];
    totalNoOfCorrectAnswered = json['totalNoOfCorrectAnswered'];
    totalNoOfInCorrectAnswered = json['totalNoOfInCorrectAnswered'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['questionIds'] = questionIds;
    _data['questionType'] = questionType;
    _data['totalNoOfAttempted'] = totalNoOfAttempted;
    _data['totalNoOfCorrectAnswered'] = totalNoOfCorrectAnswered;
    _data['totalNoOfInCorrectAnswered'] = totalNoOfInCorrectAnswered;
    return _data;
  }

  factory SaveUserResultModel.fromMap(Map<String, dynamic> map) {
    return SaveUserResultModel(
      questionIds: map['questionIds'] ?? [],
      questionType: map['questionType'] ?? '',
      totalNoOfAttempted: map['totalNoOfAttempted'] ?? 0,
      totalNoOfCorrectAnswered: map['totalNoOfCorrectAnswered'] ?? 0,
      totalNoOfInCorrectAnswered: map['totalNoOfInCorrectAnswered'] ?? 0,
    );
  }

  factory SaveUserResultModel.from(String source) =>
      SaveUserResultModel.fromMap(json.decode(source));
}
