import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../constants/utils.dart';

void httpErrorHandling({
  required Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 201:
      var responseMessage = jsonEncode(response.data);

      showSnackBar(context, jsonDecode(responseMessage)['message'],
          AppTheme.snackBarFailedBackColor, AppTheme.snackBarFailedTextStyle);
      break;
    default:
      showSnackBar(context, response.data, AppTheme.snackBarFailedBackColor,
          AppTheme.snackBarFailedTextStyle);
  }
}
