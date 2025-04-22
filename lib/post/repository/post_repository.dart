import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lab_7/models/get_posts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostRepository {
  static const _baseUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts({bool forceRefresh = false}) async {
    try {
      if (!forceRefresh) {
        final prefs = await SharedPreferences.getInstance();
        final cachedData = prefs.getString('cached_posts');
        if (cachedData != null) {
          final jsonList = jsonDecode(cachedData) as List;
          return jsonList.map((json) => Post.fromJson(json)).toList();
        }
      }

      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('cached_posts', response.body);

        final List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }
}
