// To parse this JSON data, do
//
//     final allChats = allChatsFromJson(jsonString);

import 'dart:convert';

List<AllChats> allChatsFromJson(String str) => List<AllChats>.from(json.decode(str).map((x) => AllChats.fromJson(x)));

String allChatsToJson(List<AllChats> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllChats {
  AllChats({
    this.userId,
    this.coUserId,
    this.messageThreadId,
    this.validity,
  });

  String userId;
  String coUserId;
  String messageThreadId;
  String validity;

  factory AllChats.fromJson(Map<String, dynamic> json) => AllChats(
    userId: json["user_id"],
    coUserId: json["co_user_id"],
    messageThreadId: json["message_thread_id"],
    validity: json["validity"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "co_user_id": coUserId,
    "message_thread_id": messageThreadId,
    "validity": validity,
  };
}
