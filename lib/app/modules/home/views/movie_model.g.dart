// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      title: json['title'] as String,
      shareUrl: json['share_url'] as String,
      author: json['author'] as String,
      itemCover: json['item_cover'] as String,
      hotValue: json['hot_value'] as int,
      hotWords: json['hot_words'] as String,
      playCount: json['play_count'] as int,
      diggCount: json['digg_count'] as int,
      commentCount: json['comment_count'] as int,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'share_url': instance.shareUrl,
      'author': instance.author,
      'item_cover': instance.itemCover,
      'hot_value': instance.hotValue,
      'hot_words': instance.hotWords,
      'play_count': instance.playCount,
      'digg_count': instance.diggCount,
      'comment_count': instance.commentCount,
    };
