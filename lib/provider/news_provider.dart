import 'package:floating_bottom_navigation_bar/src/floating_navbar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/utils/news_api.dart';
import 'package:news_app/view/dash_screen.dart';

class Newsprovider extends ChangeNotifier
{
  int pageindex=0;
  int sliderindex=0;
double searchprogress=0;

  bool all=true;
  bool business=false;
  bool market=false;
  bool education=false;
  bool sport=false;
  bool politic=false;
  String cat='business';

  void searchprogressindicator(double progress)
  {
    searchprogress=progress;
    notifyListeners();
  }

  void changeslider(int index)
  {
    sliderindex=index;
    notifyListeners();
  }

  Future<Newsmodel> newsdata(String cat) async {
    return await Newsapi.newsapi.news_api_calling(cat);
    notifyListeners();
  }

  void changepage(int value)
  {
    pageindex=value;
    notifyListeners();
  }


  void category(String title)
  {


    if(title=='All')
      {
        cat=title;
         all=true;
         business=false;
         market=false;
         education=false;
         sport=false;
         politic=false;
      }
    else if(title=='Politic')
      {        cat=title;
      all=false;
        business=false;
        market=false;
        education=false;
        sport=false;
        politic=true;
      }
    else if(title=='Sport')
      {
        cat=title;
        all=false;
        business=false;
        market=false;
        education=false;
        sport=true;
        politic=false;
      }
    else if(title=='Education')
      {
        cat=title;
        all=false;
        business=false;
        market=false;
        education=true;
        sport=false;
        politic=false;
      }
    else if(title=='Business')
    {
      cat=title;
      all=false;
      business=true;
      market=false;
      education=false;
      sport=false;
      politic=false;
    }
    else
    {
      cat=title;
      all=false;
      business=false;
      market=true;
      education=false;
      sport=false;
      politic=false;
    }
    notifyListeners();
  }

}