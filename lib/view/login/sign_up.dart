import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtconfirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_back, color: Colors.black, size: 25.sp),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Let's Get Started!",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 10),
                  Text("Create an account to Q Allure to get all features",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 40),
                  Container(
                      height: 8.h,
                      width: 100.w,
                      child: TextField(
                        controller: txtname,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.blue.shade700),
                        decoration: InputDecoration(
                          hintText: "UserName",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.blue.shade700, width: 2),
                          ),
                          prefixIcon: Icon(Icons.person_2_outlined),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center),
                  SizedBox(height: 20),
                  Container(
                      height: 8.h,
                      width: 100.w,
                      child: TextField(
                        controller: txtemail,
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
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.blue.shade700, width: 2),
                          ),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center),
                  SizedBox(height: 20),
                  Container(
                      height: 8.h,
                      width: 100.w,
                      child: TextField(
                        controller: txtphone,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.blue.shade700),
                        decoration: InputDecoration(
                          hintText: "Phone",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.blue.shade700, width: 2),
                          ),
                          prefixIcon: Icon(Icons.phone_android),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center),
                  SizedBox(height: 20),
                  Container(
                      height: 8.h,
                      width: 100.w,
                      child: TextField(
                        controller: txtpassword,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.blue.shade700),
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.blue.shade700, width: 2),
                          ),
                          prefixIcon: Icon(Icons.lock_open_outlined),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center),
                  SizedBox(height: 20),
                  Container(
                      height: 8.h,
                      width: 100.w,
                      child: TextField(
                        controller: txtconfirmpassword,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.blue.shade700),
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                                color: Colors.blue.shade700, width: 2),
                          ),
                          prefixIcon: Icon(Icons.lock_open_outlined),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      if (txtpassword.text == txtconfirmpassword.text) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Your account create successfully",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                            backgroundColor: Colors.green.shade900,
                            width: 90.w,
                            duration: Duration(seconds: 2),
                            showCloseIcon: true,
                            behavior: SnackBarBehavior.floating));
                        Sharepre share = Sharepre();
                        share.loginget_data(
                            name: txtname.text,
                            phone: txtphone.text,
                            email: txtemail.text,
                            password: txtpassword.text,
                            firstuser: true);
                        Navigator.pushReplacementNamed(context, 'signin');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Your password and confirm password is not same!",
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
                        height: 7.h,
                        width: 50.w,
                        child: Text("CREATE",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                                fontSize: 15.sp)),
                        decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius: BorderRadius.circular(30)),
                        alignment: Alignment.center),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 15)),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, 'signin');
                          },
                          child: Text("Login here",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blue,
                                  fontSize: 15)))
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
