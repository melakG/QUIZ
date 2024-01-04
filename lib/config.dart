class Config {
  static const String appName = "vision_quiz_app";
  static const String apiUrl = "http://vision-quiz-app.herokuapp.com";
  static const String loginApi = "/API/v1/user/userSignIn";
  static const String registerApi = "/API/v1/user/userSignUp";
  static const String forgetPasswordApi = "/API/v1/user/forgetUserPassword";
  static const String getGoogleAuthURL = "/API/v1/gmail/getGoogleAuthURL";
  static const String payWithPayPal = "/API/v1/paypal/payWithPayPal";
  static const String logoutApi = "/API/v1/user/userSignOut";
  static const String paypalPaymentSuccessApi =
      "https://vision-quiz-app.herokuapp.com/API/v1/paypal/paypalPaymentSuccess/";
  static const String googleAuthApi = "https://accounts.google.com/o/oauth2";
  static const String getQuestionsForQuizApi = "/API/v1/question/getQuestionsForQuiz/";
    static const String getQuestionsForPracticeApi = "/API/v1/question/getQuestionsForPractice/";
  
    static const String getImage = "/API/v1/question/getImage";

  static const String saveUserResultApi = '/API/v1/question/saveUserResult';
  static const String getPracticeResultApi =
      '/API/v1/question/getPracticeResult';
  static const String getQuizResultApi = '/API/v1/question/getQuizResult';
  static const String getQuestionsData = '/API/v1/question/getQuestionsData/';
  static const String GoogleSignInUrl = "https://vision-quiz-app.herokuapp.com/API/v1/gmail/gmailSignIn?";
}
