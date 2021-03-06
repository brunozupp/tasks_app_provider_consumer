import 'dart:convert';

class User {
  
  int? id;
  final String name;
  final String email;
  String password;
 
  User({
    this.id,
    required this.name,
    required this.email,
    this.password = "",
  });

  Map<String, dynamic> toMap() {
    return {
      if(id != null) 'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
