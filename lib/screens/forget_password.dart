import 'package:flutter/material.dart';
import '../components/buttons.dart';
import '../constants/app_constant.dart';
import '../constants/button_constant.dart';
import '../theme/app_theme.dart';
import './home.dart';
import 'reset_password.dart';

class ForgetPassWordScreen extends StatefulWidget {
  const ForgetPassWordScreen({super.key});
  @override
  State<ForgetPassWordScreen> createState() => _ForgetPassWordScreenState();
}

class _ForgetPassWordScreenState extends State<ForgetPassWordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 94.5, 0, 0),
        child: Column(children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(37.5, 0, 0, 0),
              alignment: Alignment.bottomLeft,
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(42, 0, 39, 46),
            child: const Text(
              forgetPasswordText,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
          ),
          Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: const Text(
                labelTextForEmail,
                style: TextStyle(
                    color: Color.fromRGBO(65, 92, 74, 1), fontSize: 14),
              )),
          Container(
            margin: const EdgeInsets.fromLTRB(32, 0, 32, 0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: hintTextForEmail,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const Text(
                  rememberPassword,
                  style: TextStyle(
                      color: Color.fromRGBO(65, 92, 74, 1), fontSize: 14),
                ),
              )),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            alignment: Alignment.center,
            child: ReusableButtons(
              title: 'continue',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ResetPassword(email: emailController.text)),
                );
              },
              gradientColor: AppTheme.continueButtonGradientColor,
              textColor: AppTheme.continueButtonColor,
              buttonFontStyle: AppTheme.continueButtonFontStyle,
              buttonType: ButtonType.continueButton,
            ),
          ),
        ]),
      ),
    );
  }
}
