import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import '../components/loader.dart';
import '../services/shared_services.dart';
import '../components/statistics_card.dart';
import '../components/buttons.dart';
import '../constants/app_constant.dart';
import '../constants/button_constant.dart';
import '../theme/app_theme.dart';
import '../components/card.dart';
import '../components/payment_modal.dart';

class ProfileScreen extends StatefulWidget {
  final QuizType? quizType;
  bool showNumberOfQuestionModal;
  bool modalOpen;
  ProfileScreen(
      {super.key,
      required this.modalOpen,
      required this.showNumberOfQuestionModal,
      this.quizType});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var cookieJar = CookieJar();

  @override
  void initState() {
    super.initState();
  }

  var userData;
  void showBottomSheet(QuizType quizType, bool showNumberOfQuestionModal) =>
      showModalBottomSheet(
          enableDrag: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          backgroundColor: Colors.white,
          barrierColor: const Color.fromARGB(255, 15, 15, 14).withOpacity(0.4),
          context: context,
          builder: (context) => PaymentModal(
                showNumberOfQuestionModal: showNumberOfQuestionModal,
                quizType: quizType,
              ));

  setUser() async => {
        userData = jsonDecode(await SharedService.loginDetails()),
        if (widget.modalOpen == true) {showBottomSheet(QuizType.quiz, false)}
      };
  bool dataLoading = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: setUser(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Stack(children: [
              Positioned(
                left: AppTheme.containerPositionedValue,
                right: AppTheme.containerPositionedValue,
                child: CardWithAvatar(
                    firstName: userData['firstName'],
                    lastName: userData?['lastName'],
                    navto: profileLabelText,
                    imageUrl: registerBannerImage,
                    type: CardType.greeting),
              ),
              Positioned(
                  top: AppTheme.containerPositionedHeightForCard,
                  left: AppTheme.containerPositionedValue,
                  right: AppTheme.containerPositionedValue,
                  bottom: AppTheme.containerPositionedValue,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                    height: AppTheme.containerHeight,
                    color: AppTheme.containerColor,
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StaticsCard(quizType: widget.quizType),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 30),
                              child: ReusableButtons(
                                  title: practiceButtonTitle,
                                  onTap: () {
                                    showBottomSheet(QuizType.practice, true);
                                  },
                                  circularAvatar:
                                      AppTheme.lightGreyCircularAvatar,
                                  gradientColor:
                                      AppTheme.practiceButtonGradientColor,
                                  buttonFontStyle:
                                      AppTheme.lightGreyButtonFontStyle,
                                  buttonType: ButtonType.practiceButton),
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 30),
                              child: ReusableButtons(
                                  title: takeExamButtonTitle,
                                  onTap: () {
                                    showBottomSheet(QuizType.quiz, true);
                                  },
                                  circularAvatar:
                                      AppTheme.lightGreenCircularAvatar,
                                  gradientColor:
                                      AppTheme.lightGreenButtonGradient,
                                  buttonFontStyle:
                                      AppTheme.lightGreyButtonFontStyle,
                                  buttonType: ButtonType.takeExamButton),
                            ),
                            const SizedBox(
                              height: AppTheme.boxHeight * 2,
                            ),
                          ]),
                    ),
                  )),
            ]),
          );
        } else {
          return const Scaffold(
            body: CircularLoader(),
          );
        }
      },
    );
  }
}
