import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:softec/data/app_exceptions.dart';
import 'package:softec/res/global_variables.dart';
import 'package:softec/utils/error_dialogue.dart';
import 'package:softec/utils/snackbar.dart';
import 'package:softec/view_models/auth_view_model.dart';
import '../utils/colors.dart';
import '../utils/dynamic_sizes.dart';
import '../utils/r_colors.dart';
import '../utils/routes.dart';
import 'addPhone_view.dart';
import 'chooseRole_view.dart';
import 'login_view.dart';

class Signup extends StatefulWidget {
  const Signup({
    Key? key,
    required this.userType,
  }) : super(key: key);
  final int userType;
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool showPassword = false;
  bool error1 = false;
  bool error2 = false;
  bool error3 = false;
  bool error4 = false;
  bool error5 = false;
  bool error6 = false;

  final _controller = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();
  final _controller5 = TextEditingController();
  final _controller6 = TextEditingController();

  String? get _errorText1 {
    final text = _controller.value.text;

    if (text.isEmpty) {
      return 'Can\'t be empty';
    } else if (text.length < 3) {
      return 'Too short';
    } else if (text.length > 10) {
      return 'Too Long';
    } else
      return null;
  }

  String? get _errorText2 {
    final text = _controller2.value.text;
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(text);

    if (text.isEmpty) {
      return 'Can\'t be empty';
    } else if (!emailValid) {
      return 'Incorrect format';
    } else
      return null;
  }

  String? get _errorText3 {
    final text = _controller3.value.text;

    if (text.isEmpty) {
      return 'Can\'t be empty';
    } else if (text.length < 5) {
      return 'Too short';
    } else
      return null;
  }

  String? get _errorText4 {
    final text = _controller4.value.text;

    if (text.isEmpty) {
      return 'Can\'t be empty';
    } else if (text.length < 10) {
      return 'Too short';
    } else if (text.length > 10) {
      return 'Too Long';
    } else
      return null;
  }

  String? get _errorText5 {
    final text = _controller5.value.text;

    if (text.isEmpty) {
      return 'Can\'t be empty';
    } else if (text.length < 10) {
      return 'Too short';
    } else if (text.length > 10) {
      return 'Too Long';
    } else
      return null;
  }

  String? get _errorText6 {
    final text = _controller6.value.text;

    if (text.isEmpty) {
      return 'Can\'t be empty';
    } else if (text.length < 10) {
      return 'Too short';
    } else if (text.length > 10) {
      return 'Too Long';
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                LottieBuilder.asset(
                  "assets/images/Welcome.json",
                  repeat: true,
                  width: kWidth(0.6),
                  height: kHeight(0.17),
                ),
               
                SizedBox(
                  height: kHeight(0.07),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      prefixIcon: ImageIcon(
                        AssetImage(
                          "assets/icons/user.png",
                        ),
                        color: KColors.kPrimary,
                        size: 25,
                      ),
                      hintText: "Enter your name",
                      labelText: "Name",
                      hintStyle: TextStyle(
                          color: KColors.kPrimary
                      ), labelStyle: TextStyle(
                        color: KColors.kPrimary
                    ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kHeight(0.02)),
                        borderSide: BorderSide(
                          color: KColors.kPrimary,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kHeight(0.02)),
                          borderSide: BorderSide(
                            color: KColors.kPrimary,
                          ),
                      ),
                      errorText: error1 == false ? null : _errorText1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  controller: _controller2,
                  decoration: InputDecoration(
                      errorText: error2 == false ? null : _errorText2,
                      prefixIcon:
                          ImageIcon(AssetImage("assets/icons/mail.png"),color: KColors.kPrimary),
                      hintText: "Enter your email",
                      labelText: "Email",
                    hintStyle: TextStyle(
                        color: KColors.kPrimary
                    ), labelStyle: TextStyle(
                      color: KColors.kPrimary
                  ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kHeight(0.02)),
                      borderSide: BorderSide(
                        color: KColors.kPrimary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kHeight(0.02)),
                      borderSide: BorderSide(
                        color: KColors.kPrimary,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  controller: _controller3,
                  obscureText: showPassword ? !true : !false,
                  decoration: InputDecoration(
                      errorText: error3 == false ? null : _errorText3,
                      prefixIcon:
                          ImageIcon(AssetImage("assets/icons/lock.png"),color: KColors.kPrimary,),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: showPassword != true
                              ? Icon(CupertinoIcons.eye_slash_fill,color: KColors.kPrimary,)
                              : ImageIcon(AssetImage("assets/icons/eye.png"),color: KColors.kPrimary,)),
                      hintText: "Enter your password",
                      labelText: "Password",
                    hintStyle: TextStyle(
                        color: KColors.kPrimary
                    ), labelStyle: TextStyle(
                      color: KColors.kPrimary
                  ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kHeight(0.02)),
                      borderSide: BorderSide(
                        color: KColors.kPrimary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kHeight(0.02)),
                      borderSide: BorderSide(
                        color: KColors.kPrimary,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Consumer<AuthViewModel>(builder: (ctx, provider, child) {
                  if (provider.authState == AuthState.loading) {
                    return Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: KColors.kPrimary,
                        ),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () async {
                      if (widget.userType == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddPhone(
                              name: _controller.text,
                              email: _controller2.text,
                              password: _controller3.text,
                            ),
                          ),
                        );
                        return;
                      }
                      try {
                        await provider.signUp(
                            email: _controller2.text,
                            password: _controller3.text,
                            userName: _controller.text,
                            userType: widget.userType == 0
                                ? UserType.customer
                                : UserType.tradePerson);
                        
                        Navigator.pushReplacementNamed(context, Routes.bottomNav);
                        showSnackBar(context: context, message: 'Verification email sent to your account.');
                      } on CustomException catch (error) {
                        showErrorDialogue(error.prefix, error.message, context);
                      }
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: MyColor.mainColor1,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: widget.userType == 0
                                    ? Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp),
                                      )
                                    : Text(
                                        "Next",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp),
                                      )),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
