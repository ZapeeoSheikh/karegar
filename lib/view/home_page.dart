import 'package:flutter/material.dart';

import 'package:softec/utils/widgets/custom_app_bar.dart';
import '../utils/colors.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar:CustomAppBar(
            backgroundColor:  KColors.kPrimary,
            title: "My App",
            actions: [],

        ),
      ),
    );
  }
}
