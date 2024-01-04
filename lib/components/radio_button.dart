import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

enum RadioButtonType { payPal, applePay,notSelected }

class RadioButton extends StatefulWidget {
  final RadioButtonType type;
  final Function()? onTap;
   final Function(RadioButtonType?) onChange;
  final RadioButtonType? groupValue;
  late  RadioButtonType value;
 RadioButton(
      {super.key, required this.type, this.onTap, this.groupValue, required this.value, required this.onChange});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return widget.type == RadioButtonType.payPal
        ? InkWell(
            onTap: widget.onTap,
            child: Container(
                margin: AppTheme.marginLR32,
                width: 331,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.lightGrey)),
                child: Row(children: [
                   Radio<RadioButtonType>(
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChange
          ),
                  Container(
                    width: 100,
                    height: 40,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/paypal.png"),
                      ),
                    ),
                  ),
                ])),
          )
        : widget.type == RadioButtonType.applePay
            ? Container(
                margin: AppTheme.marginLR32,
                width: 331,
                height: 55,
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.lightGrey)),
                child: Row(children: [
                      Radio<RadioButtonType>(
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChange
          ),
                  Container(
                    width: 100,
                    height: 60,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/apple_pay_icon.png"),
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                  ),
                ]))
            : Container();
  }
}
