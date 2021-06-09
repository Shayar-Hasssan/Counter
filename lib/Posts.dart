// To parse this JSON data, do
//
//     final dummy = dummyFromJson(jsonString);

import 'dart:convert';

Posts dummyFromJson(String str) => Posts.fromJson(json.decode(str));

String dummyToJson(Posts data) => json.encode(data.toJson());

class Posts {
  Posts({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
  List<Posts> fromJson(String str) =>
      List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));
  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
