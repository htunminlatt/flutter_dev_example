import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WarpWidget extends StatelessWidget {
  const WarpWidget({super.key});

  @override
  Widget build(BuildContext context) {
   final user = FirebaseAuth.instance.currentUser;

    return  Scaffold(
     
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(Icons.chevron_left)),
          ),
        body: SafeArea(
          child: Center(child: Text(user!.email ?? '')),
        //     child: Wrap(
        //       alignment: WrapAlignment.center,
        //       //horizontal spacing
        //       spacing: 20,
        //       //cross axis spacing
        //       runSpacing: 16,
        //       // direction: Axis.vertical,
        //   children: [
        //     // Chip(label: Text('first')),
        //     // Chip(label: Text('first')),
        //     // Chip(label: Text('first')),
        //     // Chip(label: Text('first')),
        //     // Chip(label: Text('first')),
        //     // Chip(label: Text('first')),
        //     // Chip(label: Text('first')),
        //     // Chip(label: Text('first')),
        //     // Chip(label: Text('first')),
        //     // Chip(label: Text('first')),
        //     // Chip(label: Text('first')),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.black,
        //       child: Text(user!.displayName ?? ''),
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.black,
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.black,
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.black,
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.black,
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.black,
        //     )

        //   ],
        // )),
      ),
      
    );
  }
}
