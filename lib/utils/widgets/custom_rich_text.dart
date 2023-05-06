import 'package:auto_size_text/auto_size_text.dart';

import 'widgets_imports.dart';

enum FocusPosition { start, end }

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    Key? key,
    required this.normalText,
    required this.focusedText,
    this.focusedFontSize = 16,
    this.normalFontSize = 14,
    this.normalColor = KColors.kBlack,
    this.focusedColor = KColors.kBlack,
    this.focusPosition = FocusPosition.start,
    this.maxLines = 1,
  }) : super(key: key);
  final String normalText, focusedText;
  final double focusedFontSize, normalFontSize;
  final Color normalColor, focusedColor;
  final FocusPosition focusPosition;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
        children: [
          if (focusPosition == FocusPosition.start)
            TextSpan(
              text: focusedText,
              style: TextStyle(
                color: focusedColor,
                fontSize: focusedFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          TextSpan(
            text: normalText,
            style: TextStyle(
              color: normalColor,
              fontSize: normalFontSize,
            ),
          ),
          if (focusPosition == FocusPosition.end)
            TextSpan(
              text: focusedText,
              style: TextStyle(
                color: focusedColor,
                fontSize: focusedFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
      style: TextStyle(
        color: normalColor,
        fontSize: normalFontSize,
      ),
      maxLines: maxLines,
    );
  }
}
