import 'dart:math';

import 'package:bloc_api/Bloc/get/cubit/get_about_cubit.dart';
import 'package:bloc_api/Data/about.dart';
import 'package:bloc_api/View/addNewAbout.dart';
import 'package:bloc_api/View/editAbout.dart';
import 'package:bloc_api/View/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// 
class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
     BlocProvider.of<GetAboutCubit>(context).getAbout();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Bloc State Management",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(const profileView());
              },
              icon: const Icon(Icons.person_2))
        ],
      ),
      body: BlocBuilder<GetAboutCubit, GetAboutState>(
        builder: (context, state) {
          if (state is GetAboutSuccess) {
            List<About> aboutdata = state.about;
            return ListView.builder(
                itemCount: aboutdata.length,
                itemBuilder: (BuildContext context, position) {
                  return list(aboutdata[position],context);
                });
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
              backgroundColor: Colors.yellow,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var result = await Get.to(() => const addNewAbout());
            if (result != null && result == 'success') {
              // ignore: use_build_context_synchronously
              BlocProvider.of<GetAboutCubit>(context).getAbout();
            }
          }),
    );
  }

  Card list(About aboutdata,BuildContext context) {
    return Card(
      child: Slidable(
        startActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            // An action can be bigger than the others.
            onPressed: (_) async{
               var result = await Get.to(() =>   editAbout(about: aboutdata));
            if (result != null && result == 'success') {
              // ignore: use_build_context_synchronously
              BlocProvider.of<GetAboutCubit>(context).getAbout();
            }
            },
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ]),
        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (_) {
              context.read<GetAboutCubit>().delete(aboutdata.id);
            },
            backgroundColor: Color.fromARGB(255, 207, 3, 3),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Delete',
          ),
        ]),
        child: ListTile(
          title: Text(aboutdata.name),
          subtitle: Text(aboutdata.address),
          trailing: Text("${aboutdata.phone}"),
        ),
      ),
    );
  }
}
