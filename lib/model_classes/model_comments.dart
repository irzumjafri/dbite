// To parse this JSON data, do
//
//     final commentData = commentDataFromJson(jsonString);

import 'dart:convert';

List<CommentData> commentDataFromJson(String str) => List<CommentData>.from(json.decode(str).map((x) => CommentData.fromJson(x)));

String commentDataToJson(List<CommentData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentData {
  CommentData({
    this.postId,
    this.commentById,
    this.commentData,
    this.validity,
  });

  String postId;
  String commentById;
  String commentData;
  String validity;

  factory CommentData.fromJson(Map<String, dynamic> json) => CommentData(
    postId: json["post_id"],
    commentById: json["comment_by_id"],
    commentData: json["comment_data"],
    validity: json["validity"],
  );

  Map<String, dynamic> toJson() => {
    "post_id": postId,
    "comment_by_id": commentById,
    "comment_data": commentData,
    "validity": validity,
  };
}
