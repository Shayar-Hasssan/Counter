import 'package:counter_test/counter_bloc.dart';
import 'package:counter_test/counter_event.dart';
import 'package:counter_test/posts_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(
        title: 'Counter',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = CounterBloc();
  final _postBloc = PostBloc();
  var posts;
  int mycounter = 0;
  String textt = 'Here you will get the Post you requested';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.counterr,
          initialData: mycounter,
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text('$textt'),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            //TODO
            onPressed: () async {
              await _bloc.increment(mycounter).then((value) => {
                    setState(() {
                      mycounter = value;
                    }),
                    print('$value')
                  });

              await _postBloc.getPosts().then((value) {
                setState(() {
                  textt = value.first.body;
                });
              });

              // });
            },

            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10.0,
          ),
          // FloatingActionButton(
          //   onPressed: () =>
          //       _bloc.decrement(counter).then((value) => {Text('$value')}),
          //   tooltip: 'Decrement',
          //   child: Icon(Icons.remove),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
