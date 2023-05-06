import 'package:softec/utils/widgets/widgets_imports.dart';

import '../../../utils/constants.dart';
import '../../../utils/dynamic_sizes.dart';
import '../../../widgets/widgets_imports.dart';

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    Key? key,
    required this.index,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final int index;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () {
          pageIndex.value = index;
        },
        child: SizedBox(
          width: kWidth(.18),
          height: kHeight(.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(icon,color: pageIndex.value == index ? KColors.kPrimary : KColors.kBlack,),
              // Image.asset(,
              //   icon,
              //   fit: BoxFit.cover,
              //   height: kHeight(.034),
              //   color: pageIndex.value == index ? KColors.kPrimary : KColors.kBlack,
              // ),
              CustomText(
                text: title,
                textStyle: KTextStyles().subHeading(
                  fontSize: 12,
                  textColor: pageIndex.value == index ? KColors.kPrimary : KColors.kBlack,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
