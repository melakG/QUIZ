import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class AppTheme {
  static double buttonHeight = 57;
  static double buttonWidth = 331;
  static double nextButtonHeight = 50;
  static double widthIn100 = 100;
  static double quizImageSize = 75;
  static double quizImageWidth = 70;
  static double choiceCardWithImageWidth = 330;
  static double questionCardWithImageHeight = 180;
  static double questionRowCardImageHeight = 160;
  static double choiceCardNoImageWidth = 80;
  static double choiceCardWithImageHeight = 330;
  static double choiceCardNoImageHeight = 200;
  static double choiceCardImageWidth = 100;

  static double previousButtonHeight = 50;
  static double previousButtonWidth = 100;

  static double tryAgainButtonHeight = 48;
  static double tryAgainButtonWidth = 245;

  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromRGBO(250, 250, 250, 1),
      Color.fromRGBO(250, 250, 250, 1),
    ],
    stops: [0.5, 1.0],
  );
  static const snackBarSuccessBackColor = Color.fromRGBO(173, 253, 183, 1);
  static const snackBarFailedBackColor = Color.fromRGBO(253, 231, 173, 1);
  static const snackBarSuccessTextStyle = TextStyle(
      fontFamily: 'Plus Jakarta Sans',
      color: Color.fromRGBO(30, 104, 54, 1),
      fontWeight: FontWeight.w600,
      fontSize: 20);
  static const snackBarFailedTextStyle = TextStyle(
      fontFamily: 'Plus Jakarta Sans',
      color: Color.fromRGBO(79, 58, 5, 1),
      fontWeight: FontWeight.w600,
      fontSize: 20);
  static const questionGradient = LinearGradient(
    colors: [
      Color.fromRGBO(116, 179, 139, 1),
      Color.fromRGBO(235, 246, 239, 1),
    ],
  );
  static const questionTextGradient = LinearGradient(
    colors: [
      Color.fromRGBO(142, 198, 163, 0.88),
      Color.fromRGBO(98, 164, 122, 0.45),
    ],
  );
  static Color wrongColor = const Color.fromRGBO(255, 238, 217, 1);
  static const Color correctColor = Color.fromRGBO(167, 190, 175, 1);
  static const lightGreyButtonGradient = LinearGradient(colors: [
    Color.fromRGBO(229, 229, 227, 1),
    Color.fromRGBO(227, 229, 228, 1)
  ]);
  static const Color lightGreyFirstButtonColor =
      Color.fromRGBO(229, 229, 227, 1);
  static var buttonMargin = const EdgeInsets.fromLTRB(32.0, 41, 0, 0);
  static const Color registerButtonColor = Color.fromRGBO(227, 229, 228, 1);

  static const Color lightGreySecondButtonColor =
      Color.fromRGBO(227, 229, 228, 1);
  static const lightGreenButtonGradient = LinearGradient(
      colors: [Color.fromRGBO(7, 156, 61, 1), Color.fromRGBO(31, 223, 100, 1)]);

  static const Color lightGreenColor = Color.fromRGBO(31, 223, 100, 1);
  static const TextStyle lightGreyButtonFontStyle = TextStyle(
      fontFamily: 'Plus Jakarta Sans',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w800,
      fontSize: 20,
      color: Color.fromRGBO(65, 92, 74, 1));
  static const TextStyle lightGreenButtonFontStyle = TextStyle(
      fontFamily: 'Plus Jakarta Sans',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w800,
      fontSize: 20,
      color: Color.fromRGBO(255, 255, 255, 1));

  static const TextStyle practiceButtonFontStyle = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: Colors.white,
  );
  static Size size(BuildContext context) => MediaQuery.of(context).size;
  static const practiceButtonGradientColor = LinearGradient(colors: [
    Color.fromARGB(215, 43, 39, 42),
    Color.fromARGB(215, 43, 39, 42)
  ]);
  static const Color practiceButtonColor = Color.fromARGB(215, 43, 39, 42);
  static const Color practiceButtonSecondColor =
      Color.fromARGB(215, 43, 39, 42);

  static const TextStyle takeExamButtonFontStyle = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: Colors.white,
  );
  static const Color takeExamButtonColor = Color.fromARGB(214, 44, 167, 52);
  static const Color takeExamButtonSecondColor =
      Color.fromARGB(213, 20, 189, 62);

  static const TextStyle startQuizButtonFontStyle = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: Colors.white,
  );

  static const Color startQuizButtonColor = Color.fromARGB(215, 43, 39, 42);
  static const Color startQuizButtonSecondColor =
      Color.fromARGB(215, 43, 39, 42);

  static const TextStyle nextButtonFontStyle = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: Colors.white,
  );
  static const miniButtonGradient = LinearGradient(colors: [
    Color.fromARGB(215, 43, 39, 42),
    Color.fromARGB(215, 43, 39, 42)
  ]);

  static var nextButtonMargin = const EdgeInsets.fromLTRB(94, 0, 10, 0);
  static var singleNextButtonMargin = const EdgeInsets.fromLTRB(194, 0, 8, 0);
  static var preButtonMargin = const EdgeInsets.fromLTRB(20, 0, 10, 0);

  static const TextStyle previousButtonFontStyle = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: Colors.white,
  );
  static const previousButtonGradientColor = LinearGradient(colors: [
    Color.fromARGB(215, 43, 39, 42),
    Color.fromARGB(215, 43, 39, 42)
  ]);
  static const Color previousButtonColor = Color.fromARGB(215, 43, 39, 42);
  static const Color previousButtonSecondColor =
      Color.fromARGB(215, 43, 39, 42);
  static var previousButtonMargin = const EdgeInsets.fromLTRB(0, 200, 281.0, 0);

  static const TextStyle tryAgainButtonFontStyle = TextStyle(
      fontFamily: 'Inter',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: Color.fromRGBO(36, 38, 20, 1));

  static const tryAgainButtonGradientColor = LinearGradient(colors: [
    Color.fromARGB(162, 209, 250, 223),
    Color.fromARGB(162, 209, 250, 223)
  ]);
  static const Color tryAgainButtonColor = Color.fromARGB(162, 209, 250, 223);
  static const Color tryAgainButtonSecondColor =
      Color.fromARGB(31, 135, 198, 142);

  static const TextStyle continueButtonFontStyle = TextStyle(
    fontFamily: 'Plus Jakarta Sans',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w800,
    fontSize: 20,
    color: Colors.white,
  );

  static var lightGreenCircularAvatar = const CircleAvatar(
    radius: AppTheme.circleAvatarRadius,
    backgroundColor: Colors.white,
    child: Icon(
      FeatherIcons.chevronRight,
      color: greenIconColor,
    ),
  );

  static var lightGreyCircularAvatar = const CircleAvatar(
    radius: AppTheme.circleAvatarRadius,
    backgroundColor: AppTheme.circleAvatarColor,
    child: Icon(
      FeatherIcons.chevronRight,
      color: AppTheme.blackIconColor,
    ),
  );
  static const continueButtonGradientColor = LinearGradient(colors: [
    Color.fromARGB(215, 43, 39, 42),
    Color.fromARGB(215, 43, 39, 42)
  ]);
  static const Color continueButtonColor = Color.fromARGB(215, 43, 39, 42);

  static const double circleAvatarRadius = 22;
  static const Color continueWithGoogleTextColor =
      Color.fromARGB(215, 43, 39, 42);
  static const Color or = Color.fromRGBO(167, 190, 175, 1);

  static const Color blackIconColor = Colors.black;
  static const Color greenIconColor = Colors.green;

  static const Color circleAvatarColor = Colors.white;

  //for register Screen
  static const double appBarHeight = 40.0;
  static const Color appBarColor = Color.fromARGB(244, 10, 162, 50);
  static const TextStyle hintTextStyle = TextStyle(
      color: Color.fromRGBO(167, 190, 175, 1),
      fontSize: 14,
      fontFamily: 'Plus Jakarta Sans',
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic);
  static const hintTextPadding = EdgeInsets.only(left: 20, right: 10);
  static const inputFieldPadding = EdgeInsets.only(
    left: 32.0,
    right: 15,
  );
  static const inputLabelPadding = EdgeInsets.only(left: 1);
  static const double boxHeight = 10.0;
  static const TextStyle labelTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color.fromRGBO(65, 92, 74, 1),
    fontFamily: 'Plus Jakarta Sans',
  );
  static const TextStyle questionTextStyle = TextStyle(
      color: Color.fromRGBO(65, 92, 74, 1),
      fontWeight: FontWeight.bold,
      fontFamily: 'Inter',
      fontSize: 15);

  static const TextStyle choiceTextStyle = TextStyle(
      color: Color.fromRGBO(65, 92, 74, 1),
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
      fontSize: 15);
  static const TextStyle explanationTextStyle = TextStyle(
      color: Color.fromRGBO(65, 92, 74, 1),
      fontWeight: FontWeight.w400,
      fontFamily: 'Inter',
      fontStyle: FontStyle.italic,
      fontSize: 14);
  static const inputFieldHeight =
      EdgeInsets.symmetric(vertical: 18, horizontal: 10);
  static const inputFieldContentPadding =
      EdgeInsets.symmetric(vertical: 18, horizontal: 10);
  static const labelTextMargin = EdgeInsets.only(
    top: 50,
  );
  static var containerColor = Colors.grey[100];
  static const double containerHeight = double.infinity;
  static const double containerPositionedHeight = 210;
  static const double containerPositionedHeightForCard = 270;
  static const double containerPositionedValue = 0;

  static BorderRadius textFieldBorderRadius = BorderRadius.circular(4);
  static const lightGreenButtonMargin = EdgeInsets.only(left: 30, right: 32);
  static const lightGreyButtonMargin = EdgeInsets.fromLTRB(0, 50, 0, 10);
  static var bottomMarginHigh = const EdgeInsets.fromLTRB(0, 0, 0, 54);
  static var topMarginHigh = const EdgeInsets.fromLTRB(0, 94.5, 0, 0);
  static var leftMarginMedium = const EdgeInsets.fromLTRB(37.5, 0, 0, 0);
  static var leftRightBottomMedium = const EdgeInsets.fromLTRB(42, 0, 39, 7);
  static double fontSize32 = 32.0;
  //for profile card and Screen
  static double profileCardHeight = 300;
  static const double greetingCardWidth = 150;
  static const double profileBannerHeight = 194;
  static const double profileBannerWidth = 168.05;
  static const double statisticsCardHeight = 137;
  static const double statisticsCardWidth = 331;
  static const double statusNumberWidth = 132;
  static const double statusNumberHeight = 39;
  static const double statusTextHeight = 40;
  static const double statusTIconSize = 20;

  static var profileCardMargin = const EdgeInsets.only(bottom: 10, top: 0);
  static var profileLabelTextMargin =
      const EdgeInsets.only(left: 32.0, top: 64, right: 40);
  static var profileGreetingCardMargin =
      const EdgeInsets.only(left: 32.0, bottom: 3);
  static var profileBannerMargin = const EdgeInsets.only(right: 9);
  static var statisticsCardMargin = const EdgeInsets.fromLTRB(20, 20, 0, 10);
  static TextStyle greetingTextStyle = const TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.w300,
      fontFamily: 'Inter',
      color: Color(0xFF000000));
  static TextStyle profileInfoTextStyle = const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      fontFamily: 'Inter',
      color: Color(0xFF000000));
  static TextStyle attemptedQuestionTextStyle = const TextStyle(
      color: Color.fromRGBO(167, 190, 175, 1),
      fontSize: 14,
      fontWeight: FontWeight.w600);
  static Color statisticsCardBackgroundColor =
      const Color.fromRGBO(255, 255, 255, 1);
  static BorderRadius statisticsCardBorderRadius =
      const BorderRadius.all(Radius.circular(8));
  static Color lightBlueColor = const Color.fromRGBO(13, 174, 224, 1);
  static BorderRadius statusIconRadius =
      const BorderRadius.all(Radius.circular(80));
  static TextStyle statusNumberTextStyle = const TextStyle(
      color: Color.fromRGBO(65, 92, 74, 1),
      fontSize: 32,
      fontWeight: FontWeight.w700);
  //for quiz
  static const quizCardMargin = EdgeInsets.only(
    bottom: 20.0,
    left: 12.0,
    right: 12.0,
  );
  static const Color choiceBorderColor = Color.fromRGBO(167, 190, 175, 1);
  static const double containerPositionedHeightForPayment = 387;
  static const white = Color.fromRGBO(250, 250, 250, 1);
  static const darkGrey = Color.fromRGBO(46, 46, 46, 1);
  static const darkGreen = Color.fromRGBO(32, 52, 39, 1);
  static const lightGreen = Color.fromRGBO(65, 92, 74, 1);
  static const lightGrey = Color.fromRGBO(167, 190, 175, 1);
  static const marginAll10 = EdgeInsets.fromLTRB(10, 10, 10, 10);
  static const marginLR32 = EdgeInsets.fromLTRB(32, 10, 32, 10);
  static const questionCardMargin = EdgeInsets.fromLTRB(0, 10, 0, 0);
  static var questionCardBorder =
      Border.all(color: const Color.fromRGBO(167, 190, 175, 1));
  static var questionCardPadding = const EdgeInsets.all(16);
  static double questionCardWidth = 331;
  static double questionCardClosedHeight = 52;
  static double questionCardOpenedHeight = 239;
  static const bottomMarginForTextFieldGroup = EdgeInsets.only(bottom: 22);
  static const bottomMarginForTextField = EdgeInsets.only(bottom: 8);
  static double inputTextFieldWidth = 331;
  static double inputTextFieldHeight = 50;
  static const resultStatusTextStyle = TextStyle(
      color: Color.fromRGBO(32, 52, 39, 1),
      fontFamily: 'Inter',
      fontSize: 28,
      fontWeight: FontWeight.w600);
}
