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
  PullToRefreshController? pullToRefreshController;
  InAppWebViewController? inAppWebViewController;
  TextEditingController txtsearch = TextEditingController();

  @override
  void initState() {
    pullToRefreshController = PullToRefreshController(
      onRefresh: () {
        inAppWebViewController!.reload();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    nf = Provider.of<Newsprovider>(context, listen: false);
    nt = Provider.of<Newsprovider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: InAppWebView( initialUrlRequest:
              URLRequest(url: Uri.parse("https://timesofindia.indiatimes.com/")),
                onLoadError: (controller, url, code, message) {
                  inAppWebViewController = controller;
                  pullToRefreshController!.endRefreshing();
                },
                onLoadStop: (controller, url) {
                  pullToRefreshController!.endRefreshing();
                  inAppWebViewController = controller;
                },
                onLoadStart: (controller, url) {
                  pullToRefreshController!.endRefreshing();
                  inAppWebViewController = controller;
                },
                pullToRefreshController: pullToRefreshController,
                onProgressChanged: (controller, progress) {
                  inAppWebViewController = controller;
                  if (progress == 100) {
                    pullToRefreshController!.endRefreshing();
                  }
                  nf!.searchprogressindicator((progress / 100).toDouble());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
