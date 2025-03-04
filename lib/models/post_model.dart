class PostModel {
  String postId = "";
  String content = "";
  String link = "";
  String title = "";
  String contentType = "";
  List<String> tags = [];
  String description = "";
  List<String> likes = [];
  String user = "";
  List<String> comment = [];
  String status = "active";
  String createdAt = "";
  String updatedAt = "";

  PostModel({
    required this.postId,
    required this.content,
    required this.link,
    required this.title,
    required this.contentType,
    required this.tags,
    required this.description,
    required this.likes,
    required this.user,
    required this.comment,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  PostModel.empty();

  PostModel copyWith({
    String? postId,
    String? content,
    String? link,
    String? title,
    String? contentType,
    List<String>? tags,
    String? description,
    List<String>? likes,
    String? user,
    List<String>? comment,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return PostModel(
      postId: postId ?? this.postId,
      content: content ?? this.content,
      link: link ?? this.link,
      title: title ?? this.title,
      contentType: contentType ?? this.contentType,
      tags: tags ?? this.tags,
      description: description ?? this.description,
      likes: likes ?? this.likes,
      user: user ?? this.user,
      comment: comment ?? this.comment,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  PostModel.fromJson(Map<String, dynamic> json) {
    postId = json["_id"] ?? "";
    content = json["content"] ?? "";
    link = json["link"] ?? "";
    title = json["title"] ?? "";
    contentType = json["contentType"] ?? "";
    tags = List<String>.from(json["tags"] ?? []);
    description = json["description"] ?? "";
    likes = List<String>.from(json["likes"] ?? []);
    user = json["user"] ?? "";
    comment = List<String>.from(json["comment"] ?? []);
    status = json["status"] ?? "active";
    createdAt = json["createdAt"] ?? "";
    updatedAt = json["updatedAt"] ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": postId,
      "content": content,
      "link": link,
      "title": title,
      "contentType": contentType,
      "tags": tags,
      "description": description,
      "likes": likes,
      "user": user,
      "comment": comment,
      "status": status,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

  @override
  String toString() {
    return 'PostModel{postId: $postId, content: $content, link: $link, title: $title, contentType: $contentType, tags: $tags, description: $description, likes: $likes, user: $user, comment: $comment, status: $status, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
