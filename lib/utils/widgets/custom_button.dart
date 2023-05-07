

import '../colors.dart';
import '../custom_text_styles.dart';
import '../dynamic_sizes.dart';
import 'widgets_imports.dart';


class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final double width;
  final double height;
  final double fontSize;
  final double borderRadius;
  final Color color;
  final Color borderColor;
  final Color textColor;
  final EdgeInsets padding;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.function,
    this.color = KColors.kPrimary,
    this.borderColor = KColors.kWhite,
    this.textColor = KColors.kWhite,
    this.borderRadius=0.03,
    this.width = .5,
    this.fontSize=14,
    this.height = .054,

    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(kWidth(borderRadius)),

          ),
          border: Border.all(color: borderColor)
        ),
        padding: padding,
        child: Center(
          child: CustomText(
            text: text,
            textStyle: KTextStyles().buttonStyle(textColor: textColor,fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final double width;
  final double height;
  final Color color;
  final EdgeInsets padding;

  const SecondaryButton({
    Key? key,
    required this.text,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(kWidth(.03)),
          ),
        ),
        padding: padding,
        child: Center(
          child: CustomText(
            text: text,
            textStyle: KTextStyles().buttonStyle(),
          ),
        ),
      ),
    );
  }
}

class IconTextButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback function;
  final double width;
  final double height;
  final Color color;
  final double elevation;
  final EdgeInsets padding;

  const IconTextButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.elevation = 0,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(kWidth(.03)),
          ),
        ),
        padding: padding,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              widthBox(.02),
              CustomText(
                text: text,
                textStyle: KTextStyles().buttonStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback function;
  final double width;
  final double height;
  final Color color;
  final double elevation;
  final EdgeInsets padding;

  const KIconButton({
    Key? key,
    required this.icon,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.elevation = 0,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(kWidth(.03)),
          ),
        ),
        padding: padding,
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final double width;
  final double height;
  final Color color;
  final double elevation;
  final EdgeInsets padding;

  const OutlineButton({
    Key? key,
    required this.text,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.elevation = 0,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: KColors.noColor,
          border: Border.all(
            width: 1.0,
            color: color,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(kWidth(.03)),
          ),
        ),
        padding: padding,
        child: Center(
          child: CustomText(
            text: text,
            textStyle: KTextStyles().buttonStyle(),
          ),
        ),
      ),
    );
  }
}

class OutlineIconTextButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback function;
  final double width;
  final double height;
  final Color color;
  final double elevation;
  final EdgeInsets padding;

  const OutlineIconTextButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.elevation = 0,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: KColors.noColor,
          border: Border.all(
            width: 1.0,
            color: color,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(kWidth(.03)),
          ),
        ),
        padding: padding,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              widthBox(.02),
              CustomText(
                text: text,
                textStyle: KTextStyles().buttonStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OutlineIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback function;
  final double width;
  final double height;
  final Color color;
  final double elevation;
  final EdgeInsets padding;

  const OutlineIconButton({
    Key? key,
    required this.icon,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.elevation = 0,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: KColors.noColor,
          border: Border.all(
            width: 1.0,
            color: color,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(kWidth(.03)),
          ),
        ),
        padding: padding,
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}
