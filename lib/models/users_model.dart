class Users {
  final String userName;
  final String userEmail;
  final String userId;
  final String userDeviceId;
  Users(
      {required this.userName,
      required this.userEmail,
      required this.userId,
      required this.userDeviceId});

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userId': userId,
      'userDeviceId': userDeviceId,
    };
  }

  Users.fromJson(Map<String, dynamic> json) 
    : this(
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
      userId: json['userId'] as String,
      userDeviceId: json['userDeviceId'] as String,
    );
  
}
