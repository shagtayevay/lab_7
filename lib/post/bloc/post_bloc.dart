import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_7/models/get_posts.dart';
import 'package:lab_7/post/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _repository;

  PostBloc(this._repository) : super(PostInitial()) {
    on<GetPostEvent>(_onGetPost);
  }

  Future<void> _onGetPost(GetPostEvent event, Emitter<PostState> emit) async {
    emit(LoadingPostState());
    try {
      final posts = await _repository.getPosts();
      emit(FetchedPostState(posts));
    } catch (e) {
      emit(FailurePostState(e.toString()));
    }
  }
}
