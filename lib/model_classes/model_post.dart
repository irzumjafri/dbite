import 'dart:convert';

List<PostModel> postModelFromJson(String str) => List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  PostModel({
    this.userId,
    this.postId,
    this.postDescription,
    this.postContent,
    this.publishTime,
    this.validity,
  });

  String userId;
  String postId;
  String postDescription;
  String postContent;
  DateTime publishTime;
  String validity;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    userId: json["user_id"],
    postId: json["post_id"],
    postDescription: json["post_description"],
    postContent: json["post_content"],
    publishTime: DateTime.parse(json["publish_time"]),
    validity: json["validity"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "post_id": postId,
    "post_description": postDescription,
    "post_content": postContent,
    "publish_time": publishTime.toIso8601String(),
    "validity": validity,
  };
}
