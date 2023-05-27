import 'package:flutter/material.dart';
import 'package:news_app/model/shared_pre_model.dart';
import 'package:news_app/utils/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3),() async {
      Sharepre share=Sharepre();
      Sharedmodel s=await share.getdata();
      s.usertype==true?Navigator.pushReplacementNamed(context, 'home'):Navigator.pushReplacementNamed(context, 'intro');
    },);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade100,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset("assets/image/logo1.png",
                  width: 30.h, height: 25.h, fit: BoxFit.fill),
              Spacer(),
              Text(
                "Made by:prince rawal",
                style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue.shade900),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
