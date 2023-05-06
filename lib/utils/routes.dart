import 'package:flutter/material.dart';

import '../view/home_page.dart';
import '../view/search_page.dart';

class Routes {
  //Add new route name
  static String homePage = 'homePageRoute';
  static String searchPage = 'SearchPageRoute';
  static String authPage = 'AuthPageRoute';

  static Map<String, Widget Function(BuildContext)> generateRoutes() {
    return {
      //Add route here
      homePage: (context) => const HomePage(),
      searchPage: (context) => const SearchPage(),
    };
  }
}
