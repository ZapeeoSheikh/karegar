class Users {
  final String userName;
  final String userEmail;
  final String userId;
  final String userDeviceId;
  final String imageUrl;
  final String cnicNumber;
  final String contactNumber;
  final List<dynamic> coordinates;
  final String userType;
  final List<dynamic> skills;
  final String location;
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
      required this.skills,
      required this.location,
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
      'skills' : skills,
      'location' : location
    };
  }

  Users.fromJson(Map<String, dynamic> json)
      : this(
          userName: json['userName'] as String,
          userEmail: json['userEmail'] as String,
          userId: json['userId'] as String,
          userDeviceId: json['userDeviceId'] as String,
          imageUrl: json['imageUrl'] as String,
          cnicNumber: json['cnicNumber'] as String,
          contactNumber: json['contactNumber'] as String,
          coordinates: json['coordinates'] as List<dynamic>,
          userType: json['userType'] as String,
          skills: json['skills'] as List<dynamic>,
          location: json['location'],
        );
}
