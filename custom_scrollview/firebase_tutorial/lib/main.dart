import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_tutorial/firebase_options.dart';
import 'package:firebase_tutorial/firebasemessaging.dart';
import 'package:firebase_tutorial/navigation_drawer.dart';
import 'package:firebase_tutorial/warpwidget.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
     await FireBaseApi().initNoti();

  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Center(
              child: Column(
                        children: [
              const Text(
                'hello welcome...',
                style: TextStyle(color: Colors.black),
              ),
              Builder(builder: (context) {
                return TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('this is snack bar...'),
                        duration: Duration(seconds: 1),
                      ));
                    },
                    child: const Text('this is text button'));
              }),
              const SizedBox( height: 20,),
              
              const CustomDropDownButton(),
              const SizedBox(height: 20,),
              const CustomRadioButton(),
              const SizedBox(height: 20,),
              const CustomCheckBox(),
            const SizedBox(height: 20,),
            Builder(
              builder: (context) {
                return ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NavigationDrawerExe()));
                }, child: const Text('go'));
              }
            )
                        ],
                      ),
            )),
      ),
    );
  }
}

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({super.key});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  var items = ['first item', 'second item', 'third item'];
  var selectItem = '';

  @override
  void initState() {
    // TODO: implement initState
    selectItem = items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      
      alignment: Alignment.center,
      dropdownColor: Colors.red,
      value: selectItem,
        items: items
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item,style: const TextStyle(color: Colors.black),),
                ))
            .toList(),
        onChanged: (item) {
          setState(() {
            selectItem = item ?? '';
          });
          
        });
  }
}

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({super.key});

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
var items = ['first item', 'second item', 'third item'];
  var selectItem = '';

  @override
  void initState() {
    // TODO: implement initState
    selectItem = items[0];
    super.initState();
  }
  
    @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((radio) => Row(
        children: [
          //group value is select item
          Radio(value: radio, groupValue: selectItem, onChanged: (value){
            setState(() {
              selectItem = value ?? '';
            });
          }),
           Text('$radio')
        ],
      )).toList(),
    );
  }
}

//checkbox
class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[ Checkbox(activeColor: Colors.red,value: isChecked, onChanged: (value){
        setState(() {
          isChecked = !isChecked;
        });
      }),
      Text(isChecked ? 'Checked': 'Unchecked'),
      ]
      
    );
  }
}