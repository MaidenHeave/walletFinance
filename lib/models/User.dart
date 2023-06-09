class LoginRequest {
  final String mobile;
  final String password;

  LoginRequest({
    required this.mobile,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'mobile': mobile,
        'password': password,
      };
}

class LoginResponse {
  final String message;
  final String token;

  LoginResponse({required this.message, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(message: json['message'], token: json['access_token']);
}

class User {
  final String? name;
  final String? mobile;

  User({this.name, this.mobile});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(name: json["name"], mobile: json['mobile']);
}
