class WebUrls extends _BaseUrl {
  WebUrls._();

  static const String kSignInUrl = "${_BaseUrl._kBaseUrl}/auth/signin";
  static const String kForgotPasswordOTPUrl =
      "${_BaseUrl._kBaseUrl}/auth/forgotPassword/sendOTP";
  static const String kVerifyOTPUrl =
      "${_BaseUrl._kBaseUrl}/auth/forgotPassword/VerifyEmail";
  static const String kCreatePasswordUrl =
      "${_BaseUrl._kBaseUrl}/auth/createPassword";
  static const String kAllUsersUrl = "${_BaseUrl._kBaseUrl}/admin/users";
  static const String kDeleteUserUrl = "${_BaseUrl._kBaseUrl}/admin/users";
  static const String kEditUserUrl = "${_BaseUrl._kBaseUrl}/admin/users";
  static const String kAllReportsUrl = "${_BaseUrl._kBaseUrl}/admin/reports";
  static const String kEditReportUrl = "${_BaseUrl._kBaseUrl}/admin/reports";
  static const String kSpecificReportUrl =
      "${_BaseUrl._kBaseUrl}/admin/reports";
  static const String kBanUserUrl = "${_BaseUrl._kBaseUrl}/admin/users";
  static const String kDeleteReportUrl = "${_BaseUrl._kBaseUrl}/admin/reports";
  static const String kBlockPostUrl = "${_BaseUrl._kBaseUrl}/admin/posts";
  static const String kUpdateProfileUrl =
      "${_BaseUrl._kBaseUrl}/user/user/updateProfile";
}

abstract class _BaseUrl {
  static const String _kBaseUrl = 'http://54.158.166.129:8000';
}
