class UserModel {
  final String userId;
  final String name;
  final String email;
  final String password;
  final String age;
  final String education;
  final String job;
  final String requiredWhatsApp;
  final String optionalWhatsApp;
  final String gender;
  final String fcn_token;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.age,
    required this.education,
    required this.job,
    required this.requiredWhatsApp,
    required this.optionalWhatsApp,
    required this.gender,
    required this.fcn_token,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'userId': userId,
      'name': name,
      'password': password,
      'requiredWhatsApp': requiredWhatsApp,
      'optionalWhatsApp': optionalWhatsApp,
      'job': job,
      'age': age,
      'education': education,
      'gender': gender,
      "fcn_token": fcn_token
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      optionalWhatsApp: json['optionalWhatsApp'].toString(),
      name: json['name'],
      password: json["password"],
      age: json["age"],
      education: json["education"],
      job: json["job"],
      requiredWhatsApp: json['requiredWhatsApp'].toString(),
      gender: json["gender"],
      email: json["email"],
      fcn_token: json["fcn_token"],
    );
  }
}
