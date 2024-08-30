
import 'package:flutter/material.dart';
import 'package:travel/textdesign/welcomeText.dart';

class folderPage extends StatefulWidget {
  final String foldername;
  const folderPage({required this.foldername, super.key});

  @override
  State<folderPage> createState() => _folderPageState();
}

class _folderPageState extends State<folderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            height: 170,
            color: const Color.fromARGB(255, 244, 248, 251),
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Chat Box",
                        style: appStyle(30, const Color.fromARGB(255, 3, 3, 3),
                            FontWeight.bold),
                      ),
                      Text(
                        "Projects",
                        style: appStyle(
                            20,
                            const Color.fromARGB(255, 27, 27, 27),
                            FontWeight.normal),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search),
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notification_add),
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 130,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                profileList(),
                profileList(),
                profileList(),
                profileList(),
                profileList()
              ],
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.3),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Files",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      "Create New",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                list(false),
                list(true),
                list(true),
                list(false),
                list(false),
                list(true),
                list(false),
                list(true),
                list(false),
                list(false),
              ],
            ),
          )
        ], //child
      ),
    );
  }

  Container list(bool shwoAlert) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 8,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 70,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 21, 23, 21).withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          
          ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Stack(
              children: [
                const Icon(Icons.folder,size: 35,color: Colors.blue,),
                if(shwoAlert)
                Positioned(
                  right: 1,
                  top: 2,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 5,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(width: 10,),
            const Text(
              "Assets",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded))
      ]),
    );
  }

  Widget profileList() {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: Image.asset("images/image2.jpeg").image,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("Davis")
        ],
      ),
    );
  }
}
