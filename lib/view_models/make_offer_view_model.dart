import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:softec/data/app_exceptions.dart';
import 'package:softec/models/bid_model.dart';
import 'package:softec/utils/widgets/widgets_imports.dart';

enum MakeOfferState{
  loading,
  completed,
  unknown,
}

class MakeOfferViewModel extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference jobsCollection =
      FirebaseFirestore.instance.collection('jobs');
  MakeOfferState state = MakeOfferState.unknown;

  Future<void> makeOffer({
    required String jobId,
    required String bidderName,
    required String bidBy,
    required String amount,
    required String bidderRating,
  }) async {
    state = MakeOfferState.loading;
    notifyListeners();
    try{
    Bid newBid = Bid(
        amount: amount,
        bidBy: bidBy,
        taskId: jobId,
        bidderName: bidderName,
        bidderRating: bidderRating);
    await jobsCollection.doc(jobId).collection('bids').doc(bidBy).set(newBid.toJson());
    var doc = await jobsCollection.doc(jobId).get();
    var data = doc.data() as Map<String, dynamic>;
    int numberOfBids = data['numberOfBids'];
    numberOfBids++;
    await jobsCollection.doc(jobId).update({'numberOfBids' : numberOfBids});
    state = MakeOfferState.completed;
    notifyListeners();
    }on FirebaseException catch(error){
      state = MakeOfferState.unknown;
      notifyListeners();
      throw CustomException(error.message, error.code);
    } catch(error){
      state = MakeOfferState.unknown;
      notifyListeners();
      throw CustomException(error.toString(), 'Couldn\'t get bidders info');
    }
  }

  

}
