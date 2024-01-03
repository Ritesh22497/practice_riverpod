import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:practice_riverpod/models/post.dart';

class HttpGetPost {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com';
  static const _endPoint = '/posts';
  Future<List<Post>> getPosts() async {
    List<Post> posts = [];
    try {
      Uri postsUrl = Uri.parse("$_baseUrl$_endPoint");
      await http.get(postsUrl);
      http.Response response = await http.get(postsUrl);

      if (response.statusCode == 200) {
        List<dynamic> postsList = convert.jsonDecode(response.body);
        // print(postsList.toString());
        postsList.forEach((postsListItem) {
          for (var postsListItem in postsList) {
            Post post = Post.fromMap(postsListItem);
            posts.add(post);
          }
        });
      }
    } catch (e) {
      print(e.toString());
    }
    return posts;
  }
}
