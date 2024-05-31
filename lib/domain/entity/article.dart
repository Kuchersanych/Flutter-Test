import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
   Article({
    required this.id,
    required this.title,
    required this.publicationDate,
    required this.imageUrl,
    this.readed = false,
    this.description,
  });

  final String id;
  final String title;
  final DateTime publicationDate;
  final String imageUrl;
  late  bool readed;
  final String? description;

  /// Преобразование из json
  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  /// Преобразование в json
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
