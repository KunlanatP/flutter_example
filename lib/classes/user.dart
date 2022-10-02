import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String firstname;
  final String lastname;
  final String email;
  final String username;
  final String password;

  UserModel({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.username,
    required this.password,
  });

  UserModel copyWith({
    String? firstname,
    String? lastname,
    String? email,
    String? username,
    String? password,
  }) {
    return UserModel(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'username': username,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      firstname: map['firstname'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(firstname: $firstname, lastname: $lastname, email: $email, username: $username, password: $password)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.firstname == firstname &&
        other.lastname == lastname &&
        other.email == email &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    return firstname.hashCode ^
        lastname.hashCode ^
        email.hashCode ^
        username.hashCode ^
        password.hashCode;
  }
}
