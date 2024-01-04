import 'package:flutter/material.dart';
import '../constants/button_constant.dart';
import '../services/api_client.dart';
import '../constants/app_constant.dart';
import '../theme/app_theme.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class StaticsCard extends StatefulWidget {
  final int totalNoOfAttempted;
  final int totalNoOfCorrectAnswered;
  final QuizType? quizType;
  const StaticsCard({
    super.key,
    this.totalNoOfAttempted = 0,
    this.totalNoOfCorrectAnswered = 0,
    this.quizType,
  });

  @override
  State<StaticsCard> createState() => _StaticsCardState();
}

class _StaticsCardState extends State<StaticsCard> {
  int numberOfAttempted = 0;
  int numberOfCorrectAnswered = 0;
  @override
  void initState() {
    super.initState();
    getUserResult();
  }

  getUserResult() async {
    if (widget.quizType == QuizType.practice || widget.quizType == null) {
      ApiClient.getPracticeResult(context).then((value) => {
            if (widget.totalNoOfAttempted != 0 &&
                widget.totalNoOfCorrectAnswered != 0)
              {
                setState(() {
                  numberOfAttempted = widget.totalNoOfAttempted;
                  numberOfCorrectAnswered = widget.totalNoOfCorrectAnswered;
                }),
              }
            else
              {
                setState(
                  () {
                    numberOfAttempted =
                        (value['userPracticeResult'][0]['totalNoOfAttempted']);
                    numberOfCorrectAnswered = value['userPracticeResult'][0]
                        ['totalNoOfCorrectAnswered'];
                  },
                ),
              }
          });
      setState(() {});
    } else if (widget.quizType == QuizType.quiz || widget.quizType == null) {
      ApiClient.getQuizResult(context).then((value) => {
            if (widget.totalNoOfAttempted != 0 &&
                widget.totalNoOfCorrectAnswered != 0)
              {
                setState(() {
                  numberOfAttempted = widget.totalNoOfAttempted;
                  numberOfCorrectAnswered = widget.totalNoOfCorrectAnswered;
                }),
              }
            else
              {
                setState(
                  () {
                    numberOfAttempted =
                        (value['userQuizResult'][0]['totalNoOfAttempted']);
                    numberOfCorrectAnswered =
                        value['userQuizResult'][0]['totalNoOfCorrectAnswered'];
                  },
                ),
              }
          });
      setState(() {});
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: AppTheme.statisticsCardBorderRadius,
          color: AppTheme.statisticsCardBackgroundColor),
      width: AppTheme.statisticsCardWidth,
      height: AppTheme.statisticsCardHeight,
      padding: AppTheme.statisticsCardMargin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 4),
                child: Icon(
                  FeatherIcons.helpCircle,
                  color: AppTheme.lightBlueColor,
                  size: AppTheme.statusTIconSize,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 4),
                width: AppTheme.statusNumberWidth,
                height: AppTheme.statusNumberHeight,
                child: Text(
                  (numberOfAttempted).toString(),
                  style: AppTheme.statusNumberTextStyle,
                ),
              ),
              Container(
                width: AppTheme.statusNumberWidth,
                height: AppTheme.statusTextHeight,
                child: Text(
                  attemptedQuestionLabelText,
                  style: AppTheme.attemptedQuestionTextStyle,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 4),
                child: const Icon(
                  FeatherIcons.checkCircle,
                  color: AppTheme.lightGreenColor,
                  size: AppTheme.statusTIconSize,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 4),
                width: AppTheme.statusNumberWidth,
                height: AppTheme.statusNumberHeight,
                child: Text(
                  (numberOfCorrectAnswered).toString(),
                  style: AppTheme.statusNumberTextStyle,
                ),
              ),
              Container(
                width: AppTheme.statusNumberWidth,
                height: AppTheme.statusTextHeight,
                child: Text(
                  answeredQuestionLabelText,
                  style: AppTheme.attemptedQuestionTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
