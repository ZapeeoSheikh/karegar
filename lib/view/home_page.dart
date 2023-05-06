import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:softec/models/users_model.dart';
import 'package:softec/utils/r_colors.dart';

import 'package:softec/utils/widgets/custom_app_bar.dart';
import 'package:softec/view_models/jobs_view_model.dart';
import '../models/jobs_model.dart';
import '../res/global_variables.dart';
import '../utils/colors.dart';
import '../utils/widgets/widgets_imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  

  @override
  Widget build(BuildContext context) {
    JobsViewModel jobsViewModel = JobsViewModel();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.mainColor1,
        title: Text("Jobs Bidding"),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: currentUser!.userType == 'taskProvider'
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
                : SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: jobsViewModel.jobsCollection.where('jobStatus', isEqualTo: 'active').snapshots(),
                        builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }
                      if(snapshot.data!.size == 0){
                        return Text('No jobs');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("Loading");
                      }
                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          Job job = Job.fromJson(data);
                          return jobTile(
                              name: job.name,
                              imageUrl: job.imageUrl,
                              location: job.address,
                              date: job.date,
                              totalBids: job.numberOfBids.toString(),
                              budget: job.budget,
                              title: job.title);
                        }).toList(),
                      );
                    }),
                  )),
      ),
    );
  }

  Widget jobTile(
      {required String name,
      required String imageUrl,
      required String location,
      required String date,
      required String totalBids,
      required String budget,
      required String title}) {
    return Padding(
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
                    name,
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
                    title,
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
                        // width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          location,
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
                    date,
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
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        totalBids,
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
                        budget,
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
    );
  }
}
