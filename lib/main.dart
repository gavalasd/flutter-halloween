import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _c = 0;
  List<bool> visible = [true, false, false, false, 
                        true, false, false, false, 
                        false, true, false, true, 
                        false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score: $_c"),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Table(
          children: <TableRow> [
          TableRow(children: [buildTile(0), buildTile(1), buildTile(2), buildTile(3)]),
          TableRow(children: [buildTile(4), buildTile(5), buildTile(6), buildTile(7)]),
          TableRow(children: [buildTile(8), buildTile(9), buildTile(10), buildTile(11)]),
          TableRow(children: [buildTile(12), buildTile(13), buildTile(14), buildTile(15)])
          ]
        )
      )
    );
  }

  final image = "assets/images/BAT.jpg";
  
  Widget buildTile(int i) {
    return GestureDetector(
      onTap: () {
        click(i);
      },
      child: Card(
          child: Visibility(
            visible: visible[i], 
            child: SizedBox(
              child: Image(
                image: AssetImage(image)
              )
            )
          )
      )
    );
  }

  void click(int i) {
  setState(() {
    if (visible[i]) {
      _c++;
      for (int i = 0; i < 16; i++) {
        int r = 1 + Random().nextInt(2);
        if (i % r == 0) {
          visible[i] = !visible[i];
        }
      }
      visible[i] = false;
    }
  });
}
}
