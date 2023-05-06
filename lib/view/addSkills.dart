// import 'package:filter_list/filter_list.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softec/view/addLocation_view.dart';
import '../utils/r_colors.dart';
import 'chooseRole_view.dart';
import 'login_view.dart';

class AddSkills extends StatefulWidget {
  const AddSkills({
    Key? key,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.cnic,
  }) : super(key: key);
  final String name;
  final String email;
  final String password;
  final String phone;
  final String cnic;
  @override
  State<AddSkills> createState() => _AddSkillsState();
}

class _AddSkillsState extends State<AddSkills> {
  bool error1 = false;

  final _controller = TextEditingController();

  String? get _errorText1 {
    final text = _controller.value.text;

    if (text.isEmpty) {
      return 'Can\'t be empty';
    } else if (text.length < 12) {
      return 'Too short';
    } else if (text.length > 12) {
      return 'Too Long';
    } else
      return null;
  }

  List<String> selectedSkillList = [];
  List<String> userList = [
    "Plumber",
    "Plumber",
    "Plumber",
    "Plumber",
    "Plumber",
    "Plumber",
  ];

  bool compare(List<String> a, String b) {
    for (String e in a) {
      if (e == b) return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add Your Skills",
                      style: GoogleFonts.roboto(fontSize: 32.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                Image(image: AssetImage("assets/Vector/skills.png")),
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: _openFilterDialog,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: MyColor.mainColor1, width: 3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            "Add Skills",
                            style: TextStyle(
                                color: MyColor.mainColor1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 0.76,
                          blurRadius: 5.sp,
                          offset:
                              const Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    height: 70,
                    child: Center(
                      child: Wrap(
                        children: <Widget>[
                          if (selectedSkillList == null ||
                              selectedSkillList.isEmpty)
                            Expanded(
                              child: Center(
                                child: Text('No skills selected'),
                              ),
                            )
                          else
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 2.5,
                                    runSpacing: 3.0,
                                    children: <Widget>[
                                      for (int i = 0;
                                          i < selectedSkillList.length;
                                          i++)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: i % 2 == 0
                                                    ? MyColor.mainColor1
                                                    : MyColor.mainColor2),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 14),
                                              child: Text(
                                                selectedSkillList[i],
                                                style: TextStyle(
                                                    color: i % 2 == 0
                                                        ? Colors.white
                                                        : MyColor.mainColor1,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 70.h,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      print(selectedSkillList);
                      if (selectedSkillList.length > 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddLocation(
                                      name: widget.name,
                                      email: widget.email,
                                      password: widget.password,
                                      phone: _controller.text,
                                      cnic: _controller.text,
                                      skills: selectedSkillList,
                                    )));
                      }
                      // if (_controller
                      //     .value
                      //     .text
                      //     .isNotEmpty
                      // ) {
                      //   if (_errorText1 ==
                      //       null) {
                      //     // Navigator.push(context, MaterialPageRoute(builder: (context) => AddLocation(name: widget.name, email: widget.email, password: widget.password, phone: _controller.text, cnic: _controller.text, skills: selectedSkillList,)));
                      //   } else {
                      //     error1 = true;
                      //
                      //   }
                      // } else {
                      //   error1 = true;
                      //
                      // }
                    });
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: MyColor.mainColor1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            "Next",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.sp),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Future<void> _openFilterDialog() async {
    await FilterListDialog.display<String>(
      context,
      hideSelectedTextCount: false,
      themeData: FilterListThemeData(context),
      headlineText: 'Select Shop Categories',
      height: 500,
      listData: userList,
      selectedListData: selectedSkillList,
      choiceChipLabel: (item) => item,
      validateSelectedItem: (list, val) =>
          compare(list!, val), //contains(val.productTypeName),
      controlButtons: [ControlButtonType.All, ControlButtonType.Reset],
      //selectedItemsText:selectedCategeory![0].productTypeName,
      onItemSearch: (user, query) {
        return user.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          print(selectedSkillList);
          selectedSkillList = List.from(list!);
          print(selectedSkillList);
        });

        Navigator.pop(context, selectedSkillList);
      },
    );
  }
}
