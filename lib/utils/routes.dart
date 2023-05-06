import 'package:flutter/material.dart';
// import 'package:softec/view/auth_page.dart';
import 'package:softec/view/post_tasks/post_task_screen.dart';

import '../view/bottom_navigation/view/bottom_nav.dart';
import '../view/home_page.dart';
import '../view/post_tasks/post_task_detail.dart';
import '../view/search_page.dart';

class Routes {
  //Add new route name
  static String homePage = 'homePageRoute';
  static String searchPage = 'SearchPageRoute';
  // static String authPage = 'AuthPageRoute';
  static String bottomNav = 'bottomNav';
  static String postTask = 'postTask';
  static String postTaskDetail = 'postTaskDetail';

  static Map<String, Widget Function(BuildContext)> generateRoutes() {
    return {
      //Add route here
      homePage: (context) => const HomePage(),
      searchPage: (context) => const SearchPage(),
      bottomNav: (context) => const BottomNavigation(),
      postTask: (context) => const PostTasksScreen(),
      postTaskDetail: (context) => PostTaskDetailScreen(title: ''),
      // authPage: (context) => const (),
    };
  }
}
