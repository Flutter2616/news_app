import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/shared_pre_model.dart';
import 'package:news_app/utils/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController txtemail=TextEditingController();
  TextEditingController txtpassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/image/login.png",
                      height: 30.h, width: 35.h, fit: BoxFit.fill),
                  Text("Welcome back!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 5),
                  Text(
                    "Log in to your existant account of Q Allure",
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 30),
                  Container(
                      height: 7.h,
                      width: 100.w,
                      child: TextField(controller: txtemail,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.blue.shade700),
                        decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.blue.shade700, width: 2),
                          ),
                          prefixIcon: Icon(Icons.person_2_outlined),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center),
                  SizedBox(height: 15),
                  Container(
                      height: 7.h,
                      width: 100.w,
                      child: TextField(controller: txtpassword,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.blue.shade700),
                        decoration: InputDecoration(
                          focusColor: Colors.blue.shade700,
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.blue.shade700, width: 2),
                          ),
                          prefixIcon: Icon(Icons.lock_open_outlined),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forgot Password?",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      Sharepre share=Sharepre();
                      Sharedmodel sharemodel =await share.getdata();
                      if(sharemodel.email==txtemail.text&&sharemodel.password==txtpassword.text)
                        {
                          Navigator.pushReplacementNamed(context, 'home');
                        }
                      else
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Invalid id & password!",
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              backgroundColor: Colors.red.shade900,
                              width: 90.w,
                              duration: Duration(seconds: 2),
                              showCloseIcon: true,
                              behavior: SnackBarBehavior.floating));
                        }
                    },
                    child: Container(
                        height: 6.h,
                        width: 50.w,
                        child: Text("Log In",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                                fontSize: 15.sp)),
                        decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius: BorderRadius.circular(25)),
                        alignment: Alignment.center),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Or Connect using",
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 15),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 4.h,
                          width: 30.w,
                          child: Text("Facebook",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0,
                                  fontSize: 13.sp)),
                          decoration: BoxDecoration(
                              color: Colors.indigo.shade700,
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center),
                      SizedBox(width: 10),
                      Container(
                          height: 4.h,
                          width: 30.w,
                          child: Text("Google",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0,
                                  fontSize: 13.sp)),
                          decoration: BoxDecoration(
                              color: Colors.red.shade600,
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont't have an account?",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 15)),
                      TextButton(onPressed: () {
                        Navigator.pushReplacementNamed(context, 'signup');
                      }, child: Text("Sign up",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blue,fontSize: 15)))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
