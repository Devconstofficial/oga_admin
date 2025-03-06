import 'dart:developer';

import 'package:oga_admin/models/report_model.dart';
import 'package:oga_admin/models/response_model.dart';
import 'package:oga_admin/services/http_client_request.dart';
import 'package:oga_admin/services/web_urls.dart';
import 'package:oga_admin/utils/session_management/session_management.dart';
import 'package:oga_admin/utils/session_management/session_token_keys.dart';

class ReportService {
  ReportService._();

  static final ReportService _instance = ReportService._();

  factory ReportService() {
    return _instance;
  }

  final HTTPRequestClient _client = HTTPRequestClient();
  final SessionManagement _sessionManagement = SessionManagement();

  Future<dynamic> getReports() async {
    final token = await _sessionManagement.getSessionToken(
        tokenKey: SessionTokenKeys.kUserTokenKey);
    ResponseModel responseModel = await _client.customRequest(
      'GET',
      url: WebUrls.kAllReportsUrl,
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token'
      },
    );
    log("token----------$token");
    log("response----------$responseModel");
    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return (responseModel.data["data"]["reports"] as List)
          .map((e) => ReportModel.fromJson(e))
          .toList();
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> getSpecificReport({required String id}) async {
    final token = await _sessionManagement.getSessionToken(
        tokenKey: SessionTokenKeys.kUserTokenKey);
    ResponseModel responseModel = await _client.customRequest(
      'GET',
      url: "${WebUrls.kSpecificReportUrl}/$id",
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token'
      },
    );

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return ReportModel.fromJson(responseModel.data['data']['reports']);
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> updateReport(
      {required Map<String, dynamic> body, required String id}) async {
    final token = await _sessionManagement.getSessionToken(
        tokenKey: SessionTokenKeys.kUserTokenKey);
    ResponseModel responseModel = await _client.customRequest(
      'PUT',
      url: "${WebUrls.kEditReportUrl}/$id",
      requestBody: body,
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token'
      },
    );

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return true;
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> deleteReport({required String id}) async {
    final token = await _sessionManagement.getSessionToken(
        tokenKey: SessionTokenKeys.kUserTokenKey);
    ResponseModel responseModel = await _client.customRequest(
      'DELETE',
      url: "${WebUrls.kDeleteReportUrl}/$id",
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token'
      },
    );

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return true;
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> blockPost({required String id}) async {
    final token = await _sessionManagement.getSessionToken(
        tokenKey: SessionTokenKeys.kUserTokenKey);
    ResponseModel responseModel = await _client.customRequest(
      'POST',
      url: "${WebUrls.kBlockPostUrl}/$id/block",
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token'
      },
    );

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return true;
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }
}
