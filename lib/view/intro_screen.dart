import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:sizer/sizer.dart';

class Introscreen extends StatefulWidget {
  const Introscreen({Key? key}) : super(key: key);

  @override
  State<Introscreen> createState() => _IntroscreenState();
}

class _IntroscreenState extends State<Introscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          isBottomSafeArea: false,autoScrollDuration: 2,
          pages: [
            PageViewModel(
                image: Image.asset("assets/image/intro1.png"),
                title: "Get All Types of news",useScrollView: true,
                body:
                    "All Type of News all Trusted Source For all Tyoe of People",
                decoration: PageDecoration(
                    bodyAlignment: Alignment.center,imagePadding: EdgeInsets.only(top: 40),
                    imageAlignment: Alignment.bottomCenter,
                    titleTextStyle: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                    bodyTextStyle: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp))),
            PageViewModel(
                image: Image.asset("assets/image/intro2.png"),
                title: "get The Update News",
                body:
                    "Come on,get the latest and update Articles Easily with us every day",
                decoration: PageDecoration(
                    bodyAlignment: Alignment.center,imagePadding: EdgeInsets.only(top: 40),
                    titleTextStyle: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                    bodyTextStyle: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp))),
            PageViewModel(
                image: Image.asset("assets/image/intro3.png"),
                title: "Search For News",
                body:
                    "You can search for All Type of News From all trusted Sources",
                decoration: PageDecoration(
                    bodyAlignment: Alignment.center,imagePadding: EdgeInsets.only(top: 40),
                    titleTextStyle: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp),
                    bodyTextStyle: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp))),
          ],
          onSkip: () {
            Navigator.pushReplacementNamed(context, 'login');
          },back: Icon(Icons.arrow_back,color: Colors.black,size: 30,weight: 30),showBackButton: false,
          showSkipButton: true,
          skip: Text("Skip",
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          next: Text("Next",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp)),
          onDone: () {
            Navigator.pushReplacementNamed(context, 'login');
          },
          showDoneButton: true,
          showNextButton: true,
          initialPage: 0,
          done: Text("Done",style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp)),
        ),
      ),
    );
  }
}
