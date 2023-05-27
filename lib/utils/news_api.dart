import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class Newsapi
{

  static Newsapi newsapi=Newsapi();

  Future<Newsmodel> news_api_calling(String category)
  async {
    String link="https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=17cdd515acfe440eb13f9801f33a958a";
    var response=await http.get(Uri.parse(link));
    var json=jsonDecode(response.body);
    return Newsmodel.fromjson(json);
  }
}