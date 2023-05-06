import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:softec/data/app_exceptions.dart';
import 'package:softec/res/global_variables.dart';

import '../models/jobs_model.dart';

enum ShowJobsState{
  loading,
  completed,
  error,
  unknown,
}

class JobsViewModel extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference jobsCollection =
      FirebaseFirestore.instance.collection('jobs');
  ShowJobsState state = ShowJobsState.unknown;

  //---------------------Jobs----------------------
  //List of postedJobs
  List<Job> postedJobs = [];
  List<DocumentSnapshot> jobsDocsId = [];
  //My jobs
  List<Job> myJobs = [];
  List<DocumentSnapshot> myJobsDocId = [];

  Future<void> showPostedJobs() async{
    try{
      jobsCollection.where('JobStatus', isEqualTo: 'active').snapshots().listen((event) { 
        event.docChanges.forEach((element) {
            if(!jobsDocsId.contains(element.doc)){
              jobsDocsId.add(element.doc);
            }
         });
        jobsDocsId.forEach((element) { 
          Map<String, dynamic> data = element.data() as Map<String,dynamic>;
            postedJobs.add(Job.fromJson(data));
        });
        notifyListeners();
      });
    }on FirebaseException catch(error){
      state = ShowJobsState.error;
      notifyListeners();
      throw CustomException(error.message, 'Unable to load posts');
    } catch (error){
      state = ShowJobsState.error;
      notifyListeners();
      throw CustomException('Something went wrong while showing the posts', 'Unable to load posts');
    }
  }

  Future<void> showMyJobs() async {
    try{
      jobsCollection.where('postedBy', isEqualTo: currentUser!.userId).snapshots().listen((event) { 
        event.docChanges.forEach((element) { 
          if(!myJobsDocId.contains(element.doc)){
            myJobsDocId.add(element.doc);
          }
        });
        myJobsDocId.forEach((element) { 
          Map<String, dynamic> data = element.data() as Map<String,dynamic>;
            myJobs.add(Job.fromJson(data));
        });
        notifyListeners();
      });
    }on FirebaseException catch(error){
      state = ShowJobsState.error;
      notifyListeners();
      throw CustomException(error.message, 'Unable to fetch jobs');
    } catch (error){
      state = ShowJobsState.error;
      notifyListeners();
      throw CustomException('Something went wrong while fetching jobs.', 'Unable to fetch jobs');
    }
  }
}
