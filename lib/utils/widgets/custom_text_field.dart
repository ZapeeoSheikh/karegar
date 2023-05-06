import '../constants.dart';
import '../dynamic_sizes.dart';
import '../widgets/widgets_imports.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool enable;
  final bool onlyText;
  final bool onlyTextNumber;
  final bool onlyNumberDot;
  final bool onlyNumber;
  final bool onlyNumberDash;
  final Widget suffixIcon;
  final bool hasSuffix;
  final Color suffixIconColor;
  final double suffixIconSize;
  final bool hasPrefix;
  final VoidCallback? suffixIconFunction;
  final Widget prefixIcon;
  final Color themeColor;
  final VoidCallback? prefixIconFunction;
  final String? Function(String?)? function;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.keyboardType,
    this.isPassword = false,
    this.enable = true,
    required this.suffixIcon,
    required this.prefixIcon,
    this.suffixIconFunction,
    this.prefixIconFunction,
    this.function,
    this.hasSuffix = true,
    this.hasPrefix = true,
    this.themeColor = KColors.kWhite,
    this.suffixIconColor = KColors.kBlack,
    this.suffixIconSize = .06,
    this.onlyText = false,
    this.onlyTextNumber = false,
    this.onlyNumberDot = false,
    this.onlyNumber = false,
    this.onlyNumberDash = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        enabled: enable,
        controller: controller,
        textInputAction: TextInputAction.next,
        cursorColor: themeColor,
        cursorWidth: 2.0,
        cursorHeight: kHeight(.024),
        obscureText: isPassword ? obscureText.value : defaultObscureText.value,
        keyboardType: keyboardType,
        inputFormatters: [
          keyboardType == TextInputType.phone
              ? FilteringTextInputFormatter.allow(
                  RegExp("[0-9]"),
                )
              : onlyText
                  ? FilteringTextInputFormatter.allow(
                      RegExp("[a-zA-Z ]"),
                    )
                  : onlyTextNumber
                      ? FilteringTextInputFormatter.allow(
                          RegExp("[a-zA-Z 0-9]"),
                        )
                      : onlyNumberDot
                          ? FilteringTextInputFormatter.allow(
                              RegExp("[0-9 \\.]"),
                            )
                          : onlyNumberDash
                              ? FilteringTextInputFormatter.allow(
                                  RegExp("[0-9 \\-]"),
                                )
                              : onlyNumber
                                  ? FilteringTextInputFormatter.allow(
                                      RegExp("[0-9]"),
                                    )
                                  : FilteringTextInputFormatter.allow(
                                      RegExp("[a-zA-Z , @/:? 0-9 \\- _ .]"),
                                    ),
          keyboardType == TextInputType.phone
              ? FilteringTextInputFormatter.deny(
                  RegExp('[\\.|\\,\\-\\_]'),
                )
              : FilteringTextInputFormatter.deny(
                  RegExp('[\\#]'),
                ),
        ],
        style: TextStyle(
          color: themeColor,
          fontSize: kWidth(.04),
        ),
        validator: function,
        decoration: InputDecoration(
          suffixIcon: hasSuffix
              ? InkWell(
                  onTap: isPassword
                      ? () {
                          obscureText.value = !obscureText.value;
                        }
                      : suffixIconFunction,
                  child: isPassword
                      ? obscureText.value
                          ? Icon(
                              CupertinoIcons.eye,
                              color: suffixIconColor,
                              size: kWidth(suffixIconSize),
                            )
                          : Icon(
                              CupertinoIcons.eye_slash,
                              color: suffixIconColor,
                              size: kWidth(suffixIconSize),
                            )
                      : suffixIcon,
                )
              : null,
          isDense: true,
          prefixIcon: hasPrefix
              ? InkWell(
                  onTap: prefixIconFunction,
                  child: prefixIcon,
                )
              : null,
          label: Text(label),
          labelStyle: TextStyle(color: themeColor),
          hintText: hintText,
          hintStyle: TextStyle(color: themeColor.withOpacity(.4)),
          disabledBorder: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kWidth(.04)),
            borderSide: BorderSide(
              width: 2,
              color: themeColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kWidth(.04)),
            borderSide: BorderSide(
              width: 2,
              color: themeColor,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kWidth(.04)),
            borderSide: BorderSide(
              width: 2,
              color: themeColor,
            ),
          ),
        ),
      );
    });
  }
}
