import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../components/body.dart';
import '../constants/error_handling.dart';
import '../constants/utils.dart';
import '../models/save_user_result.dart';
import '../theme/app_theme.dart';
import '../screens/profile_screen.dart';
import '../services/shared_services.dart';
import '../config.dart';
import '../models/login_request.dart';
import '../models/register_request_model.dart';
import '../models/forget_password_request.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

enum StatusCode {
  SUCCESSFUL_RESPONSE,
  FAILED_OR_ERROR_RESPONSE,
}

class ApiClient {
  static Map cookies = {};

  static Map _formatCookies(cookiesData) {
    cookies = {};
    if (cookiesData.contains('userToken')) {
      List cookie =
          RegExp(r'(userToken)(.*?)[^;]+').stringMatch(cookiesData)!.split('=');
      cookies['userToken'] = cookie[1];
    }
    if (cookiesData.contains('userEmail')) {
      List cookie =
          RegExp(r'(userEmail)(.*?)[^;]+').stringMatch(cookiesData)!.split('=');
      cookies['userEmail'] = cookie[1];
    }
    if (cookiesData.contains('userFirstName')) {
      List cookie = RegExp(r'(userFirstName)(.*?)[^;]+')
          .stringMatch(cookiesData)!
          .split('=');
      cookies['userFirstName'] = cookie[1];
    }
    if (cookiesData.contains('userLastName')) {
      List cookie = RegExp(r'(userLastName)(.*?)[^;]+')
          .stringMatch(cookiesData)!
          .split('=');
      cookies['userLastName'] = cookie[1];
    }
    if (cookiesData.contains('hasActiveSubscription')) {
      List cookie = RegExp(r'(hasActiveSubscription)(.*?)[^;]+')
          .stringMatch(cookiesData)!
          .split('=');
      cookies['hasActiveSubscription'] = cookie[1];
    }

    if (cookiesData.contains('userPhoneNumber')) {
      List cookie = RegExp(r'(userPhoneNumber)(.*?)[^;]+')
          .stringMatch(cookiesData)!
          .split('=');
      cookies['userPhoneNumber'] = cookie[1];
    }

    return cookies;
  }

  static var _dio = Dio();

  static Future<bool> login(
    LoginRequestModel model,
    context,
  ) async {
    try {
      var dataCookie;
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      _dio.interceptors.add(CookieManager(
          PersistCookieJar(storage: FileStorage(appDocDir.path +'/.cookies/'))));

      Response response = await _dio.post(Config.apiUrl + Config.loginApi,
          data: model.toJson(),
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
              headers: {
                "Accept": "application/json",
              }));
      var responseMessage = jsonEncode(response.data);
      dataCookie = _formatCookies(response.headers['set-cookie'].toString());
      httpErrorHandling(
        response: response,
        context: context,
        onSuccess: () async {
          SharedService.loginDetails();
          await SharedService.setLoginDetails({
            'userToken': dataCookie['userToken'],
            'userEmail': dataCookie['userEmail'],
            'firstName': dataCookie['userFirstName'],
            'lastName': dataCookie['userLastName'],
          });
          showSnackBar(
              context,
              jsonDecode(responseMessage)['message'],
              AppTheme.snackBarSuccessBackColor,
              AppTheme.snackBarSuccessTextStyle);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfileScreen(
                      showNumberOfQuestionModal: true,
                      modalOpen: false,
                    )),
          );
        },
      );

      return true;
    } on DioError catch (e) {
      showSnackBar(context, e.message, AppTheme.snackBarFailedBackColor,
          AppTheme.snackBarFailedTextStyle);
      return false;
    }
  }


 static Future<bool> signInWithGoogle(
    String url,
    context,
  ) async {
    try {
      var dataCookie;
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      _dio.interceptors.add(CookieManager(
          PersistCookieJar(storage: FileStorage(appDocDir.path +'/.cookies/'))));

      Response response = await _dio.get(url,
          
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
              headers: {
                "Accept": "application/json",
              }));



      var responseMessage = jsonEncode(response.data);
      dataCookie = _formatCookies(response.headers['set-cookie'].toString());
      httpErrorHandling(
        response: response,
        context: context,
        onSuccess: () async {
          SharedService.loginDetails();
          await SharedService.setLoginDetails({
            'userToken': dataCookie['userToken'],
            'userEmail': dataCookie['userEmail'],
            'firstName': dataCookie['userFirstName'],
            'lastName': dataCookie['userLastName'],
          });
          showSnackBar(
              context,
              jsonDecode(responseMessage)['message'],
              AppTheme.snackBarSuccessBackColor,
              AppTheme.snackBarSuccessTextStyle);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfileScreen(
                      showNumberOfQuestionModal: true,
                      modalOpen: false,
                    )),
          );
        },
      );

      return true;
    } on DioError catch (e) {
     
       showSnackBar(context, e.message, AppTheme.snackBarFailedBackColor,
           AppTheme.snackBarFailedTextStyle);
      return false;
    }
  }









  static Future<String> register(RegisterRequestModel model, context) async {
    try {
      Response response = await _dio.post(Config.apiUrl + Config.registerApi,
          data: model.toJson(),
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
              headers: {
                "Accept": "application/json",
              }));
      var responseMessage = jsonEncode(response.data);
      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () async {
            showSnackBar(
                context,
                jsonDecode(responseMessage)['message'],
                AppTheme.snackBarSuccessBackColor,
                AppTheme.snackBarSuccessTextStyle);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Body()));
          });

      return responseMessage;
    } catch (e) {
      showSnackBar(context, e.toString(), AppTheme.snackBarFailedBackColor,
          AppTheme.snackBarFailedTextStyle);

      throw Exception(e);
    }
  }

  static Future payWithPayPal(context) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      _dio.interceptors.add(CookieManager(
          PersistCookieJar(storage: FileStorage(appDocDir.path +'/.cookies/'))));

      Response response = await _dio.post(
        Config.apiUrl + Config.payWithPayPal,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {
              "Accept": "application/json",
            }),
      );

      var url = response.headers['location'];
      return url![0];
    } on DioError catch (e) {
      showSnackBar(context, e.toString(), AppTheme.snackBarFailedBackColor,
          AppTheme.snackBarFailedTextStyle);
      return false;
    }
  }

  static Future getGoogleAuthURL(context) async {
    try {
      Response response = await _dio.get(
        Config.apiUrl + Config.getGoogleAuthURL,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {
              "Accept": "application/json",
            }),
      );

      return response;
    } on DioError catch (e) {
      showSnackBar(context, e.toString(), AppTheme.snackBarFailedBackColor,
          AppTheme.snackBarFailedTextStyle);
      return false;
    }
  }

  static Future PayPal(String url, context) async {
    try {
      var dataCookie;
      var paymentSuccess;
      Response response = await _dio.get(
        url,
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {
              "Accept": "application/json",
            }),
      );
      dataCookie = _formatCookies(response.headers['set-cookie'].toString());
      paymentSuccess = dataCookie['hasActiveSubscription'];

      if (paymentSuccess == true) {
        return paymentSuccess;
      } else {
        return false;
      }
    } on DioError catch (e) {
      showSnackBar(context, e.toString(), AppTheme.snackBarFailedBackColor,
          AppTheme.snackBarFailedTextStyle);
    }
  }

  static Future userSignOut(context) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      _dio.interceptors.add(CookieManager(
          PersistCookieJar(storage: FileStorage(appDocDir.path +'/.cookies/'))));
      Response response = await _dio.get(Config.apiUrl + Config.logoutApi,
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              },
              headers: {
                "Accept": "application/json",
              }));

      var responseMessage = jsonEncode(response.data);
      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () async {
            await PersistCookieJar(
                    storage: FileStorage(appDocDir.path +'/.cookies/'))
                .deleteAll();

            await CookieJar().deleteAll();
            SharedService.logout();
            showSnackBar(
                context,
                jsonDecode(responseMessage)['message'],
                AppTheme.snackBarSuccessBackColor,
                AppTheme.snackBarSuccessTextStyle);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Body()));
          });
    } catch (e) {
      showSnackBar(context, e.toString(), Color.fromARGB(255, 31, 30, 28),
          AppTheme.snackBarFailedTextStyle);
    }
  }

  static Future getQuestionsForQuiz(numberOfQuestion, context) async {
    var dataCookie;
    var paymentSuccess;
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      _dio.interceptors.add(CookieManager(
          PersistCookieJar(storage: FileStorage(appDocDir.path +'/.cookies/'))));
      Response response = await _dio.get(
        "${Config.apiUrl}${Config.getQuestionsForQuizApi}$numberOfQuestion",
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {
              "Accept": "application/json",
            }),
      );

      dataCookie = _formatCookies(response.headers['set-cookie'].toString());
      paymentSuccess = dataCookie['hasActiveSubscription'];



      if (paymentSuccess == null || paymentSuccess == false) {
        showSnackBar(context, "Pay first", AppTheme.snackBarSuccessBackColor,
            AppTheme.snackBarSuccessTextStyle);
        return false;
      } else {
        return response.data;
      }
    } on DioError catch (e) {
      showSnackBar(context, (e.toString()), AppTheme.snackBarSuccessBackColor,
          AppTheme.snackBarSuccessTextStyle);
    }
  }


  static Future getQuestionsData(questionId, context) async {
    var dataCookie;
    var paymentSuccess;
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      _dio.interceptors.add(CookieManager(
          PersistCookieJar(storage: FileStorage(appDocDir.path +'/.cookies/'))));
      Response response = await _dio.get(

        "${Config.apiUrl}${Config.getQuestionsData}$questionId",
        
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },

            headers: {
              "Accept": "application/json",
            }),
      );  
      return response.data;
    } on DioError catch (e) {
      showSnackBar(context, (e.toString()), AppTheme.snackBarSuccessBackColor,
          AppTheme.snackBarSuccessTextStyle);
    }
  }


  static Future getQuestionsForPractice(numberOfQuestion, context) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      _dio.interceptors.add(CookieManager(
          PersistCookieJar(storage: FileStorage(appDocDir.path +'/.cookies/'))));
      Response response = await _dio.get(
        "${Config.apiUrl}${Config.getQuestionsForPracticeApi}$numberOfQuestion",
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {
              "Accept": "application/json",
            }),
      );
   
      return response.data;
    } on DioError catch (e) {
      showSnackBar(context, (e.toString()), AppTheme.snackBarSuccessBackColor,
          AppTheme.snackBarSuccessTextStyle);
    }
  }

  static Future saveUserResult(SaveUserResultModel model, context) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      _dio.interceptors.add(CookieManager(
          PersistCookieJar(storage: FileStorage(appDocDir.path +'/.cookies/'))));

      Response response = await _dio.post(
        Config.apiUrl + Config.saveUserResultApi,
        data: model.toJson(),
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {
              "Accept": "application/json",
            }),
      );
      return jsonDecode(response.data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future getQuizResult(context) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      _dio.interceptors.add(CookieManager(
          PersistCookieJar(storage: FileStorage(appDocDir.path +'/.cookies/'))));

      Response response = await _dio.get(
        "${Config.apiUrl}${Config.getQuizResultApi}",
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {
              "Accept": "application/json",
            }),
      );
      return response.data;
    } on DioError catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future getPracticeResult(context) async {
    try {


      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      _dio.interceptors.add(CookieManager(
        PersistCookieJar(storage: FileStorage(appDocDir.path +'/.cookies/'))));

      Response response = await _dio.get(
        "${Config.apiUrl}${Config.getPracticeResultApi}",
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {
              "Accept": "application/json",
            }),
      );

      return response.data;
    } on DioError catch (e) {
      debugPrint('Error ${e.toString()}');
    }
  }

  static Future getImage(imageId, context) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      _dio.interceptors.add(CookieManager(
          PersistCookieJar(storage: FileStorage(appDocDir.path +'/.cookies/'))));

      Response response = await _dio.get(
        "${Config.apiUrl}${Config.getImage}/$imageId",
        options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
            headers: {
              "Accept": "application/json",
            }),
      );

      return response.data;
    } on DioError catch (e) {
      showSnackBar(context, e.message, AppTheme.snackBarFailedBackColor,
          AppTheme.snackBarFailedTextStyle);
      return false;
    }
  }

  static Future forgetPassword(
      ForgetPasswordRequestModel model, context) async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      _dio.interceptors.add(CookieManager(
          PersistCookieJar(storage: FileStorage(appDocDir.path +'/.cookies/'))));

      Response response =
          await _dio.post(Config.apiUrl + Config.forgetPasswordApi,
              data: model.toJson(),
              options: Options(
                  followRedirects: false,
                  validateStatus: (status) {
                    return status! < 500;
                  },
                  headers: {
                    "Accept": "application/json",
                  }));
      var responseMessage = jsonEncode(response.data);

      httpErrorHandling(
          response: response,
          context: context,
          onSuccess: () async {
            showSnackBar(
                context,
                jsonDecode(responseMessage)['message'],
                AppTheme.snackBarSuccessBackColor,
                AppTheme.snackBarSuccessTextStyle);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Body()));
          });

      return responseMessage;
    } on DioError catch (e) {
      showSnackBar(context, e.toString(), AppTheme.snackBarFailedBackColor,
          AppTheme.snackBarFailedTextStyle);
    }
  }
}
