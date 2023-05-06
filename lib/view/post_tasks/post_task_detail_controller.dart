


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PostTaskDetailController extends GetxController{

  TextEditingController taskController =TextEditingController();
  TextEditingController descriptionController =TextEditingController();
  TextEditingController locationController =TextEditingController();
  TextEditingController budgetController =TextEditingController();
  PageController pageController = PageController();
  Rx<DateTime> datePicked = Rx<DateTime>(DateTime.now());
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();








}