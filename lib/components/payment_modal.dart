import 'dart:convert';
import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:flutter/material.dart';
import '../constants/button_constant.dart';
import '../theme/app_theme.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import '../services/shared_services.dart';
import 'radio_button.dart';
import '../constants/app_constant.dart';
import '../services/api_client.dart';
import '../config.dart';
import 'number_of_question_modal.dart';

class PaymentModal extends StatefulWidget {
  bool showNumberOfQuestionModal;
  final QuizType quizType;
  PaymentModal({
    super.key,
    required this.showNumberOfQuestionModal,
    required this.quizType,
  });

  @override
  State<PaymentModal> createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal> {
  RadioButtonType buttonGroupValue = RadioButtonType.notSelected;
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var url = "";
  var showNumberOfQuestionModal;

  @override
  void initState() {
    super.initState();
    showNumberOfQuestionModal = widget.showNumberOfQuestionModal;
    flutterWebviewPlugin.onDestroy.listen((_) {
      if (mounted) {
       
      }
    });

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (url.contains(Config.paypalPaymentSuccessApi)) {
        flutterWebviewPlugin.close();
        ApiClient.PayPal(url, context).then((value) => {
              if (value == true)
                {
                  setState(() {
                    showNumberOfQuestionModal = true;
                  }),
                }
              else
                {
                  setState(() {
                    showNumberOfQuestionModal = true;
                  }),
                },
            });
      }
    });

    flutterWebviewPlugin.onProgressChanged.listen((double progress) {
      if (mounted) {}
    });

    flutterWebviewPlugin.onScrollYChanged.listen((double y) {
      if (mounted) {}
    });
    flutterWebviewPlugin.onStateChanged.listen((event) async {
      if (mounted) {
        switch (event.type) {
          case WebViewState.shouldStart:
            {}
            break;
          case WebViewState.abortLoad:
            {}
            break;
          case WebViewState.startLoad:
            {}
            break;
          case WebViewState.finishLoad:
            {}
            break;
        }
      } else {}
    });
  }

  var cacheData = APICacheManager().getCacheData("userToken");
  bool isLoading = true;
  Map<String, dynamic> userProfileMappedData = {};
  Map<String, String> userProfile = {};

  var userProfileCacheData;

  @override
  Widget build(BuildContext context) {
    return showNumberOfQuestionModal == true
        ? NumberOfQuestionModal(quizType: widget.quizType)
        : url == ""
            ? Container(
                width: 395,
                height: 425,
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Container(
                          width: 80  ,
                          height: 5,
                          color: AppTheme.darkGrey,
                          margin: const EdgeInsets.fromLTRB(162, 20, 162, 32),
                        ),
                      ),
                      Container(
                        child: const Text(
                          paymentMethodText,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 28,
                              color: AppTheme.darkGreen),
                        ),
                      ),
                      Container(
                        width: 315,
                        height: 62,
                        margin: AppTheme.marginAll10,
                        child: const Text(
                          selectPaymentMethodText,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppTheme.lightGreen),
                        ),
                      ),
                      RadioButton(
                        value: RadioButtonType.payPal,
                        groupValue: buttonGroupValue,
                        type: RadioButtonType.payPal,
                        onTap: () {
                          ApiClient.payWithPayPal(context)
                              .then((response) async => {
                                    userProfileCacheData =
                                        await SharedService.loginDetails(),
                                    userProfileMappedData =
                                        json.decode(userProfileCacheData),
                                    userProfile = Map<String, String>.from(
                                        userProfileMappedData),
                                    setState(() {
                                      url = response;
                                      flutterWebviewPlugin.launch(
                                        url,
                                        headers: {
                                          'Authorization':
                                              'Basic ${base64Encode(utf8.encode('$widget.username:$widget.password'))}'
                                        },
                                        clearCookies: true,
                                        withJavascript: true,
                                        withLocalStorage: true,
                                        withZoom: false,
                                        supportMultipleWindows: true,
                                        allowFileURLs: true,
                                      );
                                    }),
                                  });
                        },
                        onChange: (RadioButtonType? value) {
                          setState(() {
                            buttonGroupValue = value!;
                          });
                          ApiClient.payWithPayPal(context)
                              .then((response) async => {
                                    userProfileCacheData =
                                        await SharedService.loginDetails(),
                                    userProfileMappedData =
                                        json.decode(userProfileCacheData),
                                    userProfile = Map<String, String>.from(
                                        userProfileMappedData),

                                    setState(() {
                                      url = response;
                                      flutterWebviewPlugin.launch(
                                        url,
                                        headers: {
                                          'Authorization':
                                              'Basic ${base64Encode(utf8.encode('$widget.username:$widget.password'))}'
                                        },
                                        clearCookies: true,
                                        withJavascript: true,
                                        withLocalStorage: true,
                                        withZoom: false,
                                        supportMultipleWindows: true,
                                        allowFileURLs: true,
                                      );
                                    }),
                                    // _launchURLApp()
                                  });
                        },
                      ),
                      RadioButton(
                        type: RadioButtonType.applePay,
                        groupValue: buttonGroupValue,
                        value: RadioButtonType.applePay,
                        onChange: (RadioButtonType? value) {
                          setState(() {
                            buttonGroupValue = value!;
                          });
                        },
                      ),
                    ]))
            : SafeArea(
                child: WebviewScaffold(
                  url: url,
                ),
              );
  }
}
