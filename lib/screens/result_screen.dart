import 'package:flutter/material.dart';
import '../screens/profile_screen.dart';
import '../components/buttons.dart';
import '../components/missed_question.dart';
import '../components/statistics_card.dart';
import '../components/card.dart';
import '../constants/app_constant.dart';
import '../theme/app_theme.dart';
import '../constants/button_constant.dart';

class ResultScreen extends StatefulWidget {
  final List missedQuestions;
  final int totalNoOfInCorrectAnswered;
  final int totalNoOfCorrectAnswered;
  final int totalNoOfAttempted;
  final QuizType quizType;
  const ResultScreen({
    super.key,
    required this.totalNoOfInCorrectAnswered,
    required this.totalNoOfCorrectAnswered,
    required this.totalNoOfAttempted,
    required this.missedQuestions,
    required this.quizType,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var inCorrectedQuestions = [];
  double scoreInPercent = 0.0;

  @override
  void initState() {
    super.initState();
    inCorrectedQuestions = widget.missedQuestions;
    scoreInPercent = double.parse(
        ((widget.totalNoOfCorrectAnswered / widget.totalNoOfAttempted) * 100)
            .toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned(
        left: 0,
        right: 0,
        child: CardWithAvatar(
            scoreInPercent: scoreInPercent,
            title: registrationCardTitle,
            navto: registrationCardNavto,
            imageUrl: registrationCardImgUrl,
            type: CardType.result),
      ),
      Positioned(
        left: 32,
        right: 32,
        top: 241,
        child: StaticsCard(
            quizType: widget.quizType,
            totalNoOfAttempted: widget.totalNoOfAttempted,
            totalNoOfCorrectAnswered: widget.totalNoOfCorrectAnswered),
      ),
      Positioned(
        left: 32,
        right: 32,
        top: 400,
        bottom: 0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 28,
                  width: 318,
                  child: Text(
                    "${widget.totalNoOfInCorrectAnswered}. $questionsYouHaveMissedText",
                    style: const TextStyle(
                        color: Color.fromRGBO(65, 92, 74, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  )),
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (inCorrectedQuestions.isNotEmpty)
                        for (int i = 0; i < inCorrectedQuestions.length; i++)
                          MissedQuestion(
                              correctAnswer: inCorrectedQuestions[i]['answerId']
                                  ['explanation'],
                              image: inCorrectedQuestions[i]['answerId']
                                  ['listOfImagesIds'],
                              questionNumber: (i + 1).toString(),
                              questionText: inCorrectedQuestions[i]
                                  ['questionText'])
                    ]),
              ),
              Container(
                  width: 330,
                  height: 160,
                  margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  decoration: BoxDecoration(
                      borderRadius: AppTheme.statisticsCardBorderRadius,
                      border: Border.all(color: AppTheme.lightGrey)),
                  child: Column(children: [
                    Container(
                      width: 281,
                      height: 45,
                      margin: const EdgeInsets.fromLTRB(30, 15, 19, 0),
                      child: const Text(tryAgainText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, color: AppTheme.lightGreen)),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                      alignment: Alignment.center,
                      child: ReusableButtons(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen(
                                        quizType: widget.quizType,
                                        showNumberOfQuestionModal: true,
                                        modalOpen: false,
                                      )));
                        },
                        title: tryAgainButtonTitle,
                        gradientColor: AppTheme.tryAgainButtonGradientColor,
                        textColor: AppTheme.darkGreen,
                        buttonFontStyle: AppTheme.tryAgainButtonFontStyle,
                        buttonType: ButtonType.tryAgainButton,
                      ),
                    )
                  ])),
            ],
          ),
        ),
      )
    ]));
  }
}
