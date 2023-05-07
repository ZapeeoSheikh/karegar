import 'package:provider/provider.dart';
import 'package:softec/data/app_exceptions.dart';
import 'package:softec/utils/error_dialogue.dart';
import 'package:softec/utils/snackbar.dart';
import 'package:softec/utils/widgets/custom_app_bar.dart';
import 'package:softec/view_models/make_offer_view_model.dart';

import '../res/global_variables.dart';
import '../utils/dynamic_sizes.dart';
import '../utils/widgets/widgets_imports.dart';

class BiddingScreen extends StatelessWidget {
  const BiddingScreen(
      {Key? key,
      required this.title,
      required this.name,
      required this.location,
      required this.description,
      required this.taskId,
      required this.budget})
      : super(key: key);
  final String title;
  final String name;
  final String location;
  final String description;
  final String taskId;
  final String budget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: KColors.kPrimary,
          actions: [],
          title: 'Bid',
        ),
        body: Padding(
          padding: EdgeInsets.all(
            kHeight(0.03),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  alignText: TextAlign.left,
                  maxLines: 2,
                  text: title,
                  textStyle: KTextStyles().heading(),
                ),
              ),
              heightBox(0.02),
              BidData(
                  icon: CupertinoIcons.person, name: name, title: "Posted by"),
              BidData(
                  icon: CupertinoIcons.map, name: "Lahore", title: "Location"),
              BidData(
                  icon: Icons.details_outlined,
                  name: description,
                  title: "Description"),
              heightBox(0.02),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                    alignText: TextAlign.left,
                    text: 'Job Budget',
                    textStyle: KTextStyles().heading()),
              ),
              heightBox(0.01),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                    alignText: TextAlign.left,
                    text: budget,
                    textStyle: KTextStyles()
                        .subHeading(fontSize: 17, textColor: KColors.kGrey3)),
              ),
              heightBox(0.01),
              Consumer<MakeOfferViewModel>(builder: (ctx, provider, child) {
                if (provider.state == MakeOfferState.loading) {
                  return const Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        color: KColors.kPrimary,
                      ),
                    ),
                  );
                }
                return PrimaryButton(
                  width: context.width,
                  text: "Make offer",
                  function: () async {
                    try {
                      await provider.makeOffer(
                          jobId: taskId,
                          bidderName: name,
                          bidBy: currentUser!.userId,
                          amount: budget,
                          bidderRating: currentUser!.ratting);
                      showSnackBar(
                          context: context,
                          message: 'Bid was sended to the user');
                      Navigator.of(context).pop();
                    } on CustomException catch (error) {
                      showErrorDialogue(error.prefix, error.message, context);
                    }
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class BidData extends StatelessWidget {
  const BidData({
    required this.name,
    required this.title,
    required this.icon,
    super.key,
  });
  final String name, title;
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
            child: Icon(
              icon,
              color: KColors.kPrimary,
            ),
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
                  text: title,
                  textStyle: KTextStyles().normal(
                    textColor: KColors.kGrey3,
                  ),
                ),
              ),
              heightBox(0.005),
              CustomText(
                text: name,
                textStyle: KTextStyles().normal(
                  textColor: KColors.kPrimary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
