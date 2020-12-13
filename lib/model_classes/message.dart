// To parse this JSON data, do
//
//     final messageData = messageDataFromJson(jsonString);

import 'dart:convert';

List<MessageData> messageDataFromJson(String str) => List<MessageData>.from(json.decode(str).map((x) => MessageData.fromJson(x)));

String messageDataToJson(List<MessageData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageData {
  MessageData({
    this.messageThreadId,
    this.userId,
    this.coUserId,
    this.validity,
    this.messageSenderInfo,
    this.messageContent,
    this.validForSender,
    this.validForReceiver,
  });

  String messageThreadId;
  String userId;
  String coUserId;
  String validity;
  String messageSenderInfo;
  String messageContent;
  String validForSender;
  String validForReceiver;

  factory MessageData.fromJson(Map<String, dynamic> json) => MessageData(
    messageThreadId: json["message_thread_id"],
    userId: json["user_id"],
    coUserId: json["co_user_id"],
    validity: json["validity"],
    messageSenderInfo: json["message_sender_info"],
    messageContent: json["message_content"],
    validForSender: json["valid_for_sender"],
    validForReceiver: json["valid_for_receiver"],
  );

  Map<String, dynamic> toJson() => {
    "message_thread_id": messageThreadId,
    "user_id": userId,
    "co_user_id": coUserId,
    "validity": validity,
    "message_sender_info": messageSenderInfo,
    "message_content": messageContent,
    "valid_for_sender": validForSender,
    "valid_for_receiver": validForReceiver,
  };
}
