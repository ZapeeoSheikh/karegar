import 'package:dropdown_button2/dropdown_button2.dart';
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

  List<String> items = [
    "Carpenter", "Driver", "Electrician", "Painter", "Plumber", "Web Developer","Mechanices","Ironing","Delivery","Cleaning","Cooking","Planner","Gardener","Photographer","Tailor",
  ];
  String? selectedValue;

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
              ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.width/3,),
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
                  ),
              )
              : Column(
                  children: [
                    Row(
                      children: [
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Row(
                              children: [
                                ImageIcon(
                                  AssetImage(
                                    "assets/icons/filter.png",
                                  ),
                                  color: MyColor.textColor1,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    ' Select Item',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as String;
                              });
                            },
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: 160,
                              padding: const EdgeInsets.only(left: 14, right: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: MyColor.mainColor2,
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: MyColor.mainColor1,
                              iconDisabledColor: Colors.grey,
                            ),
                            dropdownStyleData: DropdownStyleData(
                              maxHeight: 200,
                              width: 200,
                              padding: null,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: MyColor.mainColor2,
                              ),
                              elevation: 8,
                              offset: const Offset(-20, 0),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility: MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 10.h,),
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
