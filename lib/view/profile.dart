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
                  height: kHeight(0.40),
                  decoration: BoxDecoration(
                    // color: KColors.kSecondary,
                    borderRadius: BorderRadius.circular(
                      kHeight(0.03),
                    ),
                    color: KColors.kWhite,
                  ),
                  child: Column(children: [
                    Container(
                      height: kHeight(0.34),
                      width: context.width,
                      decoration: BoxDecoration(
                        color: KColors.kPrimary,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(kHeight(0.03)),
                          topLeft: Radius.circular(kHeight(0.03)),
                        ),
                      ),
                      child: Column(
                        children: [
                          heightBox(0.03),
                          CircleAvatar(
                            radius: kHeight(0.05),
                            backgroundImage: AssetImage(
                              'assets/images/carpenters.png'
                            ),
                          ),
                          heightBox(0.01),
                          CustomText(
                            text: "Hanan",
                            textStyle: KTextStyles().subHeading(
                              textColor: KColors.kPrimary,
                            ),
                          ),
                          CustomText(
                            text: "Customer",
                            textStyle: KTextStyles().subHeading(
                              textColor: KColors.kPrimary,
                            ),
                          ),
                          heightBox(0.06),
                          Container(
                            height: kHeight(0.05),
                            width: kWidth(0.6),
                            decoration: BoxDecoration(
                              color: KColors.kPrimary,
                              borderRadius: BorderRadius.circular(
                                kHeight(0.03),
                              ),
                            ),
                            child: Center(
                              child: CustomText(
                                text: "hanan@gmail.com",
                                textStyle: KTextStyles().subHeading(
                                  textColor: KColors.kPrimary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: kHeight(0.05),
                      width: kWidth(0.85),
                      decoration: BoxDecoration(
                        // shape: BoxShape.circle,
                        color: KColors.kBlack,

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
