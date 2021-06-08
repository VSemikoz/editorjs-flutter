import 'package:editorjs_flutter/editorjs_flutter.dart';
import 'package:flutter/material.dart';

import 'createnote.dart';
// import 'package:demo/createnote.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late EditorJSView editorJSView;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> fetchTestData() async {
    try {
      String data = await DefaultAssetBundle.of(context).loadString("test_data/editorjsdatatest.json");
      String styles = await DefaultAssetBundle.of(context).loadString("test_data/editorjsstyles.json");

      setState(() {
        editorJSView = EditorJSView(editorJSData: data, styles: styles);
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  void _showEditor() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) => CreateNoteLayout()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<bool>(
              future: fetchTestData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(1);
                  print(snapshot.data);
                  return snapshot.data! ? editorJSView : Container();
                }
                print(2);
                return Container();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showEditor,
        tooltip: 'Create content',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
