import 'package:flutter/material.dart';

void main() {
  runApp(const DialogExe());
}

class DialogExe extends StatelessWidget {
  const DialogExe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: Center(
          child: Builder(builder: (context) {
            return ElevatedButton(
                onPressed: () {
                  showcustomDialog(context);
                },
                child: const Text('show dialog'));
          }),
        )),
      ),
    );
  }

  void showcustomDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (builder) {
          return Dialog(
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Hello Welcome Welcome',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                  Image.network(
                    'https://images.unsplash.com/photo-1699694927472-46a4fcf68973?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw1NDA2MjN8fGVufDB8fHx8fA%3D%3D',
                    fit: BoxFit.fitHeight,
                  ),
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text('close'))
                ],
              ),
            ),
          );
        });
  }
}

void showAlertDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text('Hello'),
          title: const Text('Welcome.....'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Open'))
              ],
            )
          ],
        );
      });
}
