import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Viewallscreen extends StatefulWidget {
  const Viewallscreen({Key? key}) : super(key: key);

  @override
  State<Viewallscreen> createState() => _ViewallscreenState();
}

class _ViewallscreenState extends State<Viewallscreen> {
  @override
  Widget build(BuildContext context) {
    nf = Provider.of<Newsprovider>(context, listen: false);
    nt = Provider.of<Newsprovider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                InkWell(onTap: () {
                  Navigator.pushReplacementNamed(context, 'home');
                },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.arrow_back_ios_new,
                        size: 2.h, color: Colors.black),
                    radius: 2.8.h,
                  ),
                ),
                SizedBox(height: 20),
                Text("Discover",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 30.sp)),
                Text("News them all around the world",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp)),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25)),
                      suffixIcon: Icon(Icons.tune, color: Colors.grey, size: 30),
                      prefixIcon:
                      Icon(Icons.search, size: 30, color: Colors.grey),
                      fillColor: Colors.grey.shade200,
                      filled: true),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      category("All",nt!.all),
                      category("Politic",nt!.politic),
                      category("Sport",nf!.sport),
                      category("Education",nf!.education),
                      category("Business",nf!.business),
                      category("Market",nf!.market),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                FutureBuilder(
                  future: nf!.newsdata(nt!.cat),
                  builder: (context, snapshot) {
                    if(snapshot.hasError)
                      {

                      }
                    else if(snapshot.hasData)
                      {
                        Newsmodel? news=snapshot.data;
                        return Column(
                          children: news!.articles!
                              .asMap()
                              .entries
                              .map((e) => Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 28.w,
                                  width: 28.w,
                                  // child: ClipRRect(
                                  //     borderRadius:
                                  //         BorderRadius.circular(15),
                                  //     child: Image.network(
                                  //         "${news.articles![e.key].urltoImage}",
                                  //         fit: BoxFit.fill)),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius:
                                    BorderRadius.circular(15),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Container(
                                    height: 28.w,
                                    width: 20.w,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${news.articles![e.key].source!.name}",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 10.sp,
                                                fontWeight:
                                                FontWeight.w500)),
                                        Text(
                                            "${news.articles![e.key].title}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.sp,
                                                fontWeight:
                                                FontWeight.w500)),
                                        Text(
                                            "${news.articles![e.key].publishedAt}",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10.sp,
                                                fontWeight:
                                                FontWeight.w500)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                              .toList(),
                        );
                      }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget category(String title, bool active) {
    return InkWell(onTap: () {
      nf!.category(title);
    },
      child: Container(margin: EdgeInsets.only(right: 10),
                child: Text("$title", style: TextStyle(color: active?Colors.white:Colors.black)),
                padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: active?Colors.blue:Colors.grey.shade200),
              ),
    );
  }
}
