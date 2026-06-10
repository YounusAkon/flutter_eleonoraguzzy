class SignupModel {
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? confirmPassword;

  SignupModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
    this.confirmPassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phoneNumber,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }
}