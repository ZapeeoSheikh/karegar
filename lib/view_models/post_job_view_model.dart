import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:softec/data/app_exceptions.dart';
import 'package:softec/models/jobs_model.dart';

enum JobPostState {
  loading,
  uploaded,
  unknown,
}

class PostJobViewMode extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  JobPostState state = JobPostState.unknown;
  CollectionReference jobsCollection =
      FirebaseFirestore.instance.collection('jobs');

  Future<void> postJob({
    required String title,
    required String description,
    required String imageUrl,
    required String videoPath,
    required String budget,
    required String time,
    required String date,
    required List<double> location,
    required String status,
    required String address,
    required int numberOfBids,
    required String jobType,
    required String name,
  }) async {
    state = JobPostState.loading;
    notifyListeners();
    try {
      Job newJob = Job(
          title: title,
          description: description,
          videoUrl: '',
          budget: budget,
          time: time,
          date: date,
          location: location,
          address: address,
          numberOfBids: numberOfBids,
          postedBy: firebaseAuth.currentUser!.uid,
          jobType: jobType,
          jobId: '',
          jobStatus: 'active',
          name: name,
          imageUrl: imageUrl,
          );
      DocumentReference jobId = await jobsCollection.add(newJob.toJson());
      newJob.jobId = jobId.id;
      state = JobPostState.uploaded;
      notifyListeners();
    } on FirebaseException catch (error) {
      state = JobPostState.unknown;
      notifyListeners();
      throw CustomException(error.message, 'Unable to post job');
    } catch (error) {
      state = JobPostState.unknown;
      notifyListeners();
      throw CustomException('Unable to post the job', 'Something went wrong');
    }
  }
}
