import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_7/models/get_posts.dart';
import 'package:lab_7/post/bloc/post_bloc.dart';
import 'package:lab_7/post/repository/post_repository.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocProvider(
        create: (context) => PostBloc(PostRepository())..add(GetPostEvent()),
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is LoadingPostState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FetchedPostState) {
              return _buildPostsList(state.posts);
            } else if (state is FailurePostState) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('Pull to refresh'));
          },
        ),
      ),
    );
  }

  Widget _buildPostsList(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(post.title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(post.body),
            contentPadding: const EdgeInsets.all(16),
          ),
        );
      },
    );
  }
}
