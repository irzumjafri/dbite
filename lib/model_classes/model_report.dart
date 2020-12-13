// To parse this JSON data, do
//
//     final reportModel = reportModelFromJson(jsonString);

import 'dart:convert';

List<ReportModel> reportModelFromJson(String str) => List<ReportModel>.from(json.decode(str).map((x) => ReportModel.fromJson(x)));

String reportModelToJson(List<ReportModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReportModel {
  ReportModel({
    this.userId,
    this.reportedPostId,
    this.reportId,
    this.reportReason,
    this.reportTime,
  });

  String userId;
  String reportedPostId;
  String reportId;
  String reportReason;
  DateTime reportTime;

  factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
    userId: json["user_id"],
    reportedPostId: json["reported_post_id"],
    reportId: json["report_id"],
    reportReason: json["report_reason"],
    reportTime: DateTime.parse(json["report_time"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "reported_post_id": reportedPostId,
    "report_id": reportId,
    "report_reason": reportReason,
    "report_time": reportTime.toIso8601String(),
  };
}
