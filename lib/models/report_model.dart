import 'package:oga_admin/models/post_model.dart';
import 'package:oga_admin/models/user_model.dart';

class ReportModel {
  String reportId = "";
  UserModel reportedBy = UserModel.empty();
  PostModel post = PostModel.empty();
  String status = "pending";
  String reason = "";
  String createdAt = "";
  String updatedAt = "";
  String title = "";

  ReportModel({
    required this.reportId,
    required this.reportedBy,
    required this.post,
    required this.status,
    required this.reason,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
  });

  ReportModel.empty();

  ReportModel copyWith({
    String? reportId,
    UserModel? reportedBy,
    PostModel? post,
    String? status,
    String? reason,
    String? createdAt,
    String? updatedAt,
    String? title,
  }) {
    return ReportModel(
      reportId: reportId ?? this.reportId,
      reportedBy: reportedBy ?? this.reportedBy,
      post: post ?? this.post,
      status: status ?? this.status,
      reason: reason ?? this.reason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
    );
  }

  // From JSON constructor
  ReportModel.fromJson(Map<String, dynamic> json) {
    reportId = json["_id"] ?? "";
    reportedBy = UserModel.fromJson(json["reportedBy"] ?? {});
    post = PostModel.fromJson(json["post"] ?? {});
    status = json["status"] ?? "pending";
    reason = json["reason"] ?? "";
    createdAt = json["createdAt"] ?? "";
    updatedAt = json["updatedAt"] ?? "";
    title = json["title"] ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": reportId,
      "reportedBy": reportedBy.toJson(),
      "post": post.toJson(),
      "status": status,
      "reason": reason,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      'title': title,
    };
  }

  @override
  String toString() {
    return 'ReportModel{reportId: $reportId, reportedBy: $reportedBy, post: $post, status: $status, reason: $reason, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
