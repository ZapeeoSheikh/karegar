import 'package:softec/res/global_variables.dart';
import 'package:softec/utils/widgets/custom_app_bar.dart';
import 'package:softec/view/profileController.dart';

import '../utils/dynamic_sizes.dart';
import '../utils/widgets/widgets_imports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (profileController) {
        return SafeArea(

          child: Scaffold(

            appBar: CustomAppBar(
              backgroundColor: KColors.kPrimary,

              title: 'Profile',
              actions: [],
            ),
            body:currentUserType==UserType.tradePerson? Padding(
              padding: EdgeInsets.all(kHeight(0.03),),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: kHeight(0.45),

                      decoration: BoxDecoration(
                        // color: KColors.kSecondary,
                        borderRadius: BorderRadius.circular(
                          kHeight(0.03),
                        ),
                        border: Border.all(color: KColors.kPrimary),
                        color: KColors.kPrimary,
                      ),
                      child: Column(children: [
                        Container(
                          height: kHeight(0.38),
                          width: context.width,
padding: EdgeInsets.all(kHeight(0.01),),
                          decoration: BoxDecoration(
                            color: KColors.kWhite,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(kHeight(0.03)),
                              topLeft: Radius.circular(kHeight(0.03)),
                            ),
                          ),
                          child: Column(
                            children: [
                              heightBox(0.03),
                              Obx(
                                 () {
                                  return GestureDetector(
                                    onTap: () async {
                                      profileController.pickFromCamera();
                                      profileController.update();
                                    },
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          width: kWidth(context.isTablet ? .22 : .33),
                                          height: kHeight(context.isTablet ? .16 : .15),
                                          child: Center(
                                            child: Container(
                                              width: kWidth(context.isTablet ? .2 : .36),
                                              height: kHeight(context.isTablet ? .14 : .18),
                                              decoration: BoxDecoration(
                                                color: KColors.kPrimary,
                                                border: Border.all(
                                                  color: KColors.kSecondary,
                                                  width: 1.0,
                                                ),
                                                borderRadius: BorderRadius.circular(kWidth(.03)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: KColors.kWhite.withOpacity(.2),
                                                    blurRadius: 8,
                                                    offset: const Offset(1, 2),
                                                  ),
                                                ],
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(kWidth(.03)),
                                                child: Image.network(
                                                  profileController.imageEdit.value.toString(),
                                                  errorBuilder: (BuildContext context, Object exception,
                                                      StackTrace? stackTrace) {
                                                    return profileController.image.value != null
                                                        ? Image.memory(
                                                      profileController.image.value!
                                                          .readAsBytesSync(),
                                                      fit: BoxFit.cover,
                                                    )
                                                        : Icon(
                                                      CupertinoIcons.profile_circled,
                                                      size: kWidth(context.isTablet ? .14 : .24),
                                                      color: KColors.kSecondary,
                                                    );
                                                  },
                                                  loadingBuilder: (BuildContext context, Widget child,
                                                      ImageChunkEvent? loadingProgress) {
                                                    if (loadingProgress == null) {
                                                      return child;
                                                    }
                                                    return Center(
                                                      child: CircularProgressIndicator(
                                                        color: KColors.kSecondary,
                                                        value: loadingProgress.expectedTotalBytes != null
                                                            ? loadingProgress.cumulativeBytesLoaded /
                                                            loadingProgress.expectedTotalBytes!
                                                            : null,
                                                      ),
                                                    );
                                                  },
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        if (profileController.imageEdit.value != null ||
                                            profileController.imageEdit.value != "" &&
                                                profileController.image.value != null)
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: GestureDetector(
                                              onTap: () {
                                                profileController.imageEdit.value = null;
                                                profileController.image.value = null;
                                                profileController.update();
                                              },
                                              child: CircleAvatar(
                                                backgroundColor: KColors.kWhite,
                                                radius: kWidth(context.isTablet ? .02 : .034),
                                                child: Icon(
                                                  Icons.close_rounded,
                                                  color: KColors.kRed,
                                                  size: kWidth(context.isTablet ? .03 : .06),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                }
                              ),
                              heightBox(0.01),
                              Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: currentUser!.userName.toString(),
                                  textStyle: KTextStyles().heading(
                                    textColor: KColors.kPrimary,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  alignText: TextAlign.left,
                                  text: currentUser!.userType,
                                  textStyle: KTextStyles().normal(
                                    textColor: KColors.kPrimary,
                                    fontSize: 14
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  alignText: TextAlign.left,
                                  text: currentUser!.contactNumber,
                                  textStyle: KTextStyles().normal(
                                    textColor: KColors.kPrimary,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              heightBox(0.03),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: kHeight(0.05),
                                  width: kWidth(0.6),
                                  decoration: BoxDecoration(
                                    color: KColors.kPrimary,
                                    borderRadius: BorderRadius.circular(
                                      kHeight(0.01),
                                    ),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: currentUser!.userEmail,
                                      textStyle: KTextStyles().subHeading(
                                        textColor: KColors.kWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: kHeight(0.055),
                          width: kWidth(0.85),
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            color: KColors.kWhite,

                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                kHeight(0.03),
                              ),
                              bottomRight: Radius.circular(
                                kHeight(0.03),
                              ),
                            ),
                          ),
                        ),


                      ]),
                    ),

                    heightBox(0.02),
                    RowText(title: "CNIC",value: currentUser!.cnicNumber),
                    heightBox(0.01),
                    RowText(title: "Location",value: currentUser!.location),
                    heightBox(0.1),
                    PrimaryButton(
                      // borderColor: ,
borderRadius: 0.03,
                        // width: con,
                        text: 'Log out', function: (){})
                  ],
                ),
              ),
            ):

            Padding(
              padding: EdgeInsets.all(kHeight(0.03),),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: kHeight(0.45),

                      decoration: BoxDecoration(
                        // color: KColors.kSecondary,
                        borderRadius: BorderRadius.circular(
                          kHeight(0.03),
                        ),
                        border: Border.all(color: KColors.kPrimary),
                        color: KColors.kPrimary,
                      ),
                      child: Column(children: [
                        Container(
                          height: kHeight(0.38),
                          width: context.width,
                          padding: EdgeInsets.all(kHeight(0.01),),
                          decoration: BoxDecoration(
                            color: KColors.kWhite,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(kHeight(0.03)),
                              topLeft: Radius.circular(kHeight(0.03)),
                            ),
                          ),
                          child: Column(
                            children: [
                              heightBox(0.03),
                              Obx(
                                      () {
                                    return GestureDetector(
                                      onTap: () async {
                                        profileController.pickFromCamera();
                                        profileController.update();
                                      },
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            width: kWidth(context.isTablet ? .22 : .33),
                                            height: kHeight(context.isTablet ? .16 : .15),
                                            child: Center(
                                              child: Container(
                                                width: kWidth(context.isTablet ? .2 : .36),
                                                height: kHeight(context.isTablet ? .14 : .18),
                                                decoration: BoxDecoration(
                                                  color: KColors.kPrimary,
                                                  border: Border.all(
                                                    color: KColors.kSecondary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius: BorderRadius.circular(kWidth(.03)),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: KColors.kWhite.withOpacity(.2),
                                                      blurRadius: 8,
                                                      offset: const Offset(1, 2),
                                                    ),
                                                  ],
                                                ),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(kWidth(.03)),
                                                  child: Image.network(
                                                    profileController.imageEdit.value.toString(),
                                                    errorBuilder: (BuildContext context, Object exception,
                                                        StackTrace? stackTrace) {
                                                      return profileController.image.value != null
                                                          ? Image.memory(
                                                        profileController.image.value!
                                                            .readAsBytesSync(),
                                                        fit: BoxFit.cover,
                                                      )
                                                          : Icon(
                                                        CupertinoIcons.profile_circled,
                                                        size: kWidth(context.isTablet ? .14 : .24),
                                                        color: KColors.kSecondary,
                                                      );
                                                    },
                                                    loadingBuilder: (BuildContext context, Widget child,
                                                        ImageChunkEvent? loadingProgress) {
                                                      if (loadingProgress == null) {
                                                        return child;
                                                      }
                                                      return Center(
                                                        child: CircularProgressIndicator(
                                                          color: KColors.kSecondary,
                                                          value: loadingProgress.expectedTotalBytes != null
                                                              ? loadingProgress.cumulativeBytesLoaded /
                                                              loadingProgress.expectedTotalBytes!
                                                              : null,
                                                        ),
                                                      );
                                                    },
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (profileController.imageEdit.value != null ||
                                              profileController.imageEdit.value != "" &&
                                                  profileController.image.value != null)
                                            Positioned(
                                              right: 0,
                                              top: 0,
                                              child: GestureDetector(
                                                onTap: () {
                                                  profileController.imageEdit.value = null;
                                                  profileController.image.value = null;
                                                  profileController.update();
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor: KColors.kWhite,
                                                  radius: kWidth(context.isTablet ? .02 : .034),
                                                  child: Icon(
                                                    Icons.close_rounded,
                                                    color: KColors.kRed,
                                                    size: kWidth(context.isTablet ? .03 : .06),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    );
                                  }
                              ),
                              heightBox(0.01),
                              Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  text: "Hanan",
                                  textStyle: KTextStyles().heading(
                                    textColor: KColors.kPrimary,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  alignText: TextAlign.left,
                                  text: "Customer",
                                  textStyle: KTextStyles().normal(
                                      textColor: KColors.kPrimary,
                                      fontSize: 14
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: CustomText(
                                  alignText: TextAlign.left,
                                  text: "03019329293",
                                  textStyle: KTextStyles().normal(
                                    textColor: KColors.kPrimary,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              heightBox(0.03),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: kHeight(0.05),
                                  width: kWidth(0.6),
                                  decoration: BoxDecoration(
                                    color: KColors.kPrimary,
                                    borderRadius: BorderRadius.circular(
                                      kHeight(0.01),
                                    ),
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: "hanan@gmail.com",
                                      textStyle: KTextStyles().subHeading(
                                        textColor: KColors.kWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: kHeight(0.055),
                          width: kWidth(0.85),
                          decoration: BoxDecoration(
                            // shape: BoxShape.circle,
                            color: KColors.kWhite,

                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                kHeight(0.03),
                              ),
                              bottomRight: Radius.circular(
                                kHeight(0.03),
                              ),
                            ),
                          ),
                        ),


                      ]),
                    ),

                    heightBox(0.1),
                    PrimaryButton(
                      // borderColor: ,
                        borderRadius: 0.03,
                        // width: con,
                        text: 'Log out', function: (){})
                  ],
                ),
              ),
            )
          ),
        );
      }
    );
  }
}

class RowText extends StatelessWidget {
  const RowText({
    required this.title,
    required this.value,
    super.key,
  });

  final String title,value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children:[

            CustomText(
              text: '$title :',
              textStyle: KTextStyles().subHeading(
                textColor: KColors.kBlack
              ),
            ),
            widthBox(0.05),
            CustomText(
              text: value,
              textStyle: KTextStyles().subHeading(
                textColor: KColors.kGrey3,
              ),
            ),


          ]
        ),
        Divider(
          color: KColors.kGrey3,
        )
      ],
    );
  }
}
