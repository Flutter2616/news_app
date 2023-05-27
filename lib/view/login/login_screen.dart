import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({Key? key}) : super(key: key);

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.blue.shade50,
          body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/image/login.png",
                  height: 30.h, width: 35.h, fit: BoxFit.fill),
              SizedBox(height: 10),
              InkWell(onTap: () {
                Navigator.pushReplacementNamed(context, 'signin');
              },
                child: Container(
                    height: 6.h,
                    width: 70.w,
                    child: Text("Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp)),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(25)),
                    alignment: Alignment.center),
              ),
              SizedBox(height: 10),
              InkWell(onTap: () {
                Navigator.pushReplacementNamed(context, 'signup');
              },
                child: Container(
                    height: 6.h,
                    width: 70.w,
                    child: Text("Sign up",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue.shade700, width: 2),
                        borderRadius: BorderRadius.circular(25)),
                    alignment: Alignment.center),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
