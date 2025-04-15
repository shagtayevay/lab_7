import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_7/models/get_posts.dart';
import 'package:lab_7/post/bloc/post_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is LoadingPostState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FetchedPostState) {
            return _buildPostsList(state.posts);
          } else if (state is FailurePostState) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          }
          return const Center(child: Text('No data'));
        },
      ),
    );
  }

  Widget _buildPostsList(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(post.body),
              ],
            ),
          ),
        );
      },
    );
  }
}
