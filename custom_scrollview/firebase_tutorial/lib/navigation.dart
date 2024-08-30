import 'package:flutter/material.dart';

void main() {
  runApp(const TestNavigation());
}

class TestNavigation extends StatefulWidget {
  const TestNavigation({super.key});

  @override
  State<TestNavigation> createState() => _TestNavigationState();
}

var index = 0;
//this is for pages... in production
var widgetsToshow = [
  const Center(child: Text('Home')),
  const Center(child: Text('Trending')),
  const Center(child: Text('Setting')),
  const Center(child: Text('ရှာဖွေ'))
];

class _TestNavigationState extends State<TestNavigation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:  SafeArea(
            child: Center(
          child: widgetsToshow[index],
        )),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (tabIndex) {
              setState(() {
                index = tabIndex;
              });
            },
            currentIndex: index,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.trending_up), label: 'Trending'),
              
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'ရှာဖွေ'),
            ]),
      ),
    );
  }
}
