import 'dart:async';

import 'package:counter_test/Posts.dart';
import 'package:counter_test/api_provider.dart';
import 'package:counter_test/counter_event.dart';

class PostBloc {
  List<Posts> response;
  final _postStateController = StreamController<List<Posts>>();
  StreamSink<List<Posts>> get _inPosts => _postStateController.sink;
  Stream<List<Posts>> get posts => _postStateController.stream;
  final _postEventController = StreamController<List<Posts>>();
  Sink<List<Posts>> get counterEventSink => _postEventController.sink;

  PostBloc() {
    //TODO
    //_postEventController.stream.listen(getPosts);
  }

  // Future<List<Posts>> getPosts() async {
  // TODO
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
    // _inPosts.add(value)
  }

  void dispose() {
    _postStateController.close();
    _postEventController.close();
  }
}
