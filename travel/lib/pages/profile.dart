import 'package:flutter/material.dart';
import 'package:travel/textdesign/welcomeText.dart';

class Profile extends StatelessWidget {
   const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Stack(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              alignment: Alignment.center,
              color: Colors.lightBlue,
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/men/44.jpg"),
                radius: 60,
              ),
              
            ),
            Positioned(
                top: 50,
                right: 20,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                  color: Colors.white,
                )
                
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 280),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Mg Mg",style: appStyle(20, Colors.white, FontWeight.bold),),
                      const SizedBox(height: 10,),
                      const Text("Yangon, Myanmar")
                    ],
                  ),
                ),
              ),
          
          Positioned(
            top: 360,
            left: 20,
            right: 20,
            height: 100,
            child: Card(
              elevation: 2.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    const Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 20)),
                        Text("Photo"),
                        SizedBox(height: 10,),
                        Text("200",style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    Container(height: 50,width: 0.7,color: Colors.grey,),
                    const Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 20)),
                        Text("Follwers"),
                        SizedBox(height: 10,),
                        Text("200",style: TextStyle(fontSize: 20),)
                      ],
                    ),
                    Container(height: 50,width: 0.7,color: Colors.grey,),
                    const Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 20)),
                        Text("Following"),
                        SizedBox(height: 10,),
                        Text("200",style: TextStyle(fontSize: 20),)
                      ],
                    )
                ],
              ),
            ),
          ),
          
          ],
          
        ),
        
        

      ),
    );
  }
}
