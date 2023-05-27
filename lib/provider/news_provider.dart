import 'package:floating_bottom_navigation_bar/src/floating_navbar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/utils/news_api.dart';
import 'package:news_app/view/dash_screen.dart';

class Newsprovider extends ChangeNotifier
{
  int pageindex=0;
  int sliderindex=0;
  String? search;

  void searchbar(TextEditingController txtsearch)
  {
    search=txtsearch.text;
    notifyListeners();
  }

  void changeslider(int index)
  {
    sliderindex=index;
    notifyListeners();
  }

  Future<Newsmodel> newsdata() async {
    return await Newsapi.newsapi.news_api_calling();
    notifyListeners();
  }

  void changepage(int value)
  {
    pageindex=value;
    notifyListeners();
  }

}