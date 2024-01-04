import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../components/loader.dart';
import '../constants/button_constant.dart';
import '../theme/app_theme.dart';

class ReusableButtons extends StatefulWidget {
  final String title;
  final String? imageUrl;
  final Icon? icon;
  final bool isLoading;
  final Color? textColor;
  final LinearGradient gradientColor;
  final TextStyle buttonFontStyle;
  final ButtonType buttonType;
  final Widget? circularAvatar;
  final Function()? onTap;
  const ReusableButtons(
      {super.key,
      required this.title,
      this.imageUrl,
      this.icon,
      required this.gradientColor,
      this.onTap,
      this.textColor,
      required this.buttonFontStyle,
      required this.buttonType,
      this.circularAvatar,
      this.isLoading = false});

  @override
  State<ReusableButtons> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<ReusableButtons> {
  @override
  Widget build(BuildContext context) {
    return widget.buttonType == ButtonType.lightGreyButton
        ? InkWell(
            onTap: widget.onTap,
            child: Container(
              height: AppTheme.buttonHeight,
              width: AppTheme.buttonWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: widget.gradientColor,
              ),
              child: Stack(children: [
                widget.isLoading == true
                    ? const CircularLoader()
                    : Align(
                        alignment: Alignment.center,
                        child: Text(widget.title,
                            style: AppTheme.lightGreyButtonFontStyle),
                      ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      margin: const EdgeInsets.only(right: 4),
                      child: widget.circularAvatar),
                ),
              ]),
            ))
        : widget.buttonType == ButtonType.lightGreenButton
            ? InkWell(
                onTap: widget.onTap,
                child: Container(
                  height: AppTheme.buttonHeight,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      gradient: widget.gradientColor,
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromRGBO(8, 133, 53, 0.7)
                                .withOpacity(0.3),
                            offset: const Offset(-1, 15),
                            blurRadius: 8),
                      ]),
                  child: Stack(children: [
                    widget.isLoading == true
                        ? const CircularLoader()
                        : Align(
                            alignment: Alignment.center,
                            child: Text(widget.title,
                                style: AppTheme.lightGreenButtonFontStyle),
                          ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          margin: const EdgeInsets.only(right: 4),
                          child: widget.circularAvatar),
                    ),
                  ]),
                ))
            : widget.buttonType == ButtonType.practiceButton
                ? InkWell(
                    onTap: widget.onTap,
                    child: Container(
                      height: AppTheme.buttonHeight,
                      width: AppTheme.buttonWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        gradient: widget.gradientColor,
                      ),
                      child: Stack(children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(widget.title,
                              textAlign: TextAlign.center,
                              style: AppTheme.practiceButtonFontStyle),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: const EdgeInsets.only(right: 4),
                            child: widget.circularAvatar,
                          ),
                        ),
                      ]),
                    ))
                : widget.buttonType == ButtonType.takeExamButton
                    ? InkWell(
                        onTap: widget.onTap,
                        child: Container(
                          height: AppTheme.buttonHeight,
                          width: AppTheme.buttonWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              gradient: widget.gradientColor,
                              boxShadow: [
                                BoxShadow(
                                    color: const Color.fromRGBO(8, 133, 53, 0.7)
                                        .withOpacity(0.3),
                                    offset: const Offset(-1, 15),
                                    blurRadius: 8),
                              ]),
                          child: Stack(children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(widget.title,
                                  style: AppTheme.takeExamButtonFontStyle),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                padding: const EdgeInsets.only(right: 4),
                                child: widget.circularAvatar,
                              ),
                            ),
                          ]),
                        ))
                    : widget.buttonType == ButtonType.startQuizButton
                        ? InkWell(
                            onTap: widget.onTap,
                            child: Container(
                              height: AppTheme.buttonHeight,
                              width: AppTheme.buttonWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                gradient: widget.gradientColor,
                              ),
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(widget.title,
                                      style: AppTheme.startQuizButtonFontStyle),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 4),
                                  child: widget.circularAvatar,
                                ),
                              ]),
                            ))
                        : widget.buttonType == ButtonType.nextButton
                            ? InkWell(
                                onTap: widget.onTap,
                                child: Container(
                                  height: AppTheme.nextButtonHeight,
                                  width: AppTheme.widthIn100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: widget.gradientColor,
                                  ),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Text(widget.title,
                                              textAlign: TextAlign.center,
                                              style:
                                                  AppTheme.nextButtonFontStyle),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                            right: 6,
                                          ),
                                          child: const Icon(
                                            FeatherIcons.chevronRight,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ]),
                                ))
                            : widget.buttonType == ButtonType.previousButton
                                ? InkWell(
                                    onTap: widget.onTap,
                                    child: Container(
                                      height: AppTheme.previousButtonHeight,
                                      width: AppTheme.previousButtonWidth,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: widget.gradientColor,
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                left: 6,
                                              ),
                                              child: const Icon(
                                                FeatherIcons.chevronLeft,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  right: 20),
                                              child: Text(widget.title,
                                                  style: AppTheme
                                                      .previousButtonFontStyle),
                                            ),
                                          ]),
                                    ))
                                : widget.buttonType == ButtonType.tryAgainButton
                                    ? InkWell(
                                        onTap: widget.onTap,
                                        child: Container(
                                          height: AppTheme.tryAgainButtonHeight,
                                          width: AppTheme.tryAgainButtonWidth,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            gradient: widget.gradientColor,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                widget.title,
                                                style: AppTheme
                                                    .tryAgainButtonFontStyle,
                                              ),
                                            ],
                                          ),
                                        ))
                                    : widget.buttonType ==
                                            ButtonType.continueButton
                                        ? InkWell(
                                            onTap: widget.onTap,
                                            child: Container(
                                              height: AppTheme.buttonHeight,
                                              width: AppTheme.buttonWidth,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(32),
                                                gradient: widget.gradientColor,
                                              ),
                                              child: Stack(children: [
                                                widget.isLoading == true
                                                    ? const CircularLoader()
                                                    : Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                            widget.title,
                                                            style: AppTheme
                                                                .continueButtonFontStyle),
                                                      ),
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 4),
                                                      child: widget
                                                          .circularAvatar),
                                                ),
                                              ]),
                                            ))
                                        : Container();
  }
}
