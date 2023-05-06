import 'package:lottie/lottie.dart';

import '../dynamic_sizes.dart';
import '../widgets/widgets_imports.dart';

class KDialogs {
  simpleDialog({
    required content,
    title = "Alert",
    backgroundColor = KColors.kWhite,
    barrierDismissible = false,
    buttonColor = KColors.kGreen,
    textConfirm = "Done",
    confirmTextColor = KColors.kWhite,
    required VoidCallback onConfirm,
  }) {
    Get.defaultDialog(
      title: title,
      middleText: content,
      backgroundColor: backgroundColor,
      barrierDismissible: barrierDismissible,
      contentPadding: const EdgeInsets.only(bottom: 20.0),
      titlePadding: const EdgeInsets.only(top: 20.0),
      buttonColor: buttonColor,
      textConfirm: textConfirm,
      confirmTextColor: confirmTextColor,
      onConfirm: onConfirm,
    );
  }

  cancelDialog({
    required content,
    contentColor = KColors.kBlack,
    title = "Alert",
    backgroundColor = KColors.kWhite,
    barrierDismissible = false,
    buttonColor = KColors.kGreen,
    textConfirm = "Done",
    confirmTextColor = KColors.kWhite,
    required VoidCallback onConfirm,
    cancel = false,
    textCancel = "Cancel",
    cancelTextColor = KColors.kWhite,
    cancelButtonColor = KColors.kRed,
    height = .3,
  }) {
    Get.defaultDialog(
      title: title,
      backgroundColor: backgroundColor,
      barrierDismissible: barrierDismissible,
      titlePadding: const EdgeInsets.only(top: 20.0),
      content: SizedBox(
        height: kHeight(height),
        width: kWidth(.99),
        child: Column(
          children: [
            CustomText(
              text: content,
              textStyle: KTextStyles().normal(),
              maxLines: 4,
            ),
            heightBox(.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryButton(
                  text: textCancel,
                  width: .3,
                  color: cancelButtonColor,
                  function: () {
                    Get.back();
                  },
                ),
                PrimaryButton(
                  text: textConfirm,
                  width: .3,
                  function: onConfirm,
                  color: buttonColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  lottieSimpleDialog({
    required lottieAsset,
    required content,
    title = "Alert",
    backgroundColor = KColors.kWhite,
    barrierDismissible = false,
    buttonColor = KColors.kGreen,
    textConfirm = "Done",
    confirmTextColor = KColors.kWhite,
    height = .3,
    required VoidCallback onConfirm,
  }) {
    Get.defaultDialog(
      title: title,
      middleText: content,
      backgroundColor: backgroundColor,
      barrierDismissible: barrierDismissible,
      titlePadding: const EdgeInsets.only(top: 20.0),
      content: SizedBox(
        height: kHeight(height),
        width: kWidth(.99),
        child: Column(
          children: [
            LottieBuilder.asset(
              lottieAsset,
              width: kWidth(.4),
            ),
            heightBox(.03),
            CustomText(
              text: content,
              textStyle: KTextStyles().normal(),
              maxLines: 4,
            ),
          ],
        ),
      ),
      buttonColor: buttonColor,
      textConfirm: textConfirm,
      confirmTextColor: confirmTextColor,
      onConfirm: onConfirm,
    );
  }

  lottieCancelDialog({
    required lottieAsset,
    required content,
    contentColor = KColors.kBlack,
    title = "Alert",
    backgroundColor = KColors.kWhite,
    barrierDismissible = false,
    buttonColor = KColors.kGreen,
    textConfirm = "Done",
    confirmTextColor = KColors.kWhite,
    required VoidCallback onConfirm,
    cancel = false,
    textCancel = "Cancel",
    cancelTextColor = KColors.kWhite,
    cancelButtonColor = KColors.kRed,
    height = .3,
  }) {
    Get.defaultDialog(
      title: title,
      backgroundColor: backgroundColor,
      barrierDismissible: barrierDismissible,
      titlePadding: const EdgeInsets.only(top: 20.0),
      content: SizedBox(
        height: kHeight(height),
        width: kWidth(.99),
        child: Column(
          children: [
            LottieBuilder.asset(
              lottieAsset,
              width: kWidth(.4),
            ),
            heightBox(.03),
            CustomText(
              text: content,
              textStyle: KTextStyles().normal(),
              maxLines: 4,
            ),
            heightBox(.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryButton(
                  text: textCancel,
                  width: .3,
                  color: cancelButtonColor,
                  function: () {
                    Get.back();
                  },
                ),
                PrimaryButton(
                  text: textConfirm,
                  width: .3,
                  function: onConfirm,
                  color: buttonColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
