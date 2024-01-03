import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/services/http_get_services.dart';

import '../../models/post.dart';

@immutable
abstract class PostState {}

class InitialPostState extends PostState {}

class PostsLoadingPostState extends PostState {}

class PostsLoadedPostState extends PostState {
  PostsLoadedPostState({
    required this.posts,
  });
  final List<Post> posts;
}

class ErrorPostState extends PostState {
  ErrorPostState({
    required this.message,
  });
  final String message;
}

class PostsNotifier extends StateNotifier<PostState> {
  PostsNotifier() : super(InitialPostState());
  final HttpGetPost _httpGetPost = HttpGetPost();
  void fetchPosts() async {
    try {
      state = PostsLoadingPostState();
      List<Post> posts = await _httpGetPost.getPosts();
      state = PostsLoadedPostState(posts: posts);
    } catch (e) {
      state = ErrorPostState(
        message: e.toString(),
      );
    }
  }
}
