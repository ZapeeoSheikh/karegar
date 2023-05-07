

// import 'dart:io';

import 'dart:io';

import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/constants.dart';

class ProfileController extends GetxController
{

  final Rxn<File> image = Rxn<File>();
  final RxnString imageEdit = RxnString();
  final RxString base64Image = RxString("");

  Future pickFromCamera() async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      imageQuality: 40,
      maxHeight: 1200,
      maxWidth: 1080,
    );

    var _image = pickedFile == null ? null : File(pickedFile.path);
    if (_image != null) {
      imageEdit.value = null;

      image.value = File(_image.path);

      File rotatedImage = await FlutterExifRotation.rotateImage(path: image.value!.path);

      base64Image.value = await convertToBase64(rotatedImage);
      update();
    }
  }






}