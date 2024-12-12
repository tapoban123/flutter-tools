// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CommentsModel {
  final int id;
  final String name;
  final String email;
  final String body;

  CommentsModel({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  CommentsModel copyWith({
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return CommentsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory CommentsModel.fromMap(Map<String, dynamic> map) {
    return CommentsModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentsModel.fromJson(String source) =>
      CommentsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentsModel(id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(covariant CommentsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.email == email &&
        other.body == body;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ body.hashCode;
  }
}
