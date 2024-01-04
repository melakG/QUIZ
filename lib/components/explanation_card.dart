import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../components/loader.dart';
import '../theme/app_theme.dart';
import '../services/api_client.dart';

class ExplanationCard extends StatefulWidget {
  final String? explanationText;
  final List explanationImage;
  const ExplanationCard(
      {super.key, this.explanationText, required this.explanationImage});
  @override
  State<ExplanationCard> createState() => _ExplanationCardState();
}

class _ExplanationCardState extends State<ExplanationCard> {
  List listOfImage = [];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.explanationImage.length; i++) {
      ApiClient.getImage(widget.explanationImage[i]['_id'], context)
          .then((value) => {
                setState(() {
                  listOfImage.add(value['image']['data']['data']);
                })
              });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.explanationImage.isNotEmpty && listOfImage.isEmpty
        ? const CircularLoader()
        : Container(
            margin: const EdgeInsets.fromLTRB(18, 5, 18, 10),
            decoration: const BoxDecoration(
                border: Border(
                    left:
                        BorderSide(color: AppTheme.lightGreenColor, width: 3))),
            width: double.infinity,
            child: Card(
              color: Colors.white,
              elevation: 0.0,
              child: widget.explanationImage.isEmpty
                  ? Container(
                      margin: const EdgeInsets.fromLTRB(18, 13, 19, 10),
                      child: Text(
                          widget.explanationText == null
                              ? ''
                              : widget.explanationText!,
                          textAlign: TextAlign.justify,
                          textScaleFactor: 1.2,
                          style: AppTheme.explanationTextStyle),
                    )
                  : Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 100,
                              constraints: const BoxConstraints(maxHeight: 90),
                              child: Image.memory(
                                Uint8List.fromList(listOfImage[0].cast<int>()!),
                                width: 250,
                                height: 250,
                                fit: BoxFit.contain,
                              )),
                          Container(
                            width: 161,
                            child: Text(
                                widget.explanationText == null
                                    ? ''
                                    : widget.explanationText!,
                                textAlign: TextAlign.justify,
                                textScaleFactor: 1.2,
                                style: AppTheme.explanationTextStyle),
                          ),
                        ],
                      ),
                    ),
            ),
          );
  }
}
