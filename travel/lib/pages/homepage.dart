import 'package:flutter/material.dart';
import 'package:travel/textdesign/welcomeText.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  TextStyle sty = appStyle(20, Colors.black, FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "HomePage",
            style: appStyle(27, Colors.black, FontWeight.bold),
          )),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)
            )
            ),
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "welcome",
                    style: sty,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "welcome",
                    style: sty,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "welcome",
                    style: sty,
                  ),
                ),
              ],
            ),
          ),
        //  const Positioned(
        //     left: 10,
        //     right: 10,
        //     bottom: -100,
        //     height: 100,
        //     child: Card(

        //     elevation: 5.0,
        //   ))
         Positioned(
          child: Container(
            height: 100,
            color: Colors.amber,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  width: 100,
                  color: Colors.red,
                ),
                 Container(
                  width: 100,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          // left: 10,
          // right: 10,
          // height: 200,
          // bottom: -100,
         
        )
        ],
      ),
    );
  }
}
