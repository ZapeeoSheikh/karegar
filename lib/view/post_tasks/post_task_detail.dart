import 'dart:io';

import 'package:datetime_setting/datetime_setting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:softec/utils/dynamic_sizes.dart';
import 'package:softec/utils/widgets/custom_app_bar.dart';
import 'package:softec/view/post_tasks/post_task_detail_controller.dart';

import '../../data/app_exceptions.dart';
import '../../res/global_variables.dart';
import '../../utils/error_dialogue.dart';
import '../../utils/snackbar.dart';
import '../../utils/widgets/widgets_imports.dart';
import '../../view_models/post_job_view_model.dart';

class PostTaskDetailScreen extends StatefulWidget {
  const PostTaskDetailScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PostTaskDetailScreen> createState() => _PostTaskDetailScreenState();
}

class _PostTaskDetailScreenState extends State<PostTaskDetailScreen> {
  File? galleryFile;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostTaskDetailController>(
        init: PostTaskDetailController(),
        builder: (postTaskDetailController) {
          // print(title);
          return GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Scaffold(
              appBar: AppBar(
                leading: const BackButton(
                  color: Colors.white, // <-- SEE HERE
                ),
                title: Text(widget.title),
                backgroundColor: KColors.kPrimary,
              ),
              body: SafeArea(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: postTaskDetailController.pageController,
                  children: [
                    Container(
                      height: context.height,
                      width: context.width,
                      padding: EdgeInsets.all(
                        kHeight(0.03),
                      ),
                      child: SingleChildScrollView(
                        child: Form(
                          key: postTaskDetailController.formKey,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: CustomText(
                                    alignText: TextAlign.left,
                                    text: 'What can I help you sir ?',
                                    textStyle: KTextStyles().subHeading()),
                              ),
                              heightBox(0.02),
                              CustomTextField(
                                controller:
                                    postTaskDetailController.taskController,
                                label: 'Enter details',
                                hintText: 'e.g Clean my house',
                                keyboardType: TextInputType.text,
                                suffixIcon: Icon(null),
                                prefixIcon: Icon(
                                  Icons.task,
                                  color: KColors.kPrimary,
                                ),
                                themeColor: KColors.kPrimary,
                                function: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter valid details";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              heightBox(0.02),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomText(
                                      text: 'Task Detail',
                                      textStyle: KTextStyles().subHeading())),
                              heightBox(0.02),
                              CustomTextField(
                                controller: postTaskDetailController
                                    .descriptionController,
                                label: 'Enter task details',
                                maxLines: 6,
                                hintText: 'e.g Clean my house',
                                keyboardType: TextInputType.text,
                                suffixIcon: Icon(null),
                                prefixIcon: Icon(null),
                                hasPrefix: false,
                                themeColor: KColors.kPrimary,
                                function: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter valid task details";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              heightBox(0.02),
                              GestureDetector(
                                onTap: () {
                                  _showPicker(context: context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(
                                    kHeight(0.01),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        kHeight(0.03),
                                      ),
                                      border:
                                          Border.all(color: KColors.kPrimary)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        CupertinoIcons.video_camera,
                                        color: KColors.kPrimary,
                                        size: kHeight(0.04),
                                      ),
                                      widthBox(0.05),
                                      CustomText(
                                          text: 'Add video/Select from gallery',
                                          textStyle: KTextStyles()
                                              .subHeading(fontSize: 14))
                                    ],
                                  ),
                                ),
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    SizedBox(
                                      height: 60.h,
                                      width: 300.w,
                                      child: galleryFile == null
                                          ? const Center(child: Text(' '))
                                          : Center(
                                              child: Text(galleryFile!.path)),
                                    ),
                                  ],
                                ),
                              ),
                              heightBox(0.1),
                              PrimaryButton(
                                width: context.width,
                                textColor: KColors.kPrimary,
                                borderColor: KColors.kPrimary,
                                color: KColors.noColor,
                                text: 'Next',
                                function: () async {
                                  if (!postTaskDetailController
                                      .formKey.currentState!
                                      .validate()) {
                                    return;
                                  } else {
                                    postTaskDetailController.pageController
                                        .nextPage(
                                            duration: kTabScrollDuration,
                                            curve: Curves.ease);
                                  }
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: context.height,
                      width: context.width,
                      child: Padding(
                        padding: EdgeInsets.all(
                          kHeight(0.03),
                        ),
                        child: SingleChildScrollView(
                          child: Form(
                            key: postTaskDetailController.formKey1,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomText(
                                      alignText: TextAlign.left,
                                      text: 'Where tasker will work ?',
                                      textStyle: KTextStyles().subHeading()),
                                ),
                                heightBox(0.02),
                                heightBox(0.02),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomText(
                                    text: 'Task Location',
                                    textStyle: KTextStyles().subHeading(),
                                  ),
                                ),
                                heightBox(0.01),
                                CustomTextField(
                                  controller: postTaskDetailController
                                      .locationController,
                                  label: 'Enter Location',
                                  hintText: '',
                                  keyboardType: TextInputType.text,
                                  suffixIcon: Icon(null),
                                  prefixIcon: Icon(null),
                                  hasPrefix: false,
                                  function: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter valid location";
                                    } else {
                                      return null;
                                    }
                                  },
                                  themeColor: KColors.kPrimary,
                                ),
                                heightBox(0.02),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: CustomText(
                                        text:
                                            'Where do you want the tasker to work?',
                                        textStyle: KTextStyles().subHeading())),
                                heightBox(0.01),
                                Container(
                                  height: kHeight(0.06),
                                  padding: EdgeInsets.only(left: kHeight(0.02)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      kHeight(0.03),
                                    ),
                                    border: Border.all(color: KColors.kPrimary),
                                  ),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          print('hanan');
                                          bool timeAuto = await DatetimeSetting
                                              .timeIsAuto();
                                          bool timezoneAuto =
                                              await DatetimeSetting
                                                  .timeZoneIsAuto();

                                          if (!timezoneAuto || !timeAuto) {
                                            // DatetimeSetting.openSetting();
                                            KDialogs().simpleDialog(
                                              textConfirm: 'Settings',
                                              content:
                                                  'To avoid date conflicts, enable the "Set Automatically" Date Time option when reserving the table.',
                                              onConfirm: () {
                                                Get.back();
                                                DatetimeSetting.openSetting();
                                              },
                                            );
                                          } else {
                                            postTaskDetailController.datePicked
                                                .value = (await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2050),
                                              // color: KColors.kSecondary,
                                              builder: (context, child) {
                                                return Theme(
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    colorScheme:
                                                        const ColorScheme.light(
                                                      primary: KColors.kPrimary,
                                                      // header background color
                                                      onPrimary: Colors.white,
                                                      // header text color
                                                      onSurface: KColors.kBlack,
                                                      // body text color
                                                    ),
                                                    textButtonTheme:
                                                        TextButtonThemeData(
                                                      style:
                                                          TextButton.styleFrom(
                                                        primary: KColors
                                                            .kRed, // button text color
                                                      ),
                                                    ),
                                                  ),
                                                  child: child!,
                                                );
                                              },
                                            ))!;
                                          }
                                        },
                                        child: Icon(
                                          Icons.calendar_today_outlined,
                                          color: KColors.kPrimary,
                                        ),
                                      ),
                                      widthBox(0.05),
                                      Obx(() {
                                        return CustomText(
                                          text:
                                              '${postTaskDetailController.datePicked.value.day}-${postTaskDetailController.datePicked.value.month}-${postTaskDetailController.datePicked.value.year}',
                                          textStyle: KTextStyles().normal(),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                                heightBox(0.03),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomText(
                                      alignText: TextAlign.left,
                                      text: "Whats's your budget",
                                      textStyle: KTextStyles().subHeading()),
                                ),
                                heightBox(0.02),
                                CustomTextField(
                                  controller:
                                      postTaskDetailController.budgetController,
                                  label: 'e.g 1000',
                                  hintText: '',
                                  keyboardType: TextInputType.text,
                                  suffixIcon: Icon(null),
                                  prefixIcon: Icon(
                                    Icons.task,
                                    color: KColors.kPrimary,
                                  ),
                                  function: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter valid budget";
                                    } else {
                                      return null;
                                    }
                                  },
                                  themeColor: KColors.kPrimary,
                                ),
                                heightBox(0.115),
                                PrimaryButton(
                                    width: 0.9,
                                    textColor: KColors.kPrimary,
                                    borderColor: KColors.kPrimary,
                                    color: KColors.noColor,
                                    text: 'Previous',
                                    function: () {
                                      postTaskDetailController.pageController
                                          .previousPage(
                                              duration: kTabScrollDuration,
                                              curve: Curves.ease);
                                    }),
                                heightBox(0.01),
                                Consumer<PostJobViewModel>(
                                    builder: (ctx, provider, child) {
                                  if (provider.state == JobPostState.loading) {
                                    return Center(
                                      child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }
                                  return PrimaryButton(
                                      width: 0.9,
                                      textColor: KColors.kWhite,
                                      borderColor: KColors.kPrimary,
                                      color: KColors.kPrimary,
                                      text: 'Post a job',
                                      function: () async {
                                        // if (!postTaskDetailController
                                        //     .formKey.currentState!
                                        //     .validate()) {
                                        //   return;
                                        // } else {
                                        try {
                                          await provider.postJob(
                                              title: postTaskDetailController
                                                  .taskController.text,
                                              description:
                                                  postTaskDetailController
                                                      .descriptionController
                                                      .text,
                                              imageUrl: 'N/A',
                                              videoPath: 'N/A',
                                              budget: postTaskDetailController
                                                  .budgetController.text,
                                              time: '5:60 AM',
                                              date:
                                                  '${postTaskDetailController.datePicked.value.day}-${postTaskDetailController.datePicked.value.month}-${postTaskDetailController.datePicked.value.year}'
                                                      .toString(),
                                              location: [],
                                              status: 'pending',
                                              address: postTaskDetailController
                                                  .locationController.text,
                                              numberOfBids: 0,
                                              jobType: widget.title,
                                              name: currentUser!.userName);
                                            showSnackBar(context: context, message: 'Job Posted successfully');
                                            Navigator.pop(context);
                                        } on CustomException catch (error) {
                                          showErrorDialogue(error.prefix,
                                              error.message, context);
                                        }
                                        // }
                                      });
                                }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  getVideo(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getVideo(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getVideo(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickVideo(
        source: img,
        preferredCameraDevice: CameraDevice.front,
        maxDuration: const Duration(minutes: 10));
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }
}
