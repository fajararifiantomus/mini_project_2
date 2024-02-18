class NewsModel {
  String? sourceName;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel({
    this.sourceName,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
      sourceName = json['source']['name'];
      author = json['author'];
      title = json['title'];
      description = json['description'];
      url = json['url'];
      urlToImage = json['urlToImage'];
      publishedAt = json['publishedAt'];
      content = json['content'];
  }
}
