

import 'package:softec/utils/widgets/custom_app_bar.dart';

import '../utils/dynamic_sizes.dart';
import '../utils/widgets/widgets_imports.dart';

class BiddingScreen extends StatelessWidget {
  const BiddingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      appBar: CustomAppBar(
        backgroundColor: KColors.kPrimary,
        actions: [],
        title: 'Bid',
      ),

      body: Padding(
        padding:EdgeInsets.all(kHeight(0.03),),
        child:Column(
          children: [

            Align(
              alignment: Alignment.topLeft,

              child: CustomText(
                alignText: TextAlign.left,
                maxLines: 2,
                text: 'Rent a car for 5 days', textStyle: KTextStyles().heading(),),
            ),

            heightBox(0.02),
            BidData(
              icon: CupertinoIcons.person,
              name: "Irtaza Ali",
              title:"Posted by"
            ), BidData(
              icon: CupertinoIcons.map,
              name: "Lahore",
              title:"Location"
            ),BidData(
              icon: Icons.details_outlined,
              name: "I ama  a hdajsk adjk",
              title:"Description"
            ),

            heightBox(0.02),

            Align(
              alignment: Alignment.center,
              child: CustomText(
                  alignText: TextAlign.left,
                  text: 'Job Budget', textStyle: KTextStyles().heading()),
            ),
            heightBox(0.01),
            Align(
              alignment: Alignment.center,
              child: CustomText(
                  alignText: TextAlign.left,
                  text: 'Rs 2000', textStyle: KTextStyles().subHeading(
                fontSize: 17,
                textColor: KColors.kGrey3
              )),


            ),
            heightBox(0.01),
            PrimaryButton(
              width: context.width,
              text: "Make offer",
              function: (){},
            )

          ],
        ),
      ),



    ),);
  }
}

class BidData extends StatelessWidget {
  const BidData({
    required this.name,
    required this.title,
    required this.icon,
    super.key,
  });
  final String name,title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kHeight(0.1),
      // color: KColors.kPrimary,
      width: context.width,
      padding: EdgeInsets.all(kHeight(0.01)),

      child: Row(
        children: [

          CircleAvatar(
            radius: kHeight(0.03),
            backgroundColor: KColors.kWhite,
            child: Icon(icon,color: KColors.kPrimary,),
            // backgroundImage: AssetImage('assets/images/carpenter.png'),
          ),
          widthBox(0.05),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  alignText: TextAlign.left,
                  text: title, textStyle: KTextStyles().normal(textColor: KColors.kGrey3,),),
              ),
              heightBox(0.005),
              CustomText(text: name, textStyle: KTextStyles().normal(textColor: KColors.kPrimary,),),

            ],
          )
        ],

      ),
    );
  }
}
