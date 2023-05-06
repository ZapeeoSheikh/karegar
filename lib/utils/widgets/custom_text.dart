import 'package:auto_size_text/auto_size_text.dart';

import '../widgets/widgets_imports.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign alignText;
  final int maxLines;
  final double? minFontSize;
  final bool ellipsisText;

  const CustomText({
    Key? key,
    required this.text,
    required this.textStyle,
    this.alignText = TextAlign.center,
    this.maxLines = 1,
    this.ellipsisText = true,
    this.minFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      textAlign: alignText,
      maxLines: maxLines,
      minFontSize: minFontSize ?? 8,
      overflow: ellipsisText ? TextOverflow.ellipsis : null,
      style: textStyle,
    );
  }
}
