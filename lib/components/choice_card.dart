import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ChoiceCard extends StatefulWidget {
  final String? imageUrl;
  final String? text;
  final Color? textColor;
  final TextStyle fontStyle;
  const ChoiceCard(
      {super.key,
      this.imageUrl,
      this.text,
      this.textColor,
      required this.fontStyle});

  @override
  State<ChoiceCard> createState() => _ChoiceCardState();
}

class _ChoiceCardState extends State<ChoiceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppTheme.choiceCardWithImageHeight,
      width: AppTheme.choiceCardWithImageWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(children: [
        Container(
          margin:
              const EdgeInsets.only(left: 15, top: 15, bottom: 15, right: 8),
          height: double.infinity,
          width: AppTheme.quizImageWidth,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
                image:
                    AssetImage(widget.imageUrl == null ? '' : widget.imageUrl!),
                fit: BoxFit.fill),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 10,
          ),
          width: 181,
          child: AutoSizeText(widget.text == null ? '' : widget.text!,
              style: AppTheme.choiceTextStyle),
        )
      ]),
    );
  }
}

class ChoiceTextCard extends StatelessWidget {
  final String? text;
  const ChoiceTextCard({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(top: 8),
      height: AppTheme.quizImageWidth,
      width: AppTheme.choiceCardWithImageWidth,
      child: AutoSizeText(
        text!,
        style: AppTheme.choiceTextStyle,
      ),
    );
  }
}

class ChoiceImageCard extends StatelessWidget {
  final String imageUrl;
  const ChoiceImageCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppTheme.quizImageWidth,
      width: AppTheme.quizImageWidth,
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ).copyWith(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image(
          image: AssetImage(imageUrl),
          width: AppTheme.quizImageWidth,
          height: AppTheme.quizImageWidth,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
