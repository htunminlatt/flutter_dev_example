import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_tutorial/firebase_options.dart';
import 'package:firebase_tutorial/firebasemessaging.dart';
import 'package:firebase_tutorial/warpwidget.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   await FireBaseApi().initNoti();
  runApp(const NavigationDrawerExe());
}

class NavigationDrawerExe extends StatefulWidget {
  const NavigationDrawerExe({super.key});

  @override
  State<NavigationDrawerExe> createState() => _NavigationDrawerExeState();
}

class _NavigationDrawerExeState extends State<NavigationDrawerExe> {
  @override
  bool isselected = true;

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          drawer: Builder(builder: (context) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  //header..
                  const DrawerHeader(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              "Header",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            trailing: Icon(Icons.arrow_forward_ios_rounded),
                            leading: Icon(Icons.person_off_outlined),
                            title: Text('Account'),
                          )
                        ],
                      )),
                  ListTile(
                    leading: const Icon(Icons.message),
                    title: const Text('message'),
                    onTap: (() => Navigator.of(context).pop()),
                  ),
                  const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('setting'),
                  )
                ],
              ),
            );
          }),
          body:  SafeArea(
              child: Center(
            child: InputForm(context: context,),
            // child: Builder(builder: (context) {
            //   return ElevatedButton(
            //       onPressed: () {
            //         // Scaffold.of(context).openDrawer();
            //         // showModalBottomSheet(context: context, builder: (builder){
            //         //   return const Center(child: Text('this.is.bottom sheet.'));
            //         // });
            //         //showbottomsheet(context);

            //         //delete push screen
            //         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const WarpWidget(), ),(route) => false);
            //       },
            //       child: Text('open drawer.'));
            // }),
          )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Builder(builder: (context) {
            return FloatingActionButton(
              tooltip: 'show',
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () {
                showbottomsheet(context);
              },
              child: const Icon(Icons.add),
            );
          }),
          bottomNavigationBar: BottomAppBar(
              height: 50,
              color: const Color.fromRGBO(82, 170, 94, 1.0),
              shape: const CircularNotchedRectangle(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isselected = !isselected;
                        });
                      },
                      icon: Icon(Icons.home,
                          color: isselected ? Colors.blue : Colors.grey)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isselected = !isselected;
                        });
                      },
                      icon: Icon(Icons.favorite,
                          color: isselected ? Colors.blue : Colors.grey))
                ],
              ))),
    );
  }
}

void showbottomsheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (builder) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: ListView.builder(
              itemCount: 80,
              itemBuilder: ((context, index) => const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text('data'),
                      ],
                    ),
                  ))),
        );
      });
}

class InputForm extends StatefulWidget {
   InputForm({super.key,this.context});

  BuildContext? context;
  @override
  State<InputForm> createState() => _InputFormState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           TextField(
            controller: email,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Email',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
           TextField(
            controller: password,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Passworf',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  try {
                  registerWithEmailAndPassword(email.text, password.text);
                  }catch (e){
                    print(e.toString());
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Add New User',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => WarpWidget()));

          }, child: Text('check user....'))
        ],
      ),
    );
  }
}

Future<void> registerWithEmailAndPassword(String email, String password) async {
  try {
   await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password
  );
} on FirebaseAuthException catch (e) {
  print(e.code.toString());
}
}
