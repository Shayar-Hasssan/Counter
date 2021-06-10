import 'dart:convert';

import 'package:counter_test/Posts.dart';
import 'package:http/http.dart';

class API_Provider {
  // String baseUrl = 'https://slark-backend.herokuapp.com/';

  Future<List<Posts>> getPost() async {
    print("i am in api get post");
    var request = await get('https://jsonplaceholder.typicode.com/posts');
    var response = postsFromJson(request.body);
    print("*********");
    print(response.length);
    return response;
  }
}
