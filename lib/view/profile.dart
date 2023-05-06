import 'package:softec/utils/widgets/custom_app_bar.dart';

import '../utils/dynamic_sizes.dart';
import '../utils/widgets/widgets_imports.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(

        appBar: CustomAppBar(
          backgroundColor: KColors.kPrimary,
            
          title: 'Profile',
          actions: [],
        ),
        body: Padding(
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
                          CircleAvatar(
                            radius: kHeight(0.065),
                            backgroundImage: AssetImage(
                              'assets/images/carpenter.png'
                            ),
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
        ),
      ),
    );
  }
}
