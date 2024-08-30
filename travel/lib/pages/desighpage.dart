import 'package:flutter/material.dart';
import 'package:travel/pages/folderpage.dart';
import 'package:travel/textdesign/welcomeText.dart';

double screenWidth = 0;

class designPage extends StatefulWidget {
  const designPage({super.key});

  @override
  State<designPage> createState() => _designPageState();
}

class _designPageState extends State<designPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            height: 170,
            color: Colors.blue,
            alignment: Alignment.bottomCenter,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Roitters",
                        style: appStyle(30, Colors.white, FontWeight.bold),
                      ),
                      Text(
                        "Team folder",
                        style: appStyle(20, Colors.white, FontWeight.normal),
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
                          color: Colors.white,
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
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ]),
          ),
          const Row(
            children: [],
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: const TextSpan(
                        text: "Stroage",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                        children: [
                      TextSpan(
                          text: "9.0/10 GB",
                          style: TextStyle(color: Colors.grey))
                    ])),
                const Text(
                  "Upgrade",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              children: [
                chartSize("SUCCESS", Colors.blue, .25),
                const SizedBox(
                  width: 5,
                ),
                chartSize("DOCS", Colors.red, .25),
                const SizedBox(
                  width: 5,
                ),
                chartSize("IMAGES", Colors.yellow, .20),
                const SizedBox(
                  width: 5,
                ),
                chartSize("SUCCESS", Colors.grey, .23),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(25),
              children: [
                const Text(
                  "Recently Updated",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [diamond(), diamond(), diamond()],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Projects",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Create Now",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                project("ChatBox"),
                project("Projects"),
                project("Jobs"),
                project("Work"),
                project("Engineering"),
              ],
            ),
          )
        ],
      ),
      
      bottomNavigationBar: BottomAppBar(

        height: 50,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.home,)),
          IconButton(onPressed: (){
            print("helo");
            const Icon(Icons.people);
          }, icon: const Icon(Icons.settings,color: Colors.red,)),
        ]),
          ),


        floatingActionButton: FloatingActionButton(onPressed: (){},
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: const Icon(Icons.add,color: Colors.white,),),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,

    );
  }

  Widget  project(String folderName) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => folderPage(foldername: folderName),
    ),);

      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.only(left: 25, right: 25),
        height: 100,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              const Icon(
                Icons.folder,
                color: Colors.blue,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                  folderName,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ]),
      ),
    );
  }

  Column diamond() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(38),
          height: 110,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10)),
          child: Image.asset("images/diamond.png"),
        ),
        const SizedBox(
          height: 5,
        ),
        const Row(
          children: [
            Text("desktop"),
            SizedBox(
              width: 5,
            ),
            Text(
              "data",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            )
          ],
        ),
      ],
    );
  }

  Column chartSize(String string, Color color, widthPercent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: screenWidth * widthPercent,
          height: 4,
          color: color,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          string,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
