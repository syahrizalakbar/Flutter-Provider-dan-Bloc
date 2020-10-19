import 'package:flutter_app_provider/bloc_example/bloc/get_post_event.dart';
import 'package:flutter_app_provider/bloc_example/bloc/get_post_state.dart';
import 'package:flutter_app_provider/model/res_posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class GetPostBloc extends Bloc<GetPostEvent, GetPostState> {
  GetPostBloc(GetPostState initialState) : super(initialState);

  @override
  Stream<GetPostState> mapEventToState(GetPostEvent event) async* {
    if (event is EventGetPost) {
      yield GetPostLoading();
      try {
        var url = "https://jsonplaceholder.typicode.com/posts";
        Response response = await http.get(url);
        List<ResPosts> listPost = resPostsFromJson(response.body);
        yield GetPostSuccess(listPost);
      } catch (e) {
        yield GetPostError(e.toString());
      }
    }
  }
}
