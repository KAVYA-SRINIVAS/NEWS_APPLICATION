import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/constants/strings.dart';
import 'package:newsapp/models/newsinfo.dart';

class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel = null;
    try {
      var response = await client.get(Uri.parse(Strings.news_url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonmap = json.decode(jsonString);
        newsModel = NewsModel.fromJson(jsonmap);
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }
}
