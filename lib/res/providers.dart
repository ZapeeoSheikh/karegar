//Place your providers in this list
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:softec/view_models/auth_view_model.dart';
import 'package:softec/view_models/jobs_view_model.dart';
import 'package:softec/view_models/make_offer_view_model.dart';
import 'package:softec/view_models/post_job_view_model.dart';


List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
  ChangeNotifierProvider<PostJobViewModel>(create: (_) => PostJobViewModel()),
  ChangeNotifierProvider<JobsViewModel>(create: (_) => JobsViewModel()),
  ChangeNotifierProvider<MakeOfferViewModel>(create: (_) => MakeOfferViewModel()),
];
