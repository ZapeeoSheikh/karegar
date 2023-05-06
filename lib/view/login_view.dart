import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softec/view/signup_view.dart';

import '../utils/r_colors.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image(
                      //   image: AssetImage("images/cloud.png"),
                      //   width: 300,
                      //   height: 300,
                      // ),
                      SizedBox(
                        height: 80.h,
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
                        decoration: InputDecoration(
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
                        decoration: InputDecoration(
                            prefixIcon:
                                ImageIcon(AssetImage("assets/icons/lock.png")),
                            suffixIcon:
                                ImageIcon(AssetImage("assets/icons/eye.png")),

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Text(
                              "Forget Password ?",
                              style: GoogleFonts.roboto(
                                  fontSize: 12.sp, color: MyColor.textColor1),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
                        },
                        child: Row(
                          children: [
                            Expanded(
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
                          ],
                        ),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
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
              )),
        )


        );
  }
}
