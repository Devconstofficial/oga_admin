import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

class CommonCode {

  static unFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

}
