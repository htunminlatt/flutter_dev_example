import 'package:bloc_api/Bloc/post/cubit/post_about_cubit.dart';
import 'package:bloc_api/Data/about.dart';
import 'package:bloc_api/Data/respsitory.dart';
import 'package:bloc_api/Model/modules.dart';
import 'package:bloc_api/View/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class addNewAbout extends StatelessWidget {
  const addNewAbout({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostAboutCubit>(
      create: (context) => PostAboutCubit(getIt.call()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        body: BlocBuilder<PostAboutCubit, PostAboutState>(
          builder: (context, state) {
            if (state is PostAboutDataloading){
              return const Center(child: CircularProgressIndicator());
            }else if (state is PostAboutDataSuccess){
             return Center(
              child: Column(
                children: [
                  const Text("success"),
                  const SizedBox(height: 20,),
                  TextButton(onPressed: (){
                    Get.back(result: 'success');
                  }, child: const Text('back'))
                ],
              ),
             );
            }else if (state is PostAboutDataFail) {
               ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Fail!'),
                action: SnackBarAction(label: "Ok", onPressed: (){
                  Get.to(()=>const HomePage());
                }),
              ),
            );
            }
            return ContactForm();
          },
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String? name,job,address;
  int? age,phone;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Name"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Name';
                }
                return null;
              },
              onSaved: (value){
                name = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Age"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Age';
                }
                return null;
              },
              onSaved: (value){
                age = int.parse(value!);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Phone"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Phone';
                }
                return null;
              },
              onSaved: (value){
                phone = int.parse(value!);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Job"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Job';
                }
                return null;
              },
               onSaved: (value){
                job = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Address"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Address';
                }
                return null;
              },
               onSaved: (value){
                address = value;
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              if (_formKey.currentState!.validate()){
                _formKey.currentState?.save();
                About data = About(name!, address!, job!, age!, phone!,'');
               context.read<PostAboutCubit>().addPostSuccess(data);
              }
            }, child: Text("Save"),)
          ],
        ));
  }
}
