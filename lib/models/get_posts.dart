import 'package:json_annotation/json_annotation.dart'; // Required for JSON serialization

part 'get_posts.g.dart'; // Must match your filename: get_posts.dart → get_posts.g.dart

@JsonSerializable()
class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
