// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:softec/data/app_exceptions.dart';
// import 'package:softec/res/global_variables.dart';
//
// import '../models/users_model.dart';
//
// enum AuthState { loading, logedIn, logedOut, unknown }
//
// class AuthViewModel extends ChangeNotifier {
//   Users? userModel;
//   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//   CollectionReference usersCollection =
//       FirebaseFirestore.instance.collection('users');
//   //-----States------------------------------------
//   AuthState authState = AuthState.unknown;
//
//   Future<void> signUp(
//       {required String email,
//       required String password,
//       required String userName}) async {
//     authState = AuthState.loading;
//     notifyListeners();
//     try {
//       UserCredential credentials = await firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: password);
//       Users newUser = Users(
//           userName: userName,
//           userEmail: email,
//           userId: credentials.user!.uid,
//           userDeviceId: 'N/A',
//           imageUrl: 'N/A');
//       usersCollection.doc(credentials.user!.uid).set(newUser.toJson());
//       authState = AuthState.logedIn;
//       notifyListeners();
//     } on FirebaseAuthException catch (error) {
//       authState = AuthState.unknown;
//       notifyListeners();
//       throw CustomException(error.message, 'Failed to Sign-up');
//     } catch (error) {
//       authState = AuthState.unknown;
//       notifyListeners();
//       throw CustomException('Something went wrong', 'Error');
//     }
//   }
//
//   Future<void> login({required String email, required String password}) async {
//     authState = AuthState.loading;
//     notifyListeners();
//     try {
//       await firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);
//       DocumentSnapshot getUser =
//           await usersCollection.doc(firebaseAuth.currentUser!.uid).get();
//       currentUser = Users.fromJson(getUser.data() as Map<String, dynamic>);
//       authState = AuthState.logedIn;
//       notifyListeners();
//     } on FirebaseAuthException catch (error) {
//       authState = AuthState.unknown;
//       notifyListeners();
//       throw CustomException(error.message, 'Failed to Login');
//     } catch (error) {
//       authState = AuthState.unknown;
//       notifyListeners();
//       throw CustomException('Something went wrong', 'Error');
//     }
//   }
// }
