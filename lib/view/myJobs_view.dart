import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softec/view/task_bids.dart';
import 'package:softec/view_models/jobs_view_model.dart';

import '../models/jobs_model.dart';
import '../res/global_variables.dart';
import '../utils/colors.dart';
import '../utils/r_colors.dart';

class MyJobs extends StatefulWidget {
  const MyJobs({Key? key}) : super(key: key);

  @override
  State<MyJobs> createState() => _MyJobsState();
}

class _MyJobsState extends State<MyJobs> {
  JobsViewModel jobsViewModel = JobsViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.mainColor1,
        title: Text(
          "My Jobs",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height* 0.8,
              width: double.infinity,
              child: StreamBuilder<QuerySnapshot<Object?>>(
                  stream: jobsViewModel.jobsCollection
                      .where('postedBy', isEqualTo: currentUser!.userId)
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: CircularProgressIndicator(
                              color: KColors.kPrimary,
                            ),
                          ),
                        ],
                      );
                    }
                    return ListView(
                      children:
                          snapshot.data!.docs.map<Widget>((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        Job job = Job.fromJson(data);
                        return GestureDetector(
                          onTap: (){

                            Navigator.push(context, MaterialPageRoute(builder: (context) => TasksBids(),));

                          },
                          child: JobTile(
                            image: 'https://googleflutter.com/sample_image.jpg',
                            name: job.name,
                            positionTitle: job.title,
                            date: job.date,
                            budget: job.budget,
                            status: job.jobStatus,
                            no_of_bids: job.numberOfBids.toString(),
                          ),
                        );
                      }).toList(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class JobTile extends StatelessWidget {
  const JobTile({
    super.key,
    required this.image,
    required this.name,
    required this.positionTitle,
    required this.date,
    required this.budget,
    required this.status,
    required this.no_of_bids,
  });
  final String image;
  final String name;
  final String positionTitle;
  final String date;
  final String budget;
  final String status;
  final String no_of_bids;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Card(
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
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(image
                              // 'https://googleflutter.com/sample_image.jpg'
                              ),
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    name,
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
                    positionTitle,
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
                  Text(
                    date,
                    // "23-12-2023",
                    style: GoogleFonts.roboto(
                        fontSize: 14.sp,
                        letterSpacing: 0.6,
                        color: MyColor.inActive),
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
                        no_of_bids,
                        // "23",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          letterSpacing: 0.6,
                          color: MyColor.mainColor1,
                        ),
                      )
                    ],
                  ),
                  Container(
                    // color: MyColor.mainColor1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        border: Border.all(color: MyColor.mainColor1)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        " pending ",
                        style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          letterSpacing: 0.6,
                          // fontWeight: FontWeight.bold,
                          color: MyColor.mainColor1,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
