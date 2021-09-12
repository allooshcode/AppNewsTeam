class NewsArticles {
  String status;
  List<Articles> articles;

  NewsArticles(this.status, this.articles);
}

class Articles {
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String publishedAt;

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title']??"";
    description = json['description']??"";
    url = json['url']??"";
    urlToImage = json['urlToImage']??"";
    publishedAt = json['publishedAt']??"";
  }
}
