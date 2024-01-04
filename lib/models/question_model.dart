class QuestionModel {
  String? questionText;
  List<ListOfImagesIds>? listOfImagesIds;
  List<ListOfChoicesIds>? listOfChoicesIds;
  String? creatorAdminId;
  AnswerId? answerId;
  int? questionNumber;

  QuestionModel(
      {this.questionText,
      this.listOfImagesIds,
      this.listOfChoicesIds,
      this.creatorAdminId,
      this.answerId,
      this.questionNumber});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    questionText = json['questionText'];
    if (json['listOfImagesIds'] != null) {
      listOfImagesIds = <ListOfImagesIds>[];
      json['listOfImagesIds'].forEach((value) {
        listOfImagesIds!.add(ListOfImagesIds.fromJson(value));
      });
    }
    if (json['listOfChoicesIds'] != null) {
      listOfChoicesIds = <ListOfChoicesIds>[];
      json['listOfChoicesIds'].forEach((value) {
        listOfChoicesIds!.add(ListOfChoicesIds.fromJson(value));
      });
    }
    creatorAdminId = json['creatorAdminId'];
    answerId =
        json['answerId'] != null ? AnswerId.fromJson(json['answerId']) : null;
    questionNumber = json['questionNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['questionText'] = questionText;
    if (listOfImagesIds != null) {
      data['listOfImagesIds'] =
          listOfImagesIds!.map((value) => value.toJson()).toList();
    }
    if (listOfChoicesIds != null) {
      data['listOfChoicesIds'] =
          listOfChoicesIds!.map((value) => value.toJson()).toList();
    }
    data['creatorAdminId'] = creatorAdminId;
    if (answerId != null) {
      data['answerId'] = answerId!.toJson();
    }
    data['questionNumber'] = questionNumber;
    return data;
  }
}

class ListOfImagesIds {
  String? sId;

  ListOfImagesIds({this.sId});

  ListOfImagesIds.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    return data;
  }
}

class ListOfChoicesIds {
  String? sId;
  String? choiceText;
  List<ListOfImagesIds>? listOfImagesIds;

  ListOfChoicesIds({this.sId, this.choiceText, this.listOfImagesIds});

  ListOfChoicesIds.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    choiceText = json['choiceText'];
    if (json['listOfImagesIds'] != null) {
      listOfImagesIds = <ListOfImagesIds>[];
      json['listOfImagesIds'].forEach((value) {
        listOfImagesIds!.add(ListOfImagesIds.fromJson(value));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['choiceText'] = choiceText;
    if (listOfImagesIds != null) {
      data['listOfImagesIds'] =
          listOfImagesIds!.map((value) => value.toJson()).toList();
    }
    return data;
  }
}

class AnswerId {
  String? sId;
  String? explanation;
  List<ListOfImagesIds>? listOfImagesIds;

  AnswerId({this.sId, this.explanation, this.listOfImagesIds});

  AnswerId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    explanation = json['explanation'];
    if (json['listOfImagesIds'] != null) {
      listOfImagesIds = <ListOfImagesIds>[];
      json['listOfImagesIds'].forEach((value) {
        listOfImagesIds!.add(ListOfImagesIds.fromJson(value));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['explanation'] = explanation;
    if (listOfImagesIds != null) {
      data['listOfImagesIds'] =
          listOfImagesIds!.map((value) => value.toJson()).toList();
    }
    return data;
  }
}
