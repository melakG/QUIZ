import 'package:flutter/material.dart';
import '../components/custom_text_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../services/api_client.dart';
import '../components/body.dart';
import '../components/buttons.dart';
import '../constants/app_constant.dart';
import '../constants/button_constant.dart';
import '../theme/app_theme.dart';
import 'package:regexed_validator/regexed_validator.dart';

import '../components/card.dart';
import '../models/register_request_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible = true;
  bool isLoading = false;
  late RegisterRequestModel registerRequestData;
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final firstNameFormKey = GlobalKey<FormState>();
  final lastNameFormKey = GlobalKey<FormState>();
  final phoneNumberFormKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final passwordFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool signUpUser(loading) {
    if (firstNameFormKey.currentState!.validate() &&
        lastNameFormKey.currentState!.validate() &&
        phoneNumberFormKey.currentState!.validate() &&
        emailFormKey.currentState!.validate() &&
        passwordFormKey.currentState!.validate()) {
      ApiClient.register(
              RegisterRequestModel(
                  firstName: firstNameController.text.trim(),
                  lastName: lastNameController.text.trim(),
                  phoneNumber: phoneNumberController.text.trim(),
                  email: emailController.text.trim(),
                  password: passwordController.text.trim()),
              context)
          .then((value) => {
                if (value.isNotEmpty)
                  {
                    setState(() {
                      isLoading = false;
                    }),
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
      body: Stack(children: [
        const Positioned(
          left: AppTheme.containerPositionedValue,
          right: AppTheme.containerPositionedValue,
          child: CardWithAvatar(
              title: registrationCardTitle,
              navto: registrationCardNavto,
              imageUrl: registerBannerImage,
              type: CardType.login),
        ),
        Positioned(
            top: AppTheme.containerPositionedHeight,
            left: AppTheme.containerPositionedValue,
            right: AppTheme.containerPositionedValue,
            bottom: AppTheme.containerPositionedValue,
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 31),
                        child:
                            CustomLabelText(labelText: labelTextForFirstName),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFiled(
                          hintText: hintTextForFirstName,
                          textInputType: TextInputType.name,
                          hintTextStyle: AppTheme.hintTextStyle,
                          textCapitalization: TextCapitalization.words,
                          onChange: (value) {
                            if (firstNameFormKey.currentState!.validate()) {}
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return firstNameRequiredResponse;
                            } else {
                              return null;
                            }
                          },
                          controller: firstNameController,
                          formKey: firstNameFormKey,
                          errorResponse: firstNameRequiredResponse),
                      const SizedBox(
                        height: 22,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 31),
                        child: CustomLabelText(labelText: labelTextForLastName),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFiled(
                          hintText: hintTextForLastName,
                          textInputType: TextInputType.name,
                          hintTextStyle: AppTheme.hintTextStyle,
                          textCapitalization: TextCapitalization.words,
                          onChange: (value) {
                            if (lastNameFormKey.currentState!.validate()) {}
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return lastNameRequiredResponse;
                            } else {
                              return null;
                            }
                          },
                          controller: lastNameController,
                          formKey: lastNameFormKey,
                          errorResponse: lastNameRequiredResponse),
                      const SizedBox(
                        height: 22,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 31),
                        child:
                            CustomLabelText(labelText: labelTextForPhoneNumber),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: AppTheme.inputFieldPadding,
                        child: Form(
                          key: phoneNumberFormKey,
                          child: SizedBox(
                            width: 331,
                            child: IntlPhoneField(
                              keyboardType: TextInputType.phone,
                              controller: phoneNumberController,
                              onChanged: (phone) {
                                if (phoneNumberFormKey.currentState!
                                    .validate()) {}
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                contentPadding:
                                    AppTheme.inputFieldContentPadding,
                                border: OutlineInputBorder(
                                  borderRadius: AppTheme.textFieldBorderRadius,
                                ),
                                hintText: hintTextForPhoneNumber,
                                hintStyle: AppTheme.hintTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 31),
                        child: CustomLabelText(labelText: labelTextForEmail),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFiled(
                          hintText: hintTextForEmail,
                          textInputType: TextInputType.emailAddress,
                          hintTextStyle: AppTheme.hintTextStyle,
                          textCapitalization: TextCapitalization.none,
                          onChange: (value) {
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
                          controller: emailController,
                          formKey: emailFormKey,
                          errorResponse: emailRequiredResponse),
                      const SizedBox(
                        height: 22,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 31),
                        child: CustomLabelText(labelText: labelTextForPassword),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFiled(
                          hintText: hintTextForPassword,
                          hintTextStyle: AppTheme.hintTextStyle,
                          textCapitalization: TextCapitalization.none,
                          isSecured: _passwordVisible,
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          onChange: (value) {
                            if (passwordFormKey.currentState!.validate()) {}
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return passwordRequiredResponse;
                            } else if (!validator.mediumPassword(value)) {
                              return passwordNotStrongResponse;
                            } else if (value.length < passwordLength) {
                              return passwordMinLengthResponse;
                            }
                            return null;
                          },
                          controller: passwordController,
                          formKey: passwordFormKey,
                          errorResponse: passwordRequiredResponse),
                      const SizedBox(
                        height: 68,
                      ),
                      Container(
                        padding: AppTheme.lightGreenButtonMargin,
                        alignment: Alignment.center,
                        child: ReusableButtons(
                            title: registerButtonTitle,
                            circularAvatar: AppTheme.lightGreenCircularAvatar,
                            onTap: () {
                              var res = signUpUser(isLoading);
                              if (firstNameFormKey.currentState!.validate() &&
                                  lastNameFormKey.currentState!.validate() &&
                                  phoneNumberFormKey.currentState!.validate() &&
                                  passwordFormKey.currentState!.validate() &&
                                  emailFormKey.currentState!.validate() &&
                                  passwordFormKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = !res;
                                });
                              }

                              setState(() {});
                            },
                            isLoading: isLoading,
                            gradientColor: AppTheme.lightGreenButtonGradient,
                            buttonFontStyle: AppTheme.lightGreenButtonFontStyle,
                            buttonType: ButtonType.lightGreenButton),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          labelTextForAccountExist,
                          style: AppTheme.labelTextStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: AppTheme.lightGreenButtonMargin,
                        child: ReusableButtons(
                            title: loginButtonTitle,
                            onTap: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Body()));
                            }),
                            circularAvatar: AppTheme.lightGreyCircularAvatar,
                            gradientColor: AppTheme.lightGreyButtonGradient,
                            buttonFontStyle: AppTheme.lightGreyButtonFontStyle,
                            buttonType: ButtonType.lightGreyButton),
                      ),
                      const SizedBox(
                        height: AppTheme.boxHeight * 2,
                      )
                    ]),
              ),
            ))
      ]),
    );
  }
}
