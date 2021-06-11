import 'dart:async';

import 'package:counter_test/model/Posts.dart';
import 'package:counter_test/api/api_provider.dart';

class PostBloc {
  List<Posts> response;
  final _postStateController = StreamController<List<Posts>>();
  // ignore: unused_element
  StreamSink<List<Posts>> get _inPosts => _postStateController.sink;
  Stream<List<Posts>> get posts => _postStateController.stream;
  final _postEventController = StreamController<List<Posts>>();
  Sink<List<Posts>> get counterEventSink => _postEventController.sink;

  PostBloc() {
    //_postEventController.stream.listen(getPosts);
  }

  Future<List<Posts>> getPosts() async {
    print("i am in bloc post");
    API_Provider apiProv = new API_Provider();
    List<Posts> postsLisst;
    await apiProv.getPost().then((value) {
      print("&&&&&&&&&");
      print(value.length);
      postsLisst = value;
    });
    return postsLisst;
  }

  void dispose() {
    _postStateController.close();
    _postEventController.close();
  }
}
