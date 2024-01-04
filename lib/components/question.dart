import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../services/api_client.dart';
import '../theme/app_theme.dart';
import 'loader.dart';

class Question extends StatefulWidget {
  final String questionText;
  final List<dynamic> listOfImage;
  const Question(
      {super.key, required this.questionText, required this.listOfImage});
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
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

  @override
  Widget build(BuildContext context) {
    
    return widget.listOfImage.isNotEmpty && listOfImage.isEmpty
        ? const Center(child: CircularLoader())
        : Container(
            margin: const EdgeInsets.fromLTRB(32, 10, 32, 14),
            width: 330,
            padding: const EdgeInsets.all(17),
            constraints: const BoxConstraints(minHeight: 140),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.choiceBorderColor),
              gradient: AppTheme.questionGradient,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
              widget.listOfImage.isEmpty
              
                  ? Container(
                      child: Text(widget.questionText,
                          textAlign: TextAlign.justify,
                          style: AppTheme.questionTextStyle))
                 
                      : Column(children: [
                       
                          
                              Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        child: Text(widget.questionText,
                                            style: AppTheme.questionTextStyle)),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            for (int i = 0;
                                                i < listOfImage.length;
                                                i++)
                                              Container(
                                                
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 5, 10, 0),
                                                  height: 87,
                                                  width: 86,
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                  ),
                                                  child: Image.memory(
                                                    Uint8List.fromList(
                                                        listOfImage[i]
                                                            .cast<int>()!),
                                                    fit: BoxFit.cover,
                                                  )),
                                          ]),
                                    )
                                  ],
                                )
                        ])
            ]));
  }
}
