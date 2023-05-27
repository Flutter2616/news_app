import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Dashscreen extends StatefulWidget {
  const Dashscreen({Key? key}) : super(key: key);

  @override
  State<Dashscreen> createState() => _DashscreenState();
}

class _DashscreenState extends State<Dashscreen> {
  @override
  Widget build(BuildContext context) {
    nf = Provider.of<Newsprovider>(context, listen: false);
    nt = Provider.of<Newsprovider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: nf!.newsdata(nt!.cat),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              Newsmodel? news = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          iconbutton(Icon(Icons.menu,
                              color: Colors.black, size: 2.5.h)),
                          Spacer(),
                          Text("Live",style: TextStyle(color: Colors.blue,fontSize: 2.8.h,fontWeight: FontWeight.bold)),
                          Text("News",style: TextStyle(color: Colors.red,fontSize: 2.5.h,fontWeight: FontWeight.w500)),
                          Spacer(),
                          iconbutton(Icon(Icons.search,
                              color: Colors.black, size: 2.5.h)),
                          SizedBox(width: 10),
                          iconbutton(Icon(Icons.notifications_active_outlined,
                              color: Colors.black, size: 2.5.h)),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("BreakingNews",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 2.5.h)),
                          TextButton(
                            child: Text("View all",
                                style: GoogleFonts.poppins(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 1.8.h)),
                            onPressed: () {
                              Navigator.pushNamed(context, 'view');
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    CarouselSlider.builder(
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          // height: 20.h,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 20.w,
                                  // height: 4.h,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue),
                                  child: Text(
                                      "${news!.articles![index].source!.name}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 3.w,
                                          color: Colors.white)),
                                ),
                                Spacer(),
                                Text(
                                  "${news.articles![index].author}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "${news.articles![index].title}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        );
                      },
                      itemCount: 6,
                      options: CarouselOptions(onPageChanged: (index, reason) {
                        nf!.changeslider(index);
                      },
                          animateToClosest: true,
                          autoPlayAnimationDuration: Duration(seconds: 3),
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          height: 20.h,
                          initialPage: 0,
                          aspectRatio: 10,
                          viewportFraction: 0.8,
                          pageSnapping: true),
                    ),
                    SizedBox(height: 8),
                    // DotsIndicator(
                    //     dotsCount: 6,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     position: nt!.sliderindex,
                    //     decorator: DotsDecorator(
                    //         spacing: EdgeInsets.symmetric(horizontal: 3),
                    //         size: Size.fromRadius(1.w),
                    //         color: Colors.grey,
                    //         activeColor: Colors.blue,
                    //         activeSize: Size.fromRadius(1.5.w))),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Recommendation",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 5.w,
                                  color: Colors.black)),
                          InkWell(onTap: () {
                            Navigator.pushNamed(context, 'view');
                          },
                            child: Text("View all",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 3.w,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15),
                      child: Column(
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
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  CircleAvatar iconbutton(Icon i) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade200,
      child: i,
      radius: 2.8.h,
    );
  }
}
