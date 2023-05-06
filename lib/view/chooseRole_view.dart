import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/r_colors.dart';

class ChooseIdentity extends StatefulWidget {
  const ChooseIdentity({Key? key}) : super(key: key);

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
            "Want to share food?",
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
                    },
                    child: Container(
                      height: 90.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: MyColor.mainColor1,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image(
                        image: AssetImage("assets/icons/donor.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Donnor",
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
                        "Donate your food",
                        style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          color: MyColor.inActive,
                        ),
                      ),
                      Text(
                        "for needy",
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
                      Navigator.pushReplacementNamed(context, "/bottomNav");
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavBar()));
                    },
                    child: Container(
                      height: 90.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColor.mainColor1, width: 2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image(
                        image: AssetImage("assets/icons/approve.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Accepter",
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
                        "Accept the food",
                        style: GoogleFonts.roboto(
                          fontSize: 12.sp,
                          color: MyColor.inActive,
                        ),
                      ),
                      Text(
                        "and pickup",
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
                  Image(image: AssetImage("assets/Vector/hungery_girl.png"), width: 300,),
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
