class LoginModel {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

/* ================= RESPONSE ================= */

class LoginResponseModel {
  final bool success;
  final String message;
  final LoginData? data;

  LoginResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      data: map['data'] != null ? LoginData.fromMap(map['data']) : null,
    );
  }
}

class LoginData {
  final String accessToken;
  final String refreshToken;
  final String role;
  final String id;
  final UserModel user;

  LoginData({
    required this.accessToken,
    required this.refreshToken,
    required this.role,
    required this.id,
    required this.user,
  });

  factory LoginData.fromMap(Map<String, dynamic> map) {
    return LoginData(
      accessToken: map['accessToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
      role: map['role'] ?? '',
      id: map['_id'] ?? '',
      user: UserModel.fromMap(map['user'] ?? {}),
    );
  }
}

class UserModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final bool enableNotifications;
  final bool dnd;
  final int totalPosts;
  final String currentPlan;
  final String createdAt;
  final String updatedAt;
  final Avatar avatar;
  final VerificationInfo verificationInfo;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.enableNotifications,
    required this.dnd,
    required this.totalPosts,
    required this.currentPlan,
    required this.createdAt,
    required this.updatedAt,
    required this.avatar,
    required this.verificationInfo,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      enableNotifications: map['enableNotifications'] ?? false,
      dnd: map['dnd'] ?? false,
      totalPosts: map['totalPosts'] ?? 0,
      currentPlan: map['currentPlan'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      avatar: Avatar.fromMap(map['avatar'] ?? {}),
      verificationInfo:
          VerificationInfo.fromMap(map['verificationInfo'] ?? {}),
    );
  }
}

class Avatar {
  final String publicId;
  final String url;

  Avatar({required this.publicId, required this.url});

  factory Avatar.fromMap(Map<String, dynamic> map) {
    return Avatar(
      publicId: map['public_id'] ?? '',
      url: map['url'] ?? '',
    );
  }
}

class VerificationInfo {
  final bool verified;
  final String token;

  VerificationInfo({required this.verified, required this.token});

  factory VerificationInfo.fromMap(Map<String, dynamic> map) {
    return VerificationInfo(
      verified: map['verified'] ?? false,
      token: map['token'] ?? '',
    );
  }
}
