import 'package:flutter/material.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200),
        child: CarouselView(
          padding: EdgeInsets.symmetric(horizontal: 20),
             itemExtent: MediaQuery.of(context).size.width,
            shrinkExtent: 300,
            itemSnapping: true,
            onTap: (value) {
              print(value);
            },
            children: List.generate(3, (int index) {
              return Image.network(
                'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
                fit: BoxFit.cover,
              );
            })),
      ),
    );
  }
}
