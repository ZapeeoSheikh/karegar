
import 'dart:convert';
import 'dart:io';

import 'package:compress_images_flutter/compress_images_flutter.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:get/get.dart';
import 'package:softec/view/post_tasks/post_task_screen.dart';

import '../view/home_page.dart';
import '../view/profile.dart';

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
  ProfileScreen(),

].obs;

Future convertToBase64(File? img) async {
  File? result = await CompressImagesFlutter().compressImage(img!.path, quality: 20);
  File rotatedImage = await FlutterExifRotation.rotateImage(path: result!.path);
  return base64Encode(rotatedImage.readAsBytesSync());
}


/// API Constants

const Map<String, String> headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};
