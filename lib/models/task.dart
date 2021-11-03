import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:tasks_app_provider_consumer/models/enums/priority.dart';

class Task {
  
  final int userId;
  final String name;
  final String description;
  final Priority priority;

  Task({
    required this.userId,
    required this.name,
    required this.description,
    required this.priority,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'description': description,
      'priority': EnumToString.convertToString(priority),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      userId: map['userId'],
      name: map['name'],
      description: map['description'],
      priority: EnumToString.fromString(Priority.values, map['priority'])!,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}
