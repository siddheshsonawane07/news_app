import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_info.dart';

// ignore: camel_case_types
class API_Manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    late NewsModel newsModel;

    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=4449f316d15e477eb5a818c9926e463b');
      var response = await client.get(url);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }
}
