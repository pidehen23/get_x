import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'movie_model.g.dart';

List<MovieModel> movieModelFromJson(String str) =>
    List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String movieModelToJson(List<MovieModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieModel {
  MovieModel({
    required this.title,
    required this.shareUrl,
    required this.author,
    required this.itemCover,
    required this.hotValue,
    required this.hotWords,
    required this.playCount,
    required this.diggCount,
    required this.commentCount,
  });

  String title;
  String shareUrl;
  String author;
  String itemCover;
  int hotValue;
  String hotWords;
  int playCount;
  int diggCount;
  int commentCount;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
