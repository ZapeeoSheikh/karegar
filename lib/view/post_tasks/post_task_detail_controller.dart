


// import 'dart:html';
// import 'dart:io';

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/constants.dart';

class PostTaskDetailController extends GetxController{

  TextEditingController taskController =TextEditingController();
  TextEditingController descriptionController =TextEditingController();
  TextEditingController locationController =TextEditingController();
  TextEditingController budgetController =TextEditingController();
  PageController pageController = PageController();
  Rx<DateTime> datePicked = Rx<DateTime>(DateTime.now());
  final formKey = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();

  final Rxn<File> image = Rxn<File>();
  final RxnString imageEdit = RxnString();
  final RxString base64Image = RxString("");

  Future pickFromCamera() async {
    var pickedFile = await ImagePicker().pickVideo(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,

    );

    var _image = pickedFile == null ? null : File(pickedFile.path);
    print(_image);
    if (_image != null) {
      imageEdit.value = null;

      image.value = File(_image.path);

      File rotatedImage = await FlutterExifRotation.rotateImage(path: image.value!.path);

      base64Image.value = await convertToBase64(rotatedImage);

      update();
    }
  }








}