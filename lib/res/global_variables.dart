import 'package:firebase_auth/firebase_auth.dart';

import '../models/users_model.dart';

//User which is currently signedIn
enum UserType{
  customer,
  tradePerson,
}

enum JobStatus{
  active, 
  completed,
}

UserType? currentUserType;
Users? currentUser;
