import 'package:flutter/material.dart';
import 'package:flutter_john/flutter_john.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FlutterJohn.scaffold(
        string: widget.title,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlutterJohn.text(
                string: "Welcome to home",
                color: Colors.lightBlue,
                size: 20,
                align: TextAlign.center),
            ElevatedButton(
                onPressed: () {
                  FlutterJohn.alert(context: context, text: "Salut les amis");
                },
                child: FlutterJohn.text(string: "Pressing")),
          ],
        )));
  }
}
