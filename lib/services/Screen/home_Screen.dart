import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice_riverpod/models/post.dart';
import 'package:practice_riverpod/provider/providers.dart';
import 'package:practice_riverpod/services/state/post_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Consumer(builder: (context, ref, child) {
          PostState state = ref.watch(postsProvider);

          print(state.toString());
          if (state is InitialPostState) {
            return const Text('Press Fab to Fetch Data');
          }
          if (state is PostsLoadingPostState) {
            return const CircularProgressIndicator();
          }
          if (state is ErrorPostState) {
            return Text(state.message);
          }
          if (state is PostsLoadedPostState) {
            return _buildListView(state);
          }
          return const Text('Nothing Found');
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(postsProvider.notifier).fetchPosts();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildListView(PostsLoadedPostState state) {
    return ListView.builder(
        itemCount: state.posts.length,
        itemBuilder: (context, index) {
          Post post = state.posts[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                post.id.toString(),
              ),
            ),
            title: Text(
              post.title,
            ),
          );
        });
  }
}
