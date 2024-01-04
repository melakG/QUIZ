import 'package:flutter/material.dart';
import 'package:regexed_validator/regexed_validator.dart';
import '../components/body.dart';
import '../components/buttons.dart';
import '../constants/app_constant.dart';
import '../constants/button_constant.dart';
import '../models/forget_password_request.dart';
import '../services/api_client.dart';
import '../theme/app_theme.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

class ResetPassword extends StatefulWidget {
  final String email;
  const ResetPassword({super.key, required this.email});
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController verificationCodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();
  final confirmPasswordFormKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    bool forgetPassword(loading) {
      if (emailFormKey.currentState!.validate() &&
          passwordFormKey.currentState!.validate() &&
          confirmPasswordFormKey.currentState!.validate()) {
        ApiClient.forgetPassword(
                ForgetPasswordRequestModel(
                    email: emailController.text.trim(),
                    password: confirmController.text.trim()),
                context)
            .then((value) => {
                  if (value.isNotEmpty)
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
                  isLoading = value,
                });
      }
      return loading;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: InkWell(
          child: Container(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            margin: AppTheme.topMarginHigh,
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
              
              Container(
                transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  icon: const Icon(FeatherIcons.arrowLeft),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Body(),
                        ));
                  },
                ),
              ),
              Container(
                child: Text(
                  setNewPasswordText,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: AppTheme.fontSize32,
                  ),
                ),
              ),
              Container(
                margin: AppTheme.bottomMarginHigh,
                padding:EdgeInsets.all(6),
                width: 314,
                height: 62,
                child: const Text(
                  setNewPasswordDescriptionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(167, 190, 175, 1),
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                margin: AppTheme.bottomMarginForTextFieldGroup,
                child: Column(
                  children: [
                    Container(
                        margin: AppTheme.bottomMarginForTextField,
                        alignment: Alignment.bottomLeft,
                        child: const Text(
                          labelTextForEmail,
                          style: AppTheme.labelTextStyle,
                        )),
                    Container(
                      child: Form(
                        key: emailFormKey,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintStyle: AppTheme.hintTextStyle,
                            contentPadding: AppTheme.inputFieldContentPadding,
                            hintText: hintTextForEmail,
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            if (emailFormKey.currentState!.validate()) {}
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
                  ],
                ),
              ),
              Container(
                margin: AppTheme.bottomMarginForTextFieldGroup,
                child: Column(
                  children: [
                    Container(
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
                          controller: passwordController,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                              contentPadding: AppTheme.inputFieldContentPadding,
                              hintStyle: AppTheme.hintTextStyle,
                              hintText: hintTextForPassword,
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? FeatherIcons.eyeOff
                                    : FeatherIcons.eye),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                              )),
                          onChanged: (value) {
                            if (passwordFormKey.currentState!.validate()) {}
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return passwordRequiredResponse;
                            } else if (!validator.mediumPassword(value)) {
                              return passwordNotStrongResponse;
                            } else if (value.length < passwordLength) {
                              return passwordMinLengthResponse;
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: AppTheme.bottomMarginForTextFieldGroup,
                child: Column(
                  children: [
                    Container(
                        margin: AppTheme.bottomMarginForTextField,
                        alignment: Alignment.bottomLeft,
                        child: const Text(
                          labelTextForConfirm,
                          style: AppTheme.labelTextStyle,
                        )),
                    Container(
                      child: Form(
                        key: confirmPasswordFormKey,
                        child: TextFormField(
                          controller: confirmController,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            contentPadding: AppTheme.inputFieldContentPadding,
                            hintStyle: AppTheme.hintTextStyle,
                            hintText: hintTextForConfirm,
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? FeatherIcons.eyeOff
                                  : FeatherIcons.eye),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            border: const OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            if (confirmPasswordFormKey.currentState!
                                .validate()) {}
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return passwordRequiredResponse;
                            } else if (passwordController.text.trim() !=
                                confirmController.text.trim()) {
                              return passwordNotMatchedResponse;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                
                child: ReusableButtons(
                  onTap: () {
                    var res = forgetPassword(isLoading);
                    if (emailFormKey.currentState!.validate() &&
                        passwordFormKey.currentState!.validate() &&
                        confirmPasswordFormKey.currentState!.validate()) {
                      setState(() {
                        isLoading = !res;
                      });
                    }
                    setState(() {});
                  },
                  isLoading: isLoading,
                  title: continueButtonTitle,
                  circularAvatar: AppTheme.lightGreyCircularAvatar,
                  gradientColor: AppTheme.continueButtonGradientColor,
                  textColor: AppTheme.continueButtonColor,
                  buttonFontStyle: AppTheme.continueButtonFontStyle,
                  buttonType: ButtonType.continueButton,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
