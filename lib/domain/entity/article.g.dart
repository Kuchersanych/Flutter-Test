// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      id: json['id'] as String,
      title: json['title'] as String,
      publicationDate: DateTime.parse(json['publicationDate'] as String),
      imageUrl: json['imageUrl'] as String,
      readed: json['readed'] as bool? ?? false,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'publicationDate': instance.publicationDate.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'readed': instance.readed,
      'description': instance.description,
    };
