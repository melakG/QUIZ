import 'package:flutter_vision_client/constants/app_constant.dart';
import 'package:flutter_vision_client/models/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
      questionText: "When planning to pass other vehicles, you should?",
      listOfImagesIds: [
        ListOfImagesIds(sId: 'assets/images/choice_image.png'),
        ListOfImagesIds(sId: 'assets/images/question-image.png'),
        ListOfImagesIds(sId: 'assets/images/choice_image.png'),
        ListOfImagesIds(sId: 'assets/images/light.png')
      ],
      listOfChoicesIds: [
        ListOfChoicesIds(
            sId: "6342ab5b696c44413b2531f0",
            listOfImagesIds: [
              ListOfImagesIds(sId: 'assets/images/choice_image.png'),
              ListOfImagesIds(sId: 'assets/images/choice_image.png'),
              ListOfImagesIds(sId: 'assets/images/choice_image.png'),
            ],
            choiceText:
                "Assume they will start braking when they see you trying to pass  "),
        ListOfChoicesIds(
            sId: "6342ab5b696c44413b2531f3",
            choiceText:
                "Assume they will start braking when they see you trying to pass",
            listOfImagesIds: []),
        ListOfChoicesIds(
            choiceText:
                "Assume they will start braking when they see you trying to to pass",
            listOfImagesIds: [
              ListOfImagesIds(sId: 'assets/images/choice_image.png')
            ],
            sId: "6342ab5c696c44413b2531f7"),
        ListOfChoicesIds(
            choiceText:
                "Assume they will start braking when they see you trying to pass",
            listOfImagesIds: [
              ListOfImagesIds(
                sId: 'assets/images/choice_image.png',
              ),
              ListOfImagesIds(
                sId: 'assets/images/choice_image.png',
              ),
            ],
            sId: "6342ab5c696c44413b2531f7")
      ],
      answerId: AnswerId(
          sId: "6342ab5b696c44413b2531f0",
          explanation: "because At rerum facilis est et expedita distinctio!!!",
          listOfImagesIds: [ListOfImagesIds(sId: 'assets/images/light.png')])),
  QuestionModel(
      questionText:
          "  Assume they will start braking when they see you trying to pass  ?",
      listOfImagesIds: [],
      listOfChoicesIds: [
        ListOfChoicesIds(
            sId: "6342ab5b696c44413b2531f",
            listOfImagesIds: [],
            choiceText:
                "Assume they will start braking when they see you trying to pass "),
        ListOfChoicesIds(
            sId: "6342ab5b696c44413b2531f0",
            choiceText:
                "Assume they will start braking when they see you trying to pass",
            listOfImagesIds: [
              ListOfImagesIds(sId: choiceImageUrl),
              ListOfImagesIds(sId: choiceImageUrl)
            ]),
        ListOfChoicesIds(
            choiceText:
                "Assume they will start braking when they see you trying to pass  ",
            listOfImagesIds: [
              ListOfImagesIds(sId: choiceImageUrl),
              ListOfImagesIds(sId: choiceImageUrl),
              ListOfImagesIds(sId: choiceImageUrl),
            ],
            sId: "6342ab5c696c44413b2531f7")
      ],
      answerId: AnswerId(
          sId: "6342ab5b696c44413b2531f0",
          explanation:
              "Assume they will start braking when they see you trying to pass!!!",
          listOfImagesIds: [])),
  QuestionModel(
      questionText: "When planning to pass other vehicles, you should?",
      listOfImagesIds: [
        ListOfImagesIds(sId: questionImageUrl),
      ],
      listOfChoicesIds: [
        ListOfChoicesIds(
            sId: "6342ab5b696c44413b2531f0",
            listOfImagesIds: [
              ListOfImagesIds(sId: 'assets/images/choice_image.png'),
              ListOfImagesIds(sId: 'assets/images/choice_image.png'),
              ListOfImagesIds(sId: 'assets/images/choice_image.png'),
            ],
            choiceText:
                "Assume they will start braking when they see you trying to pass "),
        ListOfChoicesIds(
            sId: "6342ab5b696c44413b2531f3",
            choiceText:
                "Assume they will start braking when they see you trying to pass",
            listOfImagesIds: []),
        ListOfChoicesIds(
            choiceText:
                "Assume they will start braking when they see you trying to pass",
            listOfImagesIds: [
              ListOfImagesIds(sId: 'assets/images/choice_image.png')
            ],
            sId: "6342ab5c696c44413b2531f7"),
        ListOfChoicesIds(
            choiceText:
                "Assume they will start braking when they see you trying to pass",
            listOfImagesIds: [
              ListOfImagesIds(
                sId: 'assets/images/choice_image.png',
              ),
              ListOfImagesIds(
                sId: 'assets/images/choice_image.png',
              ),
            ],
            sId: "6342ab5c696c44413b2531f7")
      ],
      answerId: AnswerId(
          sId: "6342ab5b696c44413b2531f0",
          explanation: "because At rerum facilis est et expedita distinctio!!!",
          listOfImagesIds: [ListOfImagesIds(sId: 'assets/images/light.png')])),
];
