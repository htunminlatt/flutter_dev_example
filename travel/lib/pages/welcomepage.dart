import 'package:flutter/material.dart';
import 'package:travel/textdesign/welcomeText.dart';

class welcomepage extends StatefulWidget {
  const welcomepage({super.key});

  @override
  State<welcomepage> createState() => _welcomepageState();
}

class _welcomepageState extends State<welcomepage> {
  List img = [
    "image2.jpeg",
    "image1.jpeg",
    "image3.jpeg",
  ];

  String mountainText =
      "Mountain hikes give you an incredible sense of freedom along with endurence tests.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: img.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      // ignore: prefer_interpolation_to_compose_strings
                      image: AssetImage("images/" + img[index]),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trips",
                          style: appStyle(35, Colors.black, FontWeight.bold),
                        ),
                        Text(
                          "Mountain",
                          style: appStyle(38, Colors.black, FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 100,
                            child: Text(
                              mountainText,
                              style: appStyle(
                                  17,
                                  const Color.fromARGB(255, 65, 63, 63),
                                  FontWeight.normal),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: 120,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(elevation: 2),
                              onPressed: () {},
                              child: const Icon(Icons.travel_explore),
                            ))
                      ],
                    ),
                    Column(
                      children: List.generate(3, (dots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          width: 10,
                          height: index == dots ? 40 : 17,
                          decoration: BoxDecoration(
                              color: index == dots
                                  ? Colors.black
                                  : const Color.fromARGB(255, 246, 195, 43),
                              borderRadius: BorderRadius.circular(8)),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
