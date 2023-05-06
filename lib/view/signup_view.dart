import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/r_colors.dart';
import 'chooseRole_view.dart';
import 'login_view.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: (){
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
                    SizedBox(height: 80.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "Sign up",
                            style: GoogleFonts.roboto(fontSize: 36.sp),
                          ),
                        ],
                    ),
                    SizedBox(height: 80.h,),
                    Theme(
                      data: Theme.of(context).copyWith(primaryColor: Color(0xFF010101),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: ImageIcon(AssetImage("assets/icons/user.png",),size: 25,),
                          hintText: "Enter your name",
                          labelText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColor.radioButtonActive,),
                            borderRadius: BorderRadius.circular(10),

                          )
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: ImageIcon(AssetImage("assets/icons/mail.png")),
                        hintText: "Enter your email",
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: MyColor.radioButtonActive,),
                            borderRadius: BorderRadius.circular(10),

                          )
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: ImageIcon(AssetImage("assets/icons/lock.png")),
                          suffixIcon:
                          ImageIcon(AssetImage("assets/icons/eye.png")),

                        hintText: "Enter your password",
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: MyColor.radioButtonActive,),
                              borderRadius: BorderRadius.circular(10),

                      )
                      ),
                    ),
                    SizedBox(height: 50.h,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseIdentity()));
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
                              child: Center(child: Text("Sign Up", style: TextStyle(color: Colors.white),)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.roboto(fontSize: 16.sp),
                        ),
                        SizedBox(width: 10.w,),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                            },
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.roboto(fontSize: 16.sp, color: MyColor.mainColor1),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            )
        ),
      )



      // SafeArea(
      //   child: Column(
      //     children: [
      //       Center(
      //         child: Text(
      //           "Login",
      //           style: GoogleFonts.roboto(fontSize: 36.sp),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
