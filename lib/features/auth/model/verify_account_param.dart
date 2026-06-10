class VerifyAccountParam {
  final String email;
  final String code;

  VerifyAccountParam({
    required this.email,
    required this.code,
  });

  
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'otp': code,
    };
  }
}