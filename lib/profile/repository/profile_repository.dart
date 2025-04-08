import 'dart:async';
import 'package:lab_7/models/get_posts.dart';
import 'package:lab_7/rest_client/mobile_api_dio.dart';
import 'package:lab_7/rest_client/mobile_api.dart';

class PostRepository {
  final _mobileClient = MobileClient(MobileApiDio().client);

  Future<List<Post>> getPosts() async {
    try {
      final response = await _mobileClient.getListData();
      return response
          .cast<Post>(); 
    } catch (e) {
      throw Exception(e.toString()); 
    }
  }
}
