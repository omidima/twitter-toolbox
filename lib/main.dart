import 'package:flutter/material.dart';
import 'package:twitter_tools/logger.dart';
import 'package:twitter_tools/presenter/screen/MainScreen.dart';
void main() {
  Logger.setDebugMode = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitter ToolBox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}