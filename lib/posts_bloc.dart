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
    _postEventController.stream.listen(getPosts);
  }

  // Future<List<Posts>> getPosts() async {
  List<Posts> getPosts(posts) {
    API_Provider apiProv;
    apiProv.getPost().then((value) {
      return value;
    });
    return response;
    // _inPosts.add(value)
  }

  void dispose() {
    _postStateController.close();
    _postEventController.close();
  }
}
