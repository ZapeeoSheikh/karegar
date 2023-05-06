import 'package:softec/utils/dynamic_sizes.dart';
import 'package:softec/utils/widgets/custom_app_bar.dart';
import 'package:softec/view/post_tasks/post_task_controller.dart';
import 'package:softec/view/post_tasks/post_task_detail.dart';

import '../../utils/widgets/widgets_imports.dart';

class PostTasksScreen extends StatelessWidget {
  const PostTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostTaskController>(
        init: PostTaskController(),
        builder: (postTaskController) {
          return SafeArea(
            child: Scaffold(
              appBar: CustomAppBar(
                title: "UserName! Which services do you want?",
                fontSize: 14,
                backgroundColor: KColors.kPrimary,
                centerTitle: false,
                actions: [],
              ),
              body: Padding(
                padding: EdgeInsets.all(
                  kHeight(0.03),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomText(
                        // alignText: TextAlign.left,
                        text: 'Post a Job',
                        textStyle: KTextStyles().subHeading(
                          textColor: KColors.kPrimary,
                        ),
                      ),
                      heightBox(0.03),
                      SizedBox(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: kWidth(.5),
                            childAspectRatio: .99,
                            crossAxisSpacing: kWidth(.04),
                            mainAxisSpacing: kWidth(.04),
                          ),
                          itemCount: postTaskController.categories.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return GestureDetector(
                              onTap: () {
                                print(postTaskController.categories[index]['name']);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PostTaskDetailScreen(
                                        title:postTaskController.categories[index]['name'].toString()),
                                  ),
                                );
                                // Navigator.pushNamed(context, Routes.postTaskDetail,
                                //     arguments: ;
                                // if (Get.currentRoute == "/productDetailScreen") {
                                //   Get.offAndToNamed(
                                //     // "/productDetailScreen",
                                //     // arguments: data.id,
                                //   );
                                // } else {
                                //   Get.toNamed(
                                //     // "/productDetailScreen",
                                //     // arguments: data.id,
                                //   );
                                // }
                              },
                              child: Container(
                                // height: kHeight(.),
                                alignment: Alignment.center,

                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 15.0, // soften the shadow
                                      spreadRadius: 2.0, //extend the shadow
                                      // offset: Offset(
                                      //   5.0, // Move to right 5  horizontally
                                      //   5.0, // Move to bottom 5 Vertically
                                      // ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(kWidth(.03)),
                                  // border: Border.all(
                                  //   width: .3,
                                  //   // color: KColors.kGrey3,
                                  // ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: kHeight(0.1),
                                      child: Image.asset(postTaskController.categories[index]['images'].toString()),
                                    ),
                                    //     CircleAvatar(
                                    //       radius: kHeight(0.06),
                                    //          backgroundImage:
                                    //              AssetImage(
                                    // postTaskController.categories[index]['images'].toString())
                                    //              ),
                                    // Image.asset(postTaskController.categories[index]['image'].toString())),
                                    heightBox(.012),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: kWidth(.02),
                                      ),
                                      child: SizedBox(
                                        width: context.width,
                                        child: CustomText(
                                          text: postTaskController.categories[index]['name'].toString(),
                                          alignText: TextAlign.center,
                                          maxLines: 2,
                                          textStyle: KTextStyles().heading(
                                            // fontSize: 13,
                                            textColor: KColors.kPrimary,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Divider(
                                    //   thickness: 2,
                                    // )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
