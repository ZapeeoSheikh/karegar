import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:softec/data/app_exceptions.dart';
import 'package:softec/utils/error_dialogue.dart';
import 'package:softec/view/home_page.dart';
import 'package:softec/view_models/auth_view_model.dart';
import '../res/global_variables.dart';
import '../utils/colors.dart';
import '../utils/r_colors.dart';
import '../utils/routes.dart';
import 'chooseRole_view.dart';
import 'login_view.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({
    Key? key,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.cnic,
    required this.skills,
  }) : super(key: key);
  final String name;
  final String email;
  final String password;
  final String phone;
  final String cnic;
  final List skills;
  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  bool error1 = false;

  final _controller = TextEditingController();

  String? get _errorText1 {
    final text = _controller.value.text;

    if (text.isEmpty) {
      return 'Can\'t be empty';
    } else
      return null;
  }

  String? _currentAddress;
  Position? _currentPosition;
  // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

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
                  height: 80.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add Location",
                      style: GoogleFonts.roboto(fontSize: 32.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80.h,
                ),
                GestureDetector(
                  onTap: _getCurrentPosition,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: MyColor.mainColor1, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            "Get Current Location",
                            style: TextStyle(
                                color: MyColor.mainColor1, fontSize: 16.sp),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.home),
                    hintText: "Enter your address",
                    labelText: "Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: MyColor.radioButtonActive,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorText: error1 == false ? null : _errorText1,
                  ),
                ),
                SizedBox(
                  height: 120.h,
                ),
                Consumer<AuthViewModel>(builder: (ctx, provider, child) {
                  if (provider.authState == AuthState.loading) {
                    const Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: KColors.kPrimary,
                        ),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () async {
                      try{  
                        await provider.signUp(
                          email: widget.email,
                          password: widget.password,
                          userName: widget.name,
                          userType: UserType.tradePerson,
                          skills: widget.skills as List<String>,
                          );
                      Navigator.pushReplacementNamed(context, Routes.bottomNav);
                      }on CustomException catch(error){
                        showErrorDialogue(error.prefix, error.message, context);
                      }
                      //
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
                              "Done",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.sp),
                            )),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
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

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() => _currentPosition = position);
      await _getAddressFromLatLng(_currentPosition!);
      _controller.text = _currentAddress!;
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    setState(() {
      _controller.text = 'Loading Address....';
    });
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
