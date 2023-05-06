class Users {
  final String userName;
  final String userEmail;
  final String userId;
  final String userDeviceId;
  final String imageUrl;
  final String cnicNumber;
  final String contactNumber;
  final List<double> coordinates;
  final String userType;
  Users(
      {required this.userName,
      required this.userEmail,
      required this.userId,
      required this.imageUrl,
      required this.userDeviceId,
      required this.cnicNumber,
      required this.coordinates,
      required this.contactNumber,
      required this.userType,
      });

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userId': userId,
      'userDeviceId': userDeviceId,
      'imageUrl' : imageUrl,
      'cnicNumber' : cnicNumber,
      'coordinates' : coordinates,
      'contactNumber' : contactNumber,
      'userType' : userType,
    };
  }

  Users.fromJson(Map<String, dynamic> json)
      : this(
          userName: json['userName'] as String,
          userEmail: json['userEmail'] as String,
          userId: json['userId'] as String,
          userDeviceId: json['userDeviceId'] as String,
          imageUrl: json['imageUrl'],
          cnicNumber: json['cnicNumber'],
          contactNumber: json['contactNumber'],
          coordinates: json['coordinates'],
          userType: json['userType'],
        );
}
