import 'package:flutter/material.dart';
import '../constants/app_constant.dart';
import '../theme/app_theme.dart';

class UserResultStatus extends StatelessWidget {
  final double score;
  const UserResultStatus({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return score < 50
        ? Text(
            '$resultComment $score%',
            style: AppTheme.resultStatusTextStyle,
          )
        : score > 50 && score < 75
            ? Text(
                '$resultGood $resultComment $score%',
                style: AppTheme.resultStatusTextStyle,
              )
            : score > 75 && score <= 100
                ? Text(
                    '$resultExcellent $resultComment $score%',
                    style: AppTheme.resultStatusTextStyle,
                  )
                : const Text('');
  }
}
