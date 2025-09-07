class AuthModel {
  final String email;
  final String password;

  // Constructor for creating an instance of AuthModel.
  AuthModel({
    required this.email,
    required this.password,
  });

  // A factory constructor to create an AuthModel instance from a JSON map.
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  // A method to convert the AuthModel instance into a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
