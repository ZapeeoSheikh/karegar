import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softec/utils/r_colors.dart';

import 'package:softec/utils/widgets/custom_app_bar.dart';
import '../utils/colors.dart';
import '../utils/widgets/widgets_imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int userType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.mainColor1,
        title: Text("Jobs Bidding"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: userType == 1
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage("assets/Vector/unavailable.png")),
                    Text(
                      "You can not see the job posting",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Join as a trade person",
                      style: TextStyle(
                        color: MyColor.mainColor1,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    for(int i = 0; i <= 20; i++)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 7,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://googleflutter.com/sample_image.jpg'),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Muhammad Rameez",
                                    style: TextStyle(
                                        fontSize: 14.sp, color: Colors.black54),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Data Engineer",
                                    style: GoogleFonts.roboto(
                                        fontSize: 18.sp,
                                        letterSpacing: 0.6,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: MyColor.inActive,
                                        size: 14.sp,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Container(
                                        width:
                                        MediaQuery.of(context).size.width / 2,
                                        child: Text(
                                          "Data Engineer sdna snds dofa osdifnd sofndso ifnd snds dofa osdifnd sofndso ifndsof",
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.roboto(
                                              fontSize: 13.sp,
                                              letterSpacing: 0.6,
                                              color: MyColor.inActive),
                                        ),
                                      )
                                    ],
                                  ),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "23-12-2023",
                                    style: GoogleFonts.roboto(
                                        fontSize: 14.sp,
                                        letterSpacing: 0.6,
                                        color: MyColor.inActive),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: MyColor.mainColor1,
                                      ),
                                      onPressed: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text(
                                              "Bid",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "No of Bids: ",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            letterSpacing: 0.6,
                                            color: MyColor.mainColor1,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        "23",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.roboto(
                                            fontSize: 14.sp,
                                            letterSpacing: 0.6,
                                            color: MyColor.mainColor1,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Budget Rs",
                                        style: GoogleFonts.roboto(
                                          fontSize: 12.sp,
                                          letterSpacing: 0.6,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        " 40000",
                                        style: GoogleFonts.roboto(
                                          fontSize: 16.sp,
                                          letterSpacing: 0.6,
                                          fontWeight: FontWeight.bold,
                                          color: MyColor.mainColor1,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
