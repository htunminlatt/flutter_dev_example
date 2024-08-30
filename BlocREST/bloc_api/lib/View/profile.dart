import 'package:bloc_api/Bloc/get/cubit/get_about_cubit.dart';
import 'package:bloc_api/Data/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class profileView extends StatelessWidget {
  const profileView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetAboutCubit>(context).getProfile();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber),
      body: BlocBuilder<GetAboutCubit, GetAboutState>(
          builder: (BuildContext context, state) {
        if (state is getProfileSuccss) {
          List<Profile> data = state.profileData;
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, position) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[position].avatar),
                    ),
                  title: Text(data[position].name.capitalizeFirst.toString()),
                  subtitle: Text(data[position].address),
                  trailing: Text(data[position].job),
                );
              });
        }

        return const Center(
            child: CircularProgressIndicator(
          color: Colors.yellow,
          backgroundColor: Colors.black,
        ));
      }),
    );
  }
}
