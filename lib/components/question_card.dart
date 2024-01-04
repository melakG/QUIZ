import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class QuestionCard extends StatefulWidget {
  final String? imageUrl;
  final String? text;
  final Color? textColor;
  final Gradient gradientColor;
  final TextStyle fontStyle;
  const QuestionCard(
      {super.key,
      this.imageUrl,
      this.text,
      this.textColor,
      required this.fontStyle,
      required this.gradientColor});

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppTheme.choiceCardWithImageWidth,
      height: AppTheme.questionCardWithImageHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: widget.gradientColor),
      child: Row(children: [
        Container(
          width: 161,
          margin: const EdgeInsets.fromLTRB(10, 0, 0, 60),
          child: AutoSizeText(widget.text == null ? '' : widget.text!,
              style: AppTheme.questionTextStyle),
        ),
        Container(
          height: AppTheme.widthIn100,
          width: 96,
          margin: const EdgeInsets.fromLTRB(40, 100, 0, 0),
          constraints: const BoxConstraints(maxHeight: 100),
          decoration: BoxDecoration(
            image: DecorationImage(
              scale: 1,
              centerSlice: Rect.zero,
              image: AssetImage(
                widget.imageUrl == null ? '' : widget.imageUrl!,
              ),
              fit: BoxFit.fill,
              alignment: Alignment.bottomRight,
            ),
          ),
        )
      ]),
    );
  }
}

class QuestionImageCard extends StatelessWidget {
  final String imageUrl;
  const QuestionImageCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppTheme.quizImageSize,
      width: AppTheme.quizImageWidth,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: AssetImage(imageUrl),
          width: AppTheme.quizImageWidth,
          height: AppTheme.quizImageSize,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class QuestionTextCard extends StatelessWidget {
  final String? text;

  const QuestionTextCard({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 8),
      height: AppTheme.quizImageWidth,
      width: AppTheme.choiceCardWithImageWidth,
      child: AutoSizeText(
        text!,
        style: AppTheme.questionTextStyle,
      ),
    );
  }
}
