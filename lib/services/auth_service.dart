import 'dart:convert';
import 'dart:developer';

import 'package:oga_admin/models/response_model.dart';
import 'package:oga_admin/models/user_model.dart';
import 'package:oga_admin/services/http_client_request.dart';
import 'package:oga_admin/services/web_urls.dart';
import 'package:oga_admin/utils/session_management/session_management.dart';
import 'package:oga_admin/utils/session_management/session_token_keys.dart';

class AuthService {
  AuthService._();

  static final AuthService _instance = AuthService._();

  factory AuthService() {
    return _instance;
  }

  final HTTPRequestClient _client = HTTPRequestClient();
  final SessionManagement _sessionManagement = SessionManagement();

  Future<dynamic> signInUser(
      {required String email, required String password}) async {
    ResponseModel responseModel = await _client.customRequest(
      'POST',
      url: WebUrls.kSignInUrl,
      requestBody: {
        "email": email,
        "password": password,
      },
      requestHeader: {
        'Content-Type': 'application/json',
      },
    );
    log("signInUser==================> $responseModel");
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      await _sessionManagement.saveSession(
        tokenKey: SessionTokenKeys.kUserTokenKey,
        tokenValue: responseModel.data["data"]["authToken"],
      );

      await _sessionManagement.saveSession(
        tokenKey: SessionTokenKeys.kUserModelKey,
        tokenValue: jsonEncode(responseModel.data["data"]["user"]),
      );

      log("user data is -----------${responseModel.data['data']}");
      return UserModel.fromJson(responseModel.data["data"]["user"]);
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> forgotPassword({
    required String email,
  }) async {
    ResponseModel responseModel = await _client.customRequest(
      'POST',
      url: WebUrls.kForgotPasswordOTPUrl,
      requestBody: {
        "email": email,
      },
      requestHeader: {
        'Content-Type': 'application/json',
      },
    );
    log("forgotPassword==================> $responseModel");
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return true;
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> verifyOTP(
      {required String email, required String otp}) async {
    ResponseModel responseModel = await _client.customRequest(
      'POST',
      url: WebUrls.kVerifyOTPUrl,
      requestBody: {
        "email": email,
        "otp": otp,
      },
      requestHeader: {
        'Content-Type': 'application/json',
      },
    );
    log("verifyOTP==================> $responseModel");
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return true;
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> createNewPassword(
      {required String email, required String newPassword}) async {
    ResponseModel responseModel = await _client.customRequest(
      'POST',
      url: WebUrls.kCreatePasswordUrl,
      requestBody: {
        "email": email,
        "password": newPassword,
      },
      requestHeader: {
        'Content-Type': 'application/json',
      },
    );
    log("createNewPassword==================> $responseModel");
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return true;
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }
}
