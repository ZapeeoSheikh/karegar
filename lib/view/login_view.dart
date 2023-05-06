import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:softec/data/app_exceptions.dart';
import 'package:softec/utils/error_dialogue.dart';
import 'package:softec/utils/widgets/widgets_imports.dart';
import 'package:softec/view/signup_view.dart';
import 'package:softec/view_models/auth_view_model.dart';

import '../utils/r_colors.dart';
import '../utils/routes.dart';
import 'chooseRole_view.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showPassword = false;
  bool error1 = false;
  bool error2 = false;
  final _controller = TextEditingController();
  final _controller2 = TextEditingController();

  String? get _errorText1 {
    final text = _controller.value.text;
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(text);

    if (text.isEmpty) {
      return 'Can\'t be empty';
    } else if (!emailValid) {
      return 'Incorrect format';
    } else
      return null;
  }

  String? get _errorText2 {
    final text = _controller2.value.text;

    if (text.isEmpty) {
      return 'Can\'t be empty';
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthViewModel>(context);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: GoogleFonts.roboto(fontSize: 36.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          errorText: error1 == false ? null : _errorText1,
                          prefixIcon:
                              ImageIcon(AssetImage("assets/icons/mail.png")),
                          hintText: "Enter your email",
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColor.radioButtonActive,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _controller2,
                      obscureText: showPassword ? !true : !false,
                      decoration: InputDecoration(
                          errorText: error2 == false ? null : _errorText2,
                          prefixIcon:
                              ImageIcon(AssetImage("assets/icons/lock.png")),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: showPassword != true
                                  ? Icon(CupertinoIcons.eye_slash_fill)
                                  : ImageIcon(
                                      AssetImage("assets/icons/eye.png"))),
                          hintText: "Enter your password",
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColor.radioButtonActive,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    Row(
                      children: [
                        Consumer<AuthViewModel>(
                            builder: (ctx, provider, child) {
                          if (provider.authState == AuthState.loading) {
                            return const Center(
                              child: const SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: KColors.kPrimary,
                                ),
                              ),
                            );
                          }
                          return Expanded(
                            child: InkWell(
                              onTap: () async {
                                try {
                                  await provider.login(
                                      email: _controller.text,
                                      password: _controller2.text);
                                  Navigator.pushNamed(context, Routes.bottomNav);
                                } on CustomException catch (error) {
                                  showErrorDialogue(
                                      error.prefix, error.message, context);
                                }
                              },
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: MyColor.mainColor1,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "login",
                                    style: GoogleFonts.roboto(
                                        fontSize: 16.sp, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: GoogleFonts.roboto(fontSize: 16.sp),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChooseIdentity()));
                            },
                            child: Text(
                              "Sign up",
                              style: GoogleFonts.roboto(
                                  fontSize: 16.sp, color: MyColor.mainColor1),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
