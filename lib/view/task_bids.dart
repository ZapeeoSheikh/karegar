


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softec/utils/widgets/custom_app_bar.dart';

import '../utils/dynamic_sizes.dart';
import '../utils/r_colors.dart';
import '../utils/widgets/widgets_imports.dart';

class TasksBids extends StatelessWidget {
  const TasksBids({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Task Bids',
        actions: [],
        backgroundColor: KColors.kPrimary,
      ),

      body: Padding(
        padding:  EdgeInsets.all(kHeight(0.03)),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: kHeight(0.065),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                  'https://googleflutter.com/sample_image.jpg'
                                ),
                                fit: BoxFit.fill),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "hanan",
                          // "Muhammad Rameez",
                          style: TextStyle(fontSize: 14.sp, color: Colors.black54),
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
                          'Designer',
                          // "Data Engineer",
                          style: GoogleFonts.roboto(
                              fontSize: 18.sp,
                              letterSpacing: 0.6,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
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
                              'Rating : ',
                              // "23-12-2023",
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  letterSpacing: 0.6,
                                  color: MyColor.inActive),
                            ),Text(
                              '3',
                              // "23-12-2023",
                              style: GoogleFonts.roboto(
                                  fontSize: 14.sp,
                                  letterSpacing: 0.6,
                                  color: MyColor.inActive),
                            ),
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
                              "4000",
                              // " 40000",
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
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PrimaryButton(
                            width: 0.2,
                            fontSize: 12,
                            color: KColors.kYellow,
                            text: "Message", function: (){}),
                        PrimaryButton(
                            width: 0.2,

                            fontSize: 12,
                            text: "Accept", function: (){}),


                        // IconTextButton(
                        //
                        //     text: 'Accept', icon: Icons.approval_outlined, function: (){})

                        // Container(
                        //   // color: MyColor.mainColor1,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10.sp),
                        //       border: Border.all(color: MyColor.mainColor1)),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(6.0),
                        //     child: Text(
                        //       " pending ",
                        //       style: GoogleFonts.roboto(
                        //         fontSize: 14.sp,
                        //         letterSpacing: 0.6,
                        //         // fontWeight: FontWeight.bold,
                        //         color: MyColor.mainColor1,
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
