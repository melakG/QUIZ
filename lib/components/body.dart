import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';
import '../components/buttons.dart';
import '../constants/button_constant.dart';
import '../screens/quiz_screen.dart';
import '../screens/register_screen.dart';
import '../screens/reset_password.dart';
import '../theme/app_theme.dart';
import 'card.dart';
import '../models/login_request.dart';
import '../services/api_client.dart';
import '../constants/app_constant.dart';
import '../config.dart';
import '../components/google_sign_in.dart';

class Body extends StatefulWidget {
  const Body({super.key});
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String url = "";
  String url1 = "";
  bool isLoading = false;
  bool loadWebView = false;
  void showBottomSheet(String url) => showModalBottomSheet(
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
      builder: (context) => GoogleSignIn(
            url: url,
          ));
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool signInUser(bool loading) {
    if (emailFormKey.currentState!.validate() &&
        passwordFormKey.currentState!.validate()) {
      ApiClient.login(
        LoginRequestModel(
            email: emailController.text.trim(),
            password: passwordController.text.trim()),
        context,
      ).then((value) => {
            if (value == true || value == false)
              {
                setState(() {
                  isLoading = false;
                })
              }
            else
              {
                setState(() {
                  isLoading = true;
                }),
              },
            loading = value,
          });
    }
    return loading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Stack(
            children: [
              const Positioned(
                left: 0,
                right: 0,
                child: CardWithAvatar(
                    title: registrationCardTitle,
                    navto: registrationCardNavto,
                    imageUrl: registrationCardImgUrl,
                    type: CardType.registration),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 255,
                  bottom: 0,
                  child: Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 253, 253),
                          borderRadius: BorderRadius.circular(30)),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 331,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          const Color.fromRGBO(32, 52, 39, 1))),
                              child: TextButton(
                                onPressed: () => {
                                  ApiClient.getGoogleAuthURL(context)
                                      .then((response) => {
                                            setState(() {
                                              url = response.toString();
                                            }),
                                            if (url
                                                .contains(Config.googleAuthApi))
                                              {showBottomSheet(url)}
                                          }),
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        padding:
                                            EdgeInsets.fromLTRB(0, 15, 0, 15),
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 20, 0),
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/googleimage.png"),
                                            fit: BoxFit.fitHeight,
                                            alignment: Alignment.bottomRight,
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        continueWithGoogle,
                                        style: TextStyle(
                                            color: AppTheme
                                                .continueWithGoogleTextColor,
                                            fontSize: 16),
                                      )
                                    ]),
                              ),
                            ),
                            Container(
                              //  alignment: Alignment.center,
                                child: const Text(
                                  or,
                                  style: TextStyle(
                                      fontSize: 20, color: AppTheme.or),
                                )),
                            Container(
                                alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                child: const Text(
                                  labelTextForEmail,
                                   style: AppTheme.labelTextStyle,
                                )),
                            Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 17),
                              child: Form(
                                key: emailFormKey,
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    hintText: hintTextForEmail,
                                    border: OutlineInputBorder(),
                                  ),
                                  onChanged: (value) {
                                    if (emailFormKey.currentState!
                                        .validate()) {}
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return emailRequiredResponse;
                                    } else if (!validator.email(value)) {
                                      return emailNotValidResponse;
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ),
                            Container(
                             //padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                alignment: Alignment.bottomLeft,
                                margin: AppTheme.bottomMarginForTextField,
                                child: const Text(
                                  labelTextForPassword,
                                  style: AppTheme.labelTextStyle,
                                )),
                            Container(
                              
                              child: Form(
                                key: passwordFormKey,
                                child: TextFormField(
                                    obscureText: _isObscure,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                        hintText: hintTextForPassword,
                                        border: const OutlineInputBorder(),
                                        suffixIcon: IconButton(
                                          icon: Icon(_isObscure
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                          onPressed: (() {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          }),
                                        )),
                                    onChanged: (value) {
                                      if (passwordFormKey.currentState!
                                          .validate()) {}
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return passwordRequiredResponse;
                                      } else {
                                        return null;
                                      }
                                    }),
                              ),
                            ),
                            Container(
                                alignment: Alignment.bottomRight,
                                child: TextButton(
                                  child: const Text(
                                    forgetPassword,
                                    style: AppTheme.labelTextStyle,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ResetPassword(
                                                email: '',
                                              )),
                                    );
                                  },
                                )),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                              alignment: Alignment.center,
                              child: ReusableButtons(
                                circularAvatar:
                                    AppTheme.lightGreenCircularAvatar,
                                title: loginButtonTitle,
                                onTap: () {
                                  var res = signInUser(isLoading);

                                  if (emailFormKey.currentState!.validate() &&
                                      passwordFormKey.currentState!
                                          .validate()) {
                                    setState(() {
                                      isLoading = !res;
                                    });
                                  }

                                  setState(() {});
                                },
                                isLoading: isLoading,
                                gradientColor:
                                    AppTheme.lightGreenButtonGradient,
                                buttonFontStyle:
                                    AppTheme.lightGreenButtonFontStyle,
                                buttonType: ButtonType.lightGreenButton,
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(0, 50, 0, 10),
                                alignment: Alignment.center,
                                child: const Text(doNotHaveAccount,
                                    style: AppTheme.labelTextStyle)),
                            ReusableButtons(
                              title: registerButtonTitle,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()),
                                );
                              },
                              circularAvatar: AppTheme.lightGreyCircularAvatar,
                              gradientColor: AppTheme.lightGreyButtonGradient,
                              buttonFontStyle:
                                  AppTheme.lightGreyButtonFontStyle,
                              buttonType: ButtonType.lightGreyButton,
                            ),
                          ],
                        ),
                      )))
            ],
          ));
        
  }
}
