
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_app_provider/model/res_posts.dart';
import 'package:http/http.dart';

class PostProvider extends ChangeNotifier {
  List<ResPosts> listPost = [];
  bool loading = false;

  PostProvider();

  PostProvider.initPost() {
    getPosts();
  }

  // mendapatkan postingan / artikel dari blog
  Future<void> getPosts() async {
    loading = true;
    notifyListeners(); // untuk memberitahu jika ada perubahan data didalam PostProvider

    var url = "https://jsonplaceholder.typicode.com/posts";
    Response response = await http.get(url);

    listPost = resPostsFromJson(response.body);
    loading = false;
    notifyListeners(); // untuk memberitahu jika ada perubahan data didalam PostProvider
  }
}