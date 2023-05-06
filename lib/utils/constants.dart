
import 'package:get/get.dart';
import 'package:softec/view/post_tasks/post_task_screen.dart';

import '../view/home_page.dart';

/// App Constants

/// GetX Constants

var obscureText = true.obs;
var defaultObscureText = false.obs;
RxInt pageIndex = RxInt(0);
final pages = [
  HomePage(),
  const HomePage(),
  const PostTasksScreen(),
  const PostTasksScreen(),
  // globalAccessToken == "guest" ? LoginScreen() : AccountScreen(),
  HomePage(),

].obs;

/// API Constants

const Map<String, String> headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};
