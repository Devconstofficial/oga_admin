class UserModel {
  String userId = "";
  String name = "Unknown";
  String username = "";
  String email = "";
  String phoneNumber = "";
  String password = "";
  String location = "";
  String city = "";
  String state = "";
  String profilePicture = "";
  String visibility = "Public";
  List<String> roles = [];
  String status = "active";
  List<String> savedPosts = [];
  List<String> posts = [];
  List<String> followers = [];
  List<String> following = [];
  List<String> notificationIds = [];
  String createdAt = "";
  String updatedAt = "";

  UserModel.empty();

  UserModel({
    required this.userId,
    required this.name,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.location,
    required this.city,
    required this.state,
    required this.profilePicture,
    required this.visibility,
    required this.roles,
    required this.status,
    required this.savedPosts,
    required this.posts,
    required this.followers,
    required this.following,
    required this.notificationIds,
    required this.createdAt,
    required this.updatedAt,
  });

  UserModel copyWith({
    String? userId,
    String? name,
    String? username,
    String? email,
    String? phoneNumber,
    String? password,
    String? location,
    String? city,
    String? state,
    String? profilePicture,
    String? visibility,
    List<String>? roles,
    String? status,
    List<String>? savedPosts,
    List<String>? posts,
    List<String>? followers,
    List<String>? following,
    List<String>? notificationIds,
    String? createdAt,
    String? updatedAt,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      location: location ?? this.location,
      city: city ?? this.city,
      state: state ?? this.state,
      profilePicture: profilePicture ?? this.profilePicture,
      visibility: visibility ?? this.visibility,
      roles: roles ?? this.roles,
      status: status ?? this.status,
      savedPosts: savedPosts ?? this.savedPosts,
      posts: posts ?? this.posts,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      notificationIds: notificationIds ?? this.notificationIds,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json["_id"] ?? "";
    name = json["name"] ?? "Unknown";
    username = json["username"] ?? "";
    email = json["email"] ?? "";
    phoneNumber = json["phoneNumber"] ?? "";
    password = json["password"] ?? "";
    location = json["location"] ?? "";
    city = json["city"] ?? "";
    state = json["state"] ?? "";
    profilePicture = json["profilePicture"] ?? "";
    visibility = json["visibility"] ?? "Public";
    roles = List<String>.from(json["roles"] ?? ["user"]);
    status = json["status"] ?? "active";
    savedPosts = List<String>.from(json["savedPosts"] ?? []);
    posts = List<String>.from(json["posts"] ?? []);
    followers = List<String>.from(json["followers"] ?? []);
    following = List<String>.from(json["following"] ?? []);
    notificationIds = List<String>.from(json["notificationIds"] ?? []);
    createdAt = json["createdAt"] ?? "";
    updatedAt = json["updatedAt"] ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": userId,
      "name": name,
      "username": username,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
      "location": location,
      "city": city,
      "state": state,
      "profilePicture": profilePicture,
      "visibility": visibility,
      "roles": roles,
      "status": status,
      "savedPosts": savedPosts,
      "posts": posts,
      "followers": followers,
      "following": following,
      "notificationIds": notificationIds,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
    };
  }

  @override
  String toString() {
    return 'UserModel{name: $name, username: $username, email: $email, phoneNumber: $phoneNumber, location: $location, city: $city, state: $state, visibility: $visibility, roles: $roles, status: $status, profilePicture: $profilePicture, followers: $followers, following: $following}';
  }
}
