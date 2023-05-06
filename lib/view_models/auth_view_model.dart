import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:softec/data/app_exceptions.dart';
import 'package:softec/res/global_variables.dart';

import '../models/users_model.dart';

enum AuthState { loading, logedIn, logedOut, unknown }

class AuthViewModel extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  //-----States------------------------------------
  AuthState authState = AuthState.unknown;

  //--------Customer Sign up -----------
  Future<void> signUp({
    required String email,
    required String password,
    required String userName,
    required UserType userType,
    String? cnic,
    String? phoneNumber,
    String? address,
    List<double>? coordinates,
    List<String>? skills,
  }) async {
    authState = AuthState.loading;
    notifyListeners();
    try {
      UserCredential credentials = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      Users newUser = Users(
        userName: userName,
        userEmail: email,
        userId: credentials.user!.uid,
        imageUrl: 'N/A',
        userDeviceId: 'N/A',
        cnicNumber: userType == UserType.customer ? 'N/A' : cnic!,
        coordinates: userType == UserType.customer ? [] : coordinates!,
        contactNumber: userType == UserType.customer ? 'N/A' : phoneNumber!,
        userType: userType == UserType.customer ? 'customer' : 'tradePerson',
        skills: userType == UserType.customer ? ['N/A'] : skills!,
      );
      await usersCollection.doc(credentials.user!.uid).set(newUser.toJson());
      authState = AuthState.logedIn;
      notifyListeners();
    } on FirebaseAuthException catch (error) {
      authState = AuthState.unknown;
      notifyListeners();
      throw CustomException(error.message, 'Failed to Sign-up');
    } catch (error) {
      authState = AuthState.unknown;
      notifyListeners();
      throw CustomException('Something went wrong', 'Error');
    }
  }

  Future<void> login({required String email, required String password}) async {
    authState = AuthState.loading;
    notifyListeners();
    try {
      UserCredential cred = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      DocumentSnapshot getUser =
          await usersCollection.doc(cred.user!.uid).get();
      currentUser = Users.fromJson(getUser.data() as Map<String, dynamic>);
      currentUserType = currentUser!.userType == 'customer'
          ? UserType.customer
          : UserType.tradePerson;
      authState = AuthState.logedIn;
      notifyListeners();
    } on FirebaseAuthException catch (error) {
      authState = AuthState.unknown;
      notifyListeners();
      throw CustomException(error.message, 'Failed to Login');
    } catch (error) {
      authState = AuthState.unknown;
      notifyListeners();
      throw CustomException(error.toString(), 'Error');
    }
  }
}
