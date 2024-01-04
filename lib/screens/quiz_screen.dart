import 'dart:convert';

import 'package:flutter/material.dart';
import '../components/loader.dart';
import '../models/save_user_result.dart';
import '../components/choiceCard.dart';
import '../components/question.dart';
import '../components/buttons.dart';
import '../components/explanation_card.dart';
import '../constants/app_constant.dart';
import '../constants/button_constant.dart';
import '../models/question_model.dart';
import '../screens/profile_screen.dart';
import '../screens/result_screen.dart';
import '../services/api_client.dart';
import '../theme/app_theme.dart';
import 'package:getwidget/getwidget.dart';

class QuizScreen extends StatefulWidget {
  final int numberOfQuestion;
  final QuizType quizType;
  const QuizScreen(
      {super.key, required this.numberOfQuestion, required this.quizType});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int result = 0;
  List<ListOfChoicesIds>? choice;
  PageController? _controller;
  bool btnPressed = false;
  bool isLoading = true;
  bool answerChosen = false;
  bool answered = false;
  bool showExplanation = false;
  var missedQuestions = [];
  var questions = [];
  List<dynamic> lisOfImage = [];
  var questionIds = [];
  late String questionType;
  int totalNoOfAttempted = 0;
  int totalNoOfCorrectAnswered = 0;
  int totalNoOfInCorrectAnswered = 0;
  String lastQuestionId = "";
  var allQuestionsId = [];
  @override
  void initState() {
    super.initState();
    if (widget.quizType == QuizType.practice) {
      getQuestionsForPractice();
      questionType = "forPractice";
    }
    if (widget.quizType == QuizType.quiz) {
      getQuestionsForQuiz();
      questionType = "forQuiz";
    }

    _controller = PageController(initialPage: 0);
  }

  var questionHasData;
  var data;
  getNextQuestion() async => {
        if (questions.length < allQuestionsId.length)
          {
            data = await ApiClient.getQuestionsData(allQuestionsId[2], context),
            setState(() {
              questions.add({"_id": data});
            }),
          }
      };
  
  getQuestionsForPractice() async => {
        ApiClient.getQuestionsForPractice(widget.numberOfQuestion, context)
            .then((value) => {
                  if (value == false)
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen(
                                    quizType: widget.quizType,
                                    modalOpen: true,
                                    showNumberOfQuestionModal: false,
                                  )))
                    }
                  else
                    {
                      setState(() {
                        totalNoOfAttempted = value.length;
                      }),
                      for (var i = 0; i < value.length; i++)
                        {
                          setState(() {
                            allQuestionsId.add(value[i]['_id']);
                          }),
                          questionHasData = value[i]['_id'] is String,
                          if (!questionHasData)
                            {
                              setState(() {
                                questions.add(value[i]);
                                isLoading = false;
                              }),
                            }
                        },
                    }
                }),
      };

  getQuestionsForQuiz() async => {
        ApiClient.getQuestionsForQuiz(widget.numberOfQuestion, context)
            .then((value) => {
                  if (value == false)
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen(
                                    quizType: widget.quizType,
                                    modalOpen: true,
                                    showNumberOfQuestionModal: false,
                                  )))
                    }
                  else
                  {
                      setState(() {
                        totalNoOfAttempted = value.length;
                      }),
                      for (var i = 0; i < value.length; i++)
                        {
                          setState(() {
                            allQuestionsId.add(value[i]['_id']);
                          }),
                          questionHasData = value[i]['_id'] is String,
                          if (!questionHasData)
                            {
                              setState(() {
                                questions.add(value[i]);
                                isLoading = false;
                              }),
                            }
                        },
                      totalNoOfAttempted = widget.numberOfQuestion,
                    }
                }),
      };

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            body: CircularLoader(),
          )
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(44),
              child: AppBar(
                elevation: 0,
                flexibleSpace: Container(
                  decoration:
                      const BoxDecoration(gradient: AppTheme.appBarGradient),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(0),
              child: PageView.builder(
                allowImplicitScrolling: true,
                itemCount: questions.length,
                controller: _controller,
                onPageChanged: ((page) {
                  if (page <= questions.length - 1) {
                    setState(() {
                      answered = false;
                    });
                  }
                }),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(0),
                          margin: const EdgeInsets.all(0),
                          child: GFProgressBar(
                            percentage: (index + 1) / allQuestionsId.length,
                            padding: const EdgeInsets.all(0),
                            margin: const EdgeInsets.all(0),
                            linearGradient: AppTheme.lightGreenButtonGradient,
                            width: MediaQuery.of(context).size.width,
                            backgroundColor:
                                const Color.fromARGB(255, 255, 253, 254),
                            progressBarColor:
                                const Color.fromARGB(255, 106, 211, 9),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(35, 10, 0, 31),
                          child: Row(children: const [
                            Icon(Icons.arrow_back,
                                size: 22, color: Colors.black),
                            Text(
                              quizTitle,
                              style: TextStyle(
                                  color: Color.fromRGBO(65, 92, 74, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 34.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                                '$question ${index + 1}/${allQuestionsId.length}',
                                style: AppTheme.labelTextStyle),
                          ),
                        ),
                        Question(
                          questionText: questions[index]['_id']
                              ['questionText']!,
                          listOfImage: questions[index]['_id']
                              ['listOfImagesIds']!,
                        ),
                        for (int i = 0;
                            i <
                                questions[index]['_id']['listOfChoicesIds']!
                                    .length;
                            i++)
                          Choice(
                            answerChosen: answerChosen,
                            choiceText: questions[index]['_id']
                                ['listOfChoicesIds']![i]['choiceText'],
                            isAnswer: questions[index]['_id']
                                ['listOfChoicesIds']![i]['isAnswer'],
                            listOfImage: questions[index]['_id']
                                ['listOfChoicesIds']![i]['listOfImagesIds']!,
                            onTap: () {
                              if (answerChosen == false) {
                                setState(() {
                                  answerChosen = true;
                                  if (questionIds.isEmpty ||
                                      questionIds.length < index + 1) {
                                    questionIds
                                        .add(questions[index]['_id']['_id']);
                                  }
                                  showExplanation = true;
                                });
                                if (questions[index]['_id']
                                    ['listOfChoicesIds']![i]['isAnswer']) {
                                  setState(() {
                                    result++;

                                    btnPressed = true;
                                    answered = true;
                                  });
                                } else {
                                  setState(() {
                                    totalNoOfInCorrectAnswered++;
                                    missedQuestions
                                        .add(questions[index]['_id']);
                                  });
                                }
                              }
                            },
                          ),
                        const SizedBox(
                          height: AppTheme.boxHeight * 2,
                        ),
                        showExplanation == true &&
                                widget.quizType == QuizType.practice
                            ? Container(
                                padding: const EdgeInsets.only(left: 15),
                                width: 380,
                                child: ExplanationCard(
                                  explanationText: questions[index]['_id']
                                      ['answerId']!['explanation'],
                                  explanationImage: questions[index]['_id']
                                      ['answerId']!['listOfImagesIds'],
                                ))
                            : Container(),
                        index >= 1
                            ? Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(32, 0, 32, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ReusableButtons(
                                        title: perviousButtonTitle,
                                        onTap: () {
                                          setState(() {
                                            answerChosen = false;
                                          });
                                          setState(() {
                                            _controller!.previousPage(
                                                duration: const Duration(
                                                    milliseconds:
                                                        pageDurationMilliSecond),
                                                curve: Curves.linear);
                                            setState(() {
                                              showExplanation = false;
                                              btnPressed = false;
                                            });
                                          });
                                        },
                                        gradientColor: AppTheme
                                            .previousButtonGradientColor,
                                        buttonFontStyle:
                                            AppTheme.practiceButtonFontStyle,
                                        buttonType: ButtonType.previousButton),
                                    ReusableButtons(
                                        title: nextButtonTitle,
                                        onTap: () {
                                          getNextQuestion();
                                          setState(() {
                                            answerChosen = false;
                                          });
                                          if (_controller!.page?.toInt() ==
                                              questions.length - 1) {
                                            ApiClient.saveUserResult(
                                                SaveUserResultModel(
                                                    questionIds: questionIds,
                                                    questionType: questionType,
                                                    totalNoOfAttempted:
                                                        totalNoOfAttempted,
                                                    totalNoOfCorrectAnswered:
                                                        result,
                                                    totalNoOfInCorrectAnswered:
                                                        totalNoOfInCorrectAnswered),
                                                context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ResultScreen(
                                                          missedQuestions:
                                                              missedQuestions,
                                                          totalNoOfAttempted:
                                                              totalNoOfAttempted,
                                                          totalNoOfCorrectAnswered:
                                                              result,
                                                          totalNoOfInCorrectAnswered:
                                                              totalNoOfInCorrectAnswered,
                                                          quizType:
                                                              widget.quizType,
                                                        )));
                                          } else {
                                            _controller!.nextPage(
                                                duration: const Duration(
                                                    milliseconds:
                                                        pageDurationMilliSecond),
                                                curve: Curves.linear);

                                            setState(() {
                                              showExplanation = false;
                                              btnPressed = false;
                                            });
                                          }
                                        },
                                        gradientColor:
                                            AppTheme.miniButtonGradient,
                                        buttonFontStyle:
                                            AppTheme.nextButtonFontStyle,
                                        buttonType: ButtonType.nextButton),
                                  ],
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(32, 0, 32, 0),
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: ReusableButtons(
                                      title: nextButtonTitle,
                                      onTap: () {
                                        getNextQuestion();
                                        setState(() {
                                          answerChosen = false;
                                        });
                                        if (_controller!.page?.toInt() ==
                                            questions.length - 1) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfileScreen(
                                                          quizType:
                                                              widget.quizType,
                                                          modalOpen: false,
                                                          showNumberOfQuestionModal:
                                                              true)));
                                        } else {
                                          _controller!.nextPage(
                                              duration: const Duration(
                                                  milliseconds:
                                                      pageDurationMilliSecond),
                                              curve: Curves.linear);
                                          setState(() {
                                            showExplanation = false;
                                            btnPressed = false;
                                          });
                                        }
                                      },
                                      gradientColor:
                                          AppTheme.miniButtonGradient,
                                      buttonFontStyle:
                                          AppTheme.nextButtonFontStyle,
                                      buttonType: ButtonType.nextButton),
                                ),
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
  }
}
