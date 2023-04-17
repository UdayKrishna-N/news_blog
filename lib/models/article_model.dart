import 'dart:core';

class Article {
  final String author;
  final String title;
  final String description;
  final String urlToArticle;
  final String urlToImage;
  final String publishedAt;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.urlToArticle,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> jsonData) {
    return Article(
      author: jsonData['author'] as String,
      title: jsonData['title'] as String,
      description: jsonData['description'] as String,
      urlToImage: jsonData['urlToImage'] as String,
      urlToArticle: jsonData['url'] as String,
      publishedAt: jsonData['publishedAt'] as String,
    );
  }
}
