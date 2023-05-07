import '../colors.dart';
import '../custom_text_styles.dart';
import '../widgets/widgets_imports.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final Color backgroundColor, shadowColor, backColor;
  final double elevation;
  final bool centerTitle;
  final double fontSize;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.actions,
    this.backgroundColor = KColors.kWhite,
    this.elevation = 0,
    this.shadowColor = KColors.kWhite,
    this.centerTitle = true,
    this.backColor = KColors.kBlack,
    this.fontSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      leading: BackButton(
        color: KColors.kWhite,
      ),
      elevation: elevation,
      shadowColor: shadowColor,
      title: CustomText(
        text: title,
        textStyle: KTextStyles().heading(
          textColor: KColors.kWhite,
          fontSize: fontSize
        ),
      ),
      centerTitle: centerTitle,
      iconTheme: IconThemeData(color: backColor),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
