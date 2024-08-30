import 'package:flutter/material.dart';

void main() {
  runApp(const CustomScrollSliver());
}
class CustomScrollSliver extends StatelessWidget {
  const CustomScrollSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: SafeArea(child: 
        CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 20,
                (context, index){
              return Column(
                children: [
                  Image.network(
                          'https://images.unsplash.com/photo-1699694927472-46a4fcf68973?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw1NDA2MjN8fGVufDB8fHx8fA%3D%3D',
                          height: 300,fit: BoxFit.fill,width: double.infinity,
                        ),
                        const SizedBox(height: 20,)
                ],
              );
            }
            ),),
            SliverGrid(delegate: SliverChildBuilderDelegate(childCount: 20,(context, index) {
             return Image.network(
                          'https://images.unsplash.com/photo-1699694927472-46a4fcf68973?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw1NDA2MjN8fGVufDB8fHx8fA%3D%3D',
                          fit: BoxFit.fitHeight,
                        );
            }), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          mainAxisExtent: 200))
          ],
        
        )
        ),
      ),
    );
  }
}