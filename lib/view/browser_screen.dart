import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/view/dash_screen.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Browserscreen extends StatefulWidget {
  const Browserscreen({Key? key}) : super(key: key);

  @override
  State<Browserscreen> createState() => _BrowserscreenState();
}

class _BrowserscreenState extends State<Browserscreen> {
  // PullToRefreshController pullToRefreshController=PullToRefreshController();
  TextEditingController txtsearch=TextEditingController();
  @override
  Widget build(BuildContext context) {
    nf = Provider.of<Newsprovider>(context, listen: false);
    nt = Provider.of<Newsprovider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(controller: txtsearch,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: "Search category",
                      suffixIcon:
                          InkWell(onTap: () {
                             nt!.search=txtsearch.text;
                          },child: Icon(Icons.search, color: Colors.black, size: 5.w)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ))),
                ),
              ),
              LinearProgressIndicator(color: Colors.blue,backgroundColor: Colors.grey.shade200),
            ],
          ),
        ),
      ),
    );
  }
}
