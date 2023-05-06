import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softec/view/addLocation_view.dart';
import '../utils/r_colors.dart';
import 'addSkills.dart';
import 'chooseRole_view.dart';
import 'login_view.dart';

class AddCnic extends StatefulWidget {
  const AddCnic({Key? key, required this.name, required this.email, required this.password, required this.phone}) : super(key: key);
  final String name;
  final String email;
  final String password;
  final String phone;
  @override
  State<AddCnic> createState() => _AddCnicState();
}

class _AddCnicState extends State<AddCnic> {
  bool error1 = false;


  final _controller = TextEditingController();


  String? get _errorText1 {
    final text = _controller.value.text;

    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    else if (text.length < 12) {
      return 'Too short';
    } else if (text.length > 12) {
      return 'Too Long';
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
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
                    SizedBox(height: 80.h,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CNIC Number",
                          style: GoogleFonts.roboto(fontSize: 32.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h,),
                    Image(image: AssetImage("assets/Vector/cnic.png")),
                    SizedBox(height: 80.h,),
                    TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.perm_identity_rounded),
                        hintText: "Enter your cnic number",
                        labelText: "Cnic number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColor.radioButtonActive,),
                          borderRadius: BorderRadius.circular(10),

                        ),
                        errorText: error1 == false
                            ? null
                            : _errorText1,
                      ),
                    ),
                    SizedBox(height: 20.h,),

                    SizedBox(height: 50.h,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          print(widget.phone);
                          if (_controller
                              .value
                              .text
                              .isNotEmpty
                          ) {
                            if (_errorText1 ==
                                null) {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AddSkills(name: widget.name, email: widget.email, password: widget.password, phone: widget.phone, cnic: _controller.text,)));
                            } else {
                              error1 = true;

                            }
                          } else {
                            error1 = true;

                          }
                        });                        },
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 60.h,
                              decoration: BoxDecoration(
                                color: MyColor.mainColor1,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text(
                                "Next", style: TextStyle(color: Colors.white, fontSize: 16.sp),)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.h,),

                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
