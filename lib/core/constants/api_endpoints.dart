import 'package:flutter/foundation.dart';

base class ApiEndpoints {
  static const String socketUrl = _LocalHostWifi.socketUrl;

  static const String baseUrl = _LocalHostWifi.baseUrl;

  /// ### post
  static const String login = _Auth.login;
  static const String logout = _Auth.logout;
  static const String socialLogin = _Auth.socialLogin;

  static const String signup = _Auth.signup;
  static const String verifyCode = _Auth.verifyCode;
  static const String forgetPassword = _Auth.forgetPassword;
  static const String changePassword = _Auth.changePassword;
  static const String createNewPassword = _Auth.resetPassword;
  static const String refreshToken = _Auth.refreshToken;
  static const String helpSupport = _HelpSupport.helpSupport;
  static const String getInterests = _Interest.getallInterests;
  static const String verification = _Verification.verification;

  //---------------report----------------

  /// ### post
  static const String sendReport = _Report.sendReport;

  //------------notification----------------
  /// ### get
  static const String getAllNotifications = _Notification.getAllNotifications;

  /// ### post
  static const String readAllNotifications = _Notification.readAllNotifications;

  /// ### patch
  static String markNotificationAsRead({required String notificationId}) =>
      _Notification.markNotificationAsRead(notificationId);

  /// ### patch
  static const String markAllAsRead = _Notification.markAllAsRead;

  // ---------------------- USER -----------------------------
  /// ### get
  static String getuserbyId(String id) => _User.getuserbyId(id);

  /// ### delete
  static const String deleteAccount = _User.deleteAccount;

  /// ### patch
  static const String updateUser = _User.updateUser;

  // ---------------------- Tender -----------------------------
  static const String getAllTenders = _Tender.getAllTenders;

  //----------------------- We Contribute-----------------------
  static const String getAllSurvay = _WeContribute.getAllSurvay;
  static const String getAllElectoralProgress =
      _WeContribute.getAllElectoralProgress;
  static const String getAllRealTimeContribute =
      _WeContribute.getAllRealTimeContribute;
  static const String getAllVirtuousAdministration =
      _WeContribute.getAllVirtuousAdministration;
  static const String takeSurveys = _WeContribute.takeSurveys;
  //-------------------------Contents--------------------------
  static const String getAllContent = _Contents.getAllContents;
  static const String getAllEventShows = _Contents.getAllEventShows;

  //------------------------- Public Matter --------------------------
  static const String publicMatter = _PublicMatter.publicMatter;

  static const String getAllActiveCalls = _ActiveCalls.getAllActiveCalls;
}

//arrow360degree@gmail.com

class _RemoteServer {
  static const String socketUrl = 'https://fnfd0757-5005.inc1.devtunnels.ms';

  static const String baseUrl = 'https://fnfd0757-5005.inc1.devtunnels.ms/api/v1';
}

class _LocalHostWifi {
  static const String socketUrl = 'http://187.124.209.69:5005/';
  static const String baseUrl = 'http://187.124.209.69:5005/api/v1';
}

class _Auth {
  @protected
  static const String _authRoute = '${ApiEndpoints.baseUrl}/auth';
  static const String login = '$_authRoute/login';
  static const String logout = '$_authRoute/logout';
  static const String socialLogin = '$_authRoute/social-login';
  static const String signup = '$_authRoute/register';
  static const String forgetPassword = '$_authRoute/forget';
  static const String refreshToken = '$_authRoute/refresh-token';
  static const String verifyCode = '$_authRoute/verify-otp';
  static const String changePassword = '$_authRoute/change-password';
  static const String resetPassword = '$_authRoute/reset-password';
}

//------------------------------ Help&Support -----------------------------
class _HelpSupport {
  static const String _helpSupportRoute = '${ApiEndpoints.baseUrl}/support';
  static const String helpSupport = '$_helpSupportRoute/';
}

//------------------------------ Interest -----------------------------
class _Interest {
  static const String _interestRoute = '${ApiEndpoints.baseUrl}/interest';
  static const String getallInterests = '$_interestRoute/';
}

// ---------------------- Verification -----------------------------
class _Verification {
  static const String _verificationRoute =
      '${ApiEndpoints.baseUrl}/verification';
  static const String verification = '$_verificationRoute/create';
}

// ---------------------- Report -----------------------------
class _Report {
  static const String _reportRoute = '${ApiEndpoints.baseUrl}/reports';
  static const String sendReport = '$_reportRoute/';
}

// ---------------------- Notification -----------------------------
class _Notification {
  static const String _notificationRoute =
      '${ApiEndpoints.baseUrl}/notifications';
  static String markNotificationAsRead(String notificationId) =>
      '$_notificationRoute/$notificationId/read/';
  static const String readAllNotifications =
      '$_notificationRoute/read-all';
  static const String markAllAsRead = '$_notificationRoute/read-all';
  static const String getAllNotifications = '$_notificationRoute/';
}

// ---------------------- USER -----------------------------
class _User {
  static const String _userRoute = '${ApiEndpoints.baseUrl}/user';
  static String getuserbyId(String id) => '$_userRoute/profile';
  static const String updateUser = '$_userRoute/update-profile';
  static const String deleteAccount = '$_userRoute/profile';
}

// ---------------------- Tender -----------------------------
class _Tender {
  static const String _tenderRoute = '${ApiEndpoints.baseUrl}/tenders';
  static const String getAllTenders = _tenderRoute;
}

// ---------------------- We Contribute -----------------------------
class _WeContribute {
  static const String _weContributeRoute = '${ApiEndpoints.baseUrl}/surveys';
  static const String getAllSurvay = _weContributeRoute;
  static const String _electoralProgressRoute =
      '${ApiEndpoints.baseUrl}/we-contribute/electoral-programs';
  static const String getAllElectoralProgress = _electoralProgressRoute;
  static const String _realTimeContributeRoute =
      '${ApiEndpoints.baseUrl}/we-contribute/communications';
  static const String getAllRealTimeContribute = _realTimeContributeRoute;
  static const String _virtuousAdministrationRoute =
      '${ApiEndpoints.baseUrl}/we-contribute/virtuous-awards';
  static const String getAllVirtuousAdministration =
      _virtuousAdministrationRoute;

  static const String _takeSurveysRoute =
      '${ApiEndpoints.baseUrl}/surveys/participation';
  static const String takeSurveys = _takeSurveysRoute;
}

//---------------------- Contents -----------------------------
class _Contents {
  static const String _contentsRoute = '${ApiEndpoints.baseUrl}/content';
  static const String getAllContents = _contentsRoute;
  static const String _eventShowRoute = '${ApiEndpoints.baseUrl}/events';
  static const String getAllEventShows = _eventShowRoute;
}

//---------------------- Public Matter -----------------------------
class _PublicMatter {
  static const String _publicMatterRoute =
      '${ApiEndpoints.baseUrl}/public-matters/';
  static const String publicMatter = _publicMatterRoute;
}

class _ActiveCalls {
  static const String _activeCallsRoute =
      '${ApiEndpoints.baseUrl}/active-calls/';
  static const String getAllActiveCalls = _activeCallsRoute;
}
