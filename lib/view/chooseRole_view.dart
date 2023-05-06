import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softec/view/login_view.dart';
import 'package:softec/view/signup_view.dart';
import '../utils/r_colors.dart';

class ChooseIdentity extends StatefulWidget {
  const ChooseIdentity({Key? key,}) : super(key: key);


  @override
  State<ChooseIdentity> createState() => _ChooseIdentityState();
}

class _ChooseIdentityState extends State<ChooseIdentity> {
  int? user ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.background,
      body: Column(
        children: [
          Spacer(),
          Text(
            "Please select your role",
            style: GoogleFonts.roboto(
                fontSize: 24.sp,
                color: MyColor.textColor1,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Choose any one",
            style: GoogleFonts.roboto(
              fontSize: 16.sp,
              color: MyColor.inActive,
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      user = 0;
                      print(user);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(userType: 0)));
                    },
                    child: Container(
                      height: 90.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: MyColor.mainColor1,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image(
                        image: AssetImage("assets/icons/customer.png",), color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Customer",
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      color: MyColor.textColor1,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Customer will be able",
                        style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          color: MyColor.inActive,
                        ),
                      ),
                      Text(
                        "post jobs",
                        style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          color: MyColor.inActive,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 40.w,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      user = 1;
                      print(user);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(userType: 1)));
                    },
                    child: Container(
                      height: 90.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColor.mainColor1, width: 2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image(
                        image: AssetImage("assets/icons/buyer.png", ), color: MyColor.mainColor1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Tradeperson",
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      color: MyColor.textColor1,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Tradeperson will be able",
                        style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          color: MyColor.inActive,
                        ),
                      ),
                      Text(
                        "accept job posted",
                        style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          color: MyColor.inActive,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Stack(
            children: [
              Positioned(
                bottom: 100,
                left: 40,
                child: Text(
                  "I need some food",
                  style: GoogleFonts.roboto(
                    fontSize: 18.sp,
                    color: MyColor.textColor1,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 50,),
                ],
              ),

            ],
          ),
          Container(
            height: 80.h,
            color: MyColor.mainColor1,
          )
        ],
      ),
    );
  }
}
