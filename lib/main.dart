import 'package:flutter/material.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/view/Splashscreen.dart';
import 'package:news_app/view/browser_screen.dart';
import 'package:news_app/view/dash_screen.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:news_app/view/intro_screen.dart';
import 'package:news_app/view/login/login_screen.dart';
import 'package:news_app/view/login/sign_in.dart';
import 'package:news_app/view/login/sign_up.dart';
import 'package:news_app/view/profile_screen.dart';
import 'package:news_app/view/tag_screen.dart';
import 'package:news_app/view/viewall_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => Newsprovider()),
          ],
          child: MaterialApp(
            // initialRoute: 'signup',
            routes: {
              '/': (context) => Splashscreen(),
              'intro': (context) => Introscreen(),
              'home': (context) => Homescreen(),
              'dash': (context) => Dashscreen(),
              'search': (context) => Browserscreen(),
              'tag': (context) => Tagscreen(),
              'profile': (context) => Profilescreen(),
              'view': (context) => Viewallscreen(),
              'login': (context) => Loginscreen(),
              'signin': (context) => Signin(),
              'signup': (context) => Signup(),
            },
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    ),
  );
}
