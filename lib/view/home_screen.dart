import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/view/browser_screen.dart';
import 'package:news_app/view/dash_screen.dart';
import 'package:news_app/view/profile_screen.dart';
import 'package:news_app/view/tag_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';


Newsprovider? nf;
Newsprovider? nt;

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {



  @override
  Widget build(BuildContext context) {
    nf = Provider.of<Newsprovider>(context, listen: false);
    nt = Provider.of<Newsprovider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: FloatingNavbar(
        onTap: (val) {
          nf!.changepage(val);
        },
        items: [
          FloatingNavbarItem(title: "Home", icon: Icons.home),
          FloatingNavbarItem(title: "Browser", icon: Icons.language),
          FloatingNavbarItem(title: "tag", icon: Icons.bookmark_border),
          FloatingNavbarItem(title: "Profile", icon: Icons.person_2_outlined),
        ],
        backgroundColor: Colors.grey.shade100,
        width: 100.w,
        margin: EdgeInsets.all(0),
        currentIndex: nt!.pageindex,
        iconSize: 6.w,
        selectedItemColor: Colors.white,
        padding: EdgeInsets.all(8),
        borderRadius: 0,
        unselectedItemColor: Colors.grey.shade400,
        selectedBackgroundColor: Colors.blue.shade700,
        itemBorderRadius: 25,
        fontSize: 3.w,
      ),
      body: IndexedStack(
        index: nt!.pageindex,
        children: [
          Dashscreen(),
          Browserscreen(),
          Tagscreen(),
          Profilescreen(),
        ],
      ),
    );
  }
}
