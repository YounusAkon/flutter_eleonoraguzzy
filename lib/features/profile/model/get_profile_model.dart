class ProfileModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? credit;
  final String? role;
  final bool? enableNotifications;
  final bool? dnd;
  final String? subscription;
  final String? avatarUrl;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.credit,
    this.role,
    this.enableNotifications,
    this.dnd,
    this.subscription,
    this.avatarUrl,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['_id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      credit: map['credit']?.toString(),
      role: map['role'],
      enableNotifications: map['enableNotifications'],
      dnd: map['dnd'],
      subscription: map['currentPlan'] ?? map['subscription'],
      avatarUrl: (map['avatar']?['url'] as String?)?.isNotEmpty == true
          ? map['avatar']['url']
          : null,
    );
  }

  //tojson
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'phone': phone,
    'credit': credit,
    'role': role,
    'enableNotifications': enableNotifications,
    'dnd': dnd,
    'subscription': subscription,
    'avatarUrl': avatarUrl,
  };
  //fromjson
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      credit: json['credit'],
      role: json['role'],
      enableNotifications: json['enableNotifications'],
      dnd: json['dnd'],
      subscription: json['subscription'],
      avatarUrl: json['avatarUrl'],
    );
  }
}
