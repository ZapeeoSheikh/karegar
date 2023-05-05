//Place your providers in this list
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:softec/view_models/auth_view_model.dart';


List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
];
