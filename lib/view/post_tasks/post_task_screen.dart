

import 'package:softec/utils/dynamic_sizes.dart';
import 'package:softec/utils/widgets/custom_app_bar.dart';

import '../../utils/widgets/widgets_imports.dart';

class PostTasksScreen extends StatelessWidget {
  const PostTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.all(kHeight(0.03),),
            child: SingleChildScrollView(
              child: Column(

              ),
            ),
          ),
    ),);
  }
}
