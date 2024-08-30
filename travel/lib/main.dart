import 'package:flutter/material.dart';
import 'package:travel/pages/desighpage.dart';
import 'package:travel/pages/folderpage.dart';
import 'package:travel/pages/homepage.dart';
import 'package:travel/pages/loginpage.dart';
import 'package:travel/pages/profile.dart';
import 'package:travel/pages/welcomepage.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Profile()
    );
  }
}

