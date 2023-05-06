import '../dynamic_sizes.dart';
import 'widgets_imports.dart';

class KSnackBar {
  successSnackBar(
    message, {
    position = SnackPosition.BOTTOM,
    duration = 1500,
  }) {
    return Get.snackbar(
      "Success",
      message,
      colorText: KColors.kWhite,
      backgroundColor: KColors.kGreen,
      snackPosition: position,
      margin: EdgeInsets.all(kWidth(.05)),
      duration: Duration(
        milliseconds: duration,
      ),
    );
  }

  errorSnackBar(
    message, {
    position = SnackPosition.BOTTOM,
    duration = 1500,
  }) {
    return Get.snackbar(
      "Error",
      message,
      colorText: KColors.kWhite,
      backgroundColor: KColors.kRed,
      snackPosition: position,
      margin: EdgeInsets.all(kWidth(.05)),
      duration: Duration(
        milliseconds: duration,
      ),
    );
  }

  infoSnackBar(
    title,
    message, {
    Color backgroundColor = KColors.kPrimary,
    Color textColor = KColors.kWhite,
    position = SnackPosition.BOTTOM,
    duration = 1500,
  }) {
    return Get.snackbar(
      title,
      message,
      colorText: textColor,
      backgroundColor: backgroundColor,
      snackPosition: position,
      margin: EdgeInsets.all(kWidth(.05)),
      duration: Duration(
        milliseconds: duration,
      ),
    );
  }
}
