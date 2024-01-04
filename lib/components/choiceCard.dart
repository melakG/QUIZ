import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../components/loader.dart';
import '../services/api_client.dart';
import '../theme/app_theme.dart';

class Choice extends StatefulWidget {
  final String choiceText;
  final bool isAnswer;
  final List listOfImage;
  final Function onTap;
  final bool answerChosen;
  const Choice(
      {super.key,
      required this.choiceText,
      required this.isAnswer,
      required this.listOfImage,
      required this.onTap,
      required this.answerChosen});

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  List listOfImage = [];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.listOfImage.length; i++) {
      ApiClient.getImage(widget.listOfImage[i]['_id'], context)
          .then((value) => {
                setState(() {
                  listOfImage.add(value['image']['data']['data']);
                }),
              });
    }
  }

  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return widget.listOfImage.isNotEmpty && listOfImage.isEmpty
        ? const CircularLoader()
        : InkWell(
            onTap: () {
              widget.onTap();
              if (widget.answerChosen == false) {
                setState(() {
                  clicked = true;
                });
              }
            },
            child: Container(
              width: AppTheme.choiceCardWithImageWidth,
              margin: const EdgeInsets.fromLTRB(32, 10, 32, 14),
              padding: const EdgeInsets.all(16),
              constraints: const BoxConstraints(minHeight: 62),
              decoration: BoxDecoration(
                  borderRadius: AppTheme.statisticsCardBorderRadius,
                  border: Border.all(
                      color: clicked && widget.isAnswer
                          ? const Color.fromARGB(66, 10, 170, 58)
                          : clicked && !widget.isAnswer
                              ? const Color.fromRGBO(173, 150, 108, 1)
                              : const Color.fromRGBO(167, 190, 175, 1)),
                  color: clicked && widget.isAnswer
                      ? const Color.fromARGB(66, 10, 170, 58)
                      : clicked && !widget.isAnswer
                          ? const Color.fromRGBO(255, 242, 217, 1)
                          : Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.listOfImage.isEmpty
                      ? Text(widget.choiceText,
                          textAlign: TextAlign.justify,
                          style: AppTheme.choiceTextStyle)
                      : widget.listOfImage.length == 1
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int k = 0;
                                    k < widget.listOfImage.length;
                                    k++)
                                  Container(
                                      height: 87,
                                      width: 86,
                                      child: Image.memory(
                                        Uint8List.fromList(
                                            listOfImage[k].cast<int>()!),
                                        width: 250,
                                        height: 250,
                                        fit: BoxFit.contain,
                                      )),
                                Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(widget.choiceText,
                                      textAlign: TextAlign.justify,
                                      style: AppTheme.choiceTextStyle),
                                )
                              ],
                            )
                          : Column(
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      for (int k = 0;
                                          k < widget.listOfImage.length;
                                          k++)
                                        Container(
                                            height: 87,
                                            width: 86,
                                            child: Image.memory(
                                              Uint8List.fromList(
                                                  listOfImage[k].cast<int>()!),
                                              width: 250,
                                              height: 250,
                                              fit: BoxFit.contain,
                                            )),
                                      Text(widget.choiceText,
                                          textAlign: TextAlign.justify,
                                          style: AppTheme.choiceTextStyle)
                                    ],
                                  ),
                                ),
                                Text(widget.choiceText,
                                    style: AppTheme.choiceTextStyle)
                              ],
                            )
                ],
              ),
            ),
          );
  }
}
