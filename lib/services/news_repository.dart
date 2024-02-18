import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:mini_project_2/model/news_model.dart';

class NewsRepository {
  String newsUrl = 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=2e764ee9cece4af6bb6e137439d9f8a0';

  Future<List<NewsModel>> getNews() async {
    final response = await http.get(Uri.parse(newsUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> articles = data['articles'];
      return articles.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load news: ${response.reasonPhrase}');
    }
  }
}

