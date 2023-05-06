import 'package:softec/utils/r_colors.dart';

import '../../../utils/constants.dart';
import '../../../utils/dynamic_sizes.dart';
import '../../../utils/widgets/widgets_imports.dart';
import '../../../widgets/widgets_imports.dart';
import '../widgets/bottom_nav_widgets.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    pageIndex.value=0;
    return Scaffold(
      backgroundColor: MyColor.mainColor1,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Obx(() {
              print(pageIndex.value);
              return pages[pageIndex.value];
            }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: kHeight(.072),
                width: context.width,
                decoration: BoxDecoration(
                  // color: KColors.kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kWidth(.03)),
                    topRight: Radius.circular(kWidth(.03)),
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: kHeight(.07),
                    width: context.width,
                    decoration: BoxDecoration(
                      color: KColors.kWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kWidth(.03)),
                        topRight: Radius.circular(kWidth(.03)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:  [
                        GestureDetector(
                          onTap: (){
                            // pageIndex.value =0;
                            print(pageIndex.value);
                          },
                          child: BottomNavigationItem(
                            index: 0,
                            title: 'Biding',
                            icon: Icons.currency_bitcoin
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            // pageIndex.value =1;
                            print(pageIndex.value);
                          },
                          child: BottomNavigationItem(
                            index: 1,
                            title: 'My Jobs',
                              icon:  Icons.task_alt_outlined
                          ),
                        ),
                        BottomNavigationItem(
                          index: 2,
                          title: 'Post a job',
                            icon:  Icons.post_add_outlined
                        ),
                        BottomNavigationItem(
                          index: 3,
                          title: 'Messages',
                            icon:  Icons.message_outlined
                        ),
                        BottomNavigationItem(
                          index: 4,
                          title: 'Profile',
                            icon: CupertinoIcons.person
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
