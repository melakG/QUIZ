import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../constants/button_constant.dart';
import 'buttons.dart';
import '../constants/app_constant.dart';
import '../screens/quiz_screen.dart';

class NumberOfQuestionModal extends StatefulWidget {
  final QuizType quizType;
  const NumberOfQuestionModal({super.key, required this.quizType});
  @override
  State<NumberOfQuestionModal> createState() => _NumberOfQuestionModalState();
}

class _NumberOfQuestionModalState extends State<NumberOfQuestionModal> {
  final numberOfQuestionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    numberOfQuestionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Container(
            width: 395,
            height: 425,
            decoration: BoxDecoration(
                color: AppTheme.white, borderRadius: BorderRadius.circular(30)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              InkWell(
                child: Container(
                  width: 80,
                  height: 5 ,
                  
                  margin: const EdgeInsets.fromLTRB(0, 20, 10, 32),
                  decoration: BoxDecoration(
                color: AppTheme.darkGreen, borderRadius: BorderRadius.circular(30)),
                ),
              ),
              Container(
                child: const Text(
                  numberOfQuestionText,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                      color: AppTheme.darkGreen),
                ),
              ),
              Container(
                width: 315,
                height: 62,
                margin: AppTheme.marginAll10,
                child: const Text(
                  selectNoOfQuestionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppTheme.lightGreen),
                ),
              ),
              Container(
                width: 332,
                height: 15,
                margin: AppTheme.marginLR32,
                child: const Text(
                  noOfQuestionText,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppTheme.lightGreen),
                ),
              ),
              Container(
                margin: AppTheme.marginLR32,
                alignment: Alignment.bottomCenter,
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.bottom,
                  controller: numberOfQuestionController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (_formKey.currentState!.validate()) {}
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return noOfQuestionRequiredText;
                    } else if (int.parse(value) > 40) {
                      return maximumNumberOfQuestion;
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding: AppTheme.inputFieldContentPadding,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4)),
                    hintText: hintTextForNumberOfQuestion,
                    hintStyle: AppTheme.hintTextStyle,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                margin: AppTheme.marginLR32,
                child: ReusableButtons(
                    title: startQuizButtonTitle,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        if (widget.quizType == QuizType.practice) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizScreen(
                                      numberOfQuestion: int.parse(
                                          numberOfQuestionController.text
                                              .trim()),
                                      quizType: QuizType.practice,
                                    )),
                          );
                        } else if (widget.quizType == QuizType.quiz) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizScreen(
                                      numberOfQuestion: int.parse(
                                          numberOfQuestionController.text
                                              .trim()),
                                      quizType: QuizType.quiz,
                                    )),
                          );
                        }
                      }
                    },
                    circularAvatar: AppTheme.lightGreyCircularAvatar,
                    gradientColor: AppTheme.practiceButtonGradientColor,
                    buttonFontStyle: AppTheme.lightGreyButtonFontStyle,
                    buttonType: ButtonType.startQuizButton),
              ),
            ])),
      ),
    );
  }
}
