import 'package:flutter/material.dart';

void main() {
  runApp(const Container_Widgets());
}

class Container_Widgets extends StatelessWidget {
  const Container_Widgets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.red,
                  width: double.infinity,
                  height: 200,
                  child: Center(child: Text('hello')),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.green,child: Text('first'))),
                          SizedBox(width: 10,),
                      Expanded(
                        flex: 1,
                        child: Container(color: Colors.yellow,child: Text('second')))
                    ],
                  ),
                ),

                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(child: Container(color: Colors.yellow,)),
                      Positioned(top: 300,child: Text("One"),),
                      Align(alignment: Alignment.topRight,child: Text("Two"),),
                      Align(alignment: Alignment.bottomLeft,child: Text("Three"),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}