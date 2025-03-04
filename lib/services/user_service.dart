import 'package:oga_admin/models/response_model.dart';
import 'package:oga_admin/models/user_model.dart';
import 'package:oga_admin/services/http_client_request.dart';
import 'package:oga_admin/services/web_urls.dart';
import 'package:oga_admin/utils/session_management/session_management.dart';
import 'package:oga_admin/utils/session_management/session_token_keys.dart';

class UserService {
  UserService._();

  static final UserService _instance = UserService._();

  factory UserService() {
    return _instance;
  }

  final HTTPRequestClient _client = HTTPRequestClient();
  final SessionManagement _sessionManagement = SessionManagement();

  Future<dynamic> getUsers() async {
    final token = await _sessionManagement.getSessionToken(
        tokenKey: SessionTokenKeys.kUserTokenKey);
    ResponseModel responseModel = await _client.customRequest(
      'GET',
      url: WebUrls.kAllUsersUrl,
      requestHeader: {
        'Content-Type': 'application/json',
        'Authorization': 'Baerer $token'
      },
    );

    if (responseModel.statusCode >= 200 && responseModel.statusCode <= 230) {
      return (responseModel.data["data"]["users"] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
    }
    return responseModel.data["message"] ?? responseModel.statusDescription;
  }

  Future<dynamic> deleteUser({required String id}) async {
    final token = await _sessionManagement.getSessionToken(
        tokenKey: SessionTokenKeys.kUserTokenKey);
    ResponseModel responseModel = await _client.customRequest(
      'DELETE',
      url: "${WebUrls.kDeleteUserUrl}/$id",
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

  Future<dynamic> updateUser(
      {required Map<String, dynamic> body, required String id}) async {
    final token = await _sessionManagement.getSessionToken(
        tokenKey: SessionTokenKeys.kUserTokenKey);
    ResponseModel responseModel = await _client.customRequest(
      'PUT',
      url: "${WebUrls.kEditUserUrl}/$id",
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
}
