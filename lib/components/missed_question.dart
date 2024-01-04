import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../constants/app_constant.dart';
import '../theme/app_theme.dart';

class MissedQuestion extends StatefulWidget {
  final String questionNumber;
  final String questionText;
  final String correctAnswer;
  final List image;
  const MissedQuestion(
      {super.key,
      required this.questionNumber,
      required this.image,
      required this.questionText,
      required this.correctAnswer});

  @override
  State<MissedQuestion> createState() => _MissedQuestionState();
}

class _MissedQuestionState extends State<MissedQuestion> {
  bool viewQuestion = false;
  var listOfImage = [];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.image.length; i++) {
      ApiClient.getImage(widget.image[i]['_id'], context).then((value) => {
            setState(() {
              listOfImage.add(value['image']['data']['data']);
            })
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return viewQuestion == false
        ? Container(
            width: AppTheme.questionCardWidth,
            height: AppTheme.questionCardClosedHeight,
            margin: AppTheme.questionCardMargin,
            padding: AppTheme.questionCardPadding,
            decoration: BoxDecoration(
                borderRadius: AppTheme.statisticsCardBorderRadius,
                border: AppTheme.questionCardBorder),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.questionNumber}.',
                      style: const TextStyle(
                          color: Color.fromRGBO(65, 92, 74, 1),
                          fontSize: 17,
                          fontWeight: FontWeight.w500)),
                  const Text(
                    questionText,
                    style: TextStyle(
                        color: Color.fromRGBO(65, 92, 74, 1),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Container(
                     transform: Matrix4.translationValues(0, -10.0, 0.0),
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          viewQuestion = !viewQuestion;
                        });
                      },
                      child: const Icon(
                        Icons.arrow_drop_down,
                        size: 40,
                        color: Color.fromRGBO(65, 92, 74, 1),
                      ),
                    ),
                  )
                ]),
          )
        : Container(
            width: AppTheme.questionCardWidth,
            margin: AppTheme.questionCardMargin,
            padding: AppTheme.questionCardPadding,
            decoration: BoxDecoration(
                borderRadius: AppTheme.statisticsCardBorderRadius,
                border: AppTheme.questionCardBorder),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${widget.questionNumber}.',
                          style: const TextStyle(
                              color: Color.fromRGBO(65, 92, 74, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w500)),
                      const Text(questionText,
                          style: TextStyle(
                              color: Color.fromRGBO(65, 92, 74, 1),
                              fontSize: 17,
                              fontWeight: FontWeight.w500)),
                      const Spacer(),
                      Container(
                         transform: Matrix4.translationValues(0, -10.0, 0.0),
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              viewQuestion = !viewQuestion;
                            });
                          },
                          child: const Icon(
                            Icons.arrow_drop_down,
                            size: 40,
                            color: Color.fromRGBO(65, 92, 74, 1),
                          ),
                        ),
                      )
                    ]),
                Container(
                    width: 294,
                    margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      widget.questionText,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(65, 92, 74, 1),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  child: const Text(
                    correctAnswerText,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 17, color: Color.fromRGBO(31, 223, 100, 1)),
                  ),
                ),
                widget.image.isEmpty
                    ? Container(
                        width: 294,                                                                                                                                                                                                                                              
                        child: Text(
                          widget.correctAnswer,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              color: Color.fromRGBO(65, 92, 74, 1),
                              fontSize: 17),
                        ),
                      )
                    : Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 100,
                              constraints: const BoxConstraints(minHeight: 90),
                              child: Image.memory(
                                Uint8List.fromList(listOfImage[0].cast<int>()!),
                               
                               
                              ),
                            ),
                            Container(
                              width: 151,
                              margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                widget.correctAnswer,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    color: Color.fromRGBO(65, 92, 74, 1),
                                    fontSize: 17),
                              ),
                            )
                          ],
                        ),
                      )
              ],
            ),
          );
  }
}
