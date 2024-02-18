import 'package:flutter/material.dart';
import 'package:mini_project_2/model/news_model.dart';

class DetailScreen extends StatelessWidget {
  final NewsModel news;

  const DetailScreen({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.urlToImage != null)
              Image.network(news.urlToImage!,
                  height: 200, width: double.infinity, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(news.title ?? '',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(news.author ?? ''),
            SizedBox(height: 8),
            Text(news.publishedAt ?? '',
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            SizedBox(height: 16),
            Text(news.description ?? ''),
            SizedBox(height: 16),
            if (news.content != null) Text(news.content ?? ''),
            SizedBox(height: 8),
            Text(news.url ?? ''),
          ],
        ),
      ),
    );
  }
}
