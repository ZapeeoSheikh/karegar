class Users {
  final String userName;
  final String userEmail;
  final String userId;
  final String userDeviceId;
  final String imageUrl;
  Users(
      {required this.userName,
      required this.userEmail,
      required this.userId,
      required this.imageUrl,
      required this.userDeviceId});

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userId': userId,
      'userDeviceId': userDeviceId,
      'imageUrl' : imageUrl,
    };
  }

  Users.fromJson(Map<String, dynamic> json)
      : this(
          userName: json['userName'] as String,
          userEmail: json['userEmail'] as String,
          userId: json['userId'] as String,
          userDeviceId: json['userDeviceId'] as String,
          imageUrl: json['imageUrl'],
        );
}
