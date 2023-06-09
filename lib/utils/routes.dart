import 'package:flutter/material.dart';
import 'package:softec/view/post_tasks/post_task_screen.dart';

import '../view/bottom_navigation/view/bottom_nav.dart';
import '../view/home_page.dart';
import '../view/login_view.dart';
import '../view/post_tasks/post_task_detail.dart';
import '../view/profile.dart';
import '../view/search_page.dart';
import '../view/task_bids.dart';

class Routes {
  //Add new route name
  static String homePage = 'homePageRoute';
  static String searchPage = 'SearchPageRoute';
  static String authPage = 'AuthPageRoute';
  static String bottomNav = 'bottomNav';
  static String postTask = 'postTask';
  static String postTaskDetail = 'postTaskDetail';
  static String profile = 'profile';
  static String loginPage = 'login';
  static String tasksBid = 'taskBids';

  static Map<String, Widget Function(BuildContext)> generateRoutes() {
    return {
      //Add route here
      homePage: (context) => const HomePage(),
      searchPage: (context) => const SearchPage(),
      bottomNav: (context) => const BottomNavigation(),
      postTask: (context) => const PostTasksScreen(),
      postTaskDetail: (context) => PostTaskDetailScreen(title: ''),
      profile: (context) => const ProfileScreen(),
      loginPage: (context) => const Login(),
      tasksBid: (context) => const TasksBids(),
      // authPage: (context) => const (),
    };
  }
}
