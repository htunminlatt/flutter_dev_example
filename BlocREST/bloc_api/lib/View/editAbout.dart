import 'package:bloc_api/Bloc/post/cubit/post_about_cubit.dart';
import 'package:bloc_api/Bloc/put/cubit/edit_about_cubit.dart';
import 'package:bloc_api/Data/about.dart';
import 'package:bloc_api/Model/modules.dart';
import 'package:bloc_api/View/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class editAbout extends StatelessWidget {
  final About about;
  const editAbout({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditAboutCubit>(
      create: (context) => EditAboutCubit(getIt.call()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        body: BlocBuilder<EditAboutCubit, EditAboutState>(
          builder: (context, state) {
            if (state is EditAboutLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is EditAboutSuccess) {
              return Center(
                child: Column(
                  children: [
                    const Text("success"),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.back(result: 'success');
                        },
                        child: const Text('back'))
                  ],
                ),
              );
            } else if (state is EditAboutFail) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Fail!'),
                  action: SnackBarAction(
                      label: "Ok",
                      onPressed: () {
                        Get.to(() => const HomePage());
                      }),
                ),
              );
            }
            return ContactForm(
              about: about,
            );
          },
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  final About about;

  const ContactForm({required this.about});
  @override
  State<ContactForm> createState() => _ContactFormState(about);
}

class _ContactFormState extends State<ContactForm> {
  final About about;
  _ContactFormState(this.about);

  final _formKey = GlobalKey<FormState>();
  String? name, job, address;
  int? age, phone;
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
              initialValue: about.name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Name"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Name';
                }
                return null;
              },
              onSaved: (value) {
                name = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: "${about.age}",
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Age"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Age';
                }
                return null;
              },
              onSaved: (value) {
                age = int.parse(value!);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: "${about.phone}",
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Phone"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Phone';
                }
                return null;
              },
              onSaved: (value) {
                phone = int.parse(value!);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: about.job,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Job"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Job';
                }
                return null;
              },
              onSaved: (value) {
                job = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              initialValue: about.address,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter Address"),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Address';
                }
                return null;
              },
              onSaved: (value) {
                address = value;
              },
            ),
             const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState?.save();
                  About data =
                      About(name!, address!, job!, age!, phone!, about.id);
                  context.read<EditAboutCubit>().updateAbout(about.id, data);
                }
              },
              child: Text("Save"),
            )
          ],
        ));
  }
}
