// To parse this JSON data, do
//
//     final resPosts = resPostsFromJson(jsonString);

import 'dart:convert';

List<ResPosts> resPostsFromJson(String str) => List<ResPosts>.from(json.decode(str).map((x) => ResPosts.fromJson(x)));

String resPostsToJson(List<ResPosts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResPosts {
  ResPosts({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory ResPosts.fromJson(Map<String, dynamic> json) => ResPosts(
    userId: json["userId"] == null ? null : json["userId"],
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    body: json["body"] == null ? null : json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "body": body == null ? null : body,
  };
}
