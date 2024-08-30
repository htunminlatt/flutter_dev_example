import 'package:bloc_api/Bloc/get/cubit/get_about_cubit.dart';
import 'package:bloc_api/Model/modules.dart';
import 'package:bloc_api/View/Homepage.dart';
import 'package:bloc_api/View/testing.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


// void main() {
//    Locator();
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<GetAboutCubit>(
        create: (context) => getIt.call(),
        child: GetMaterialApp(home: Testing(),),
      ),
    );
  }
}




class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final Function(String) onChanged;

  CustomDropdown({required this.items, required this.onChanged});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Select an item'),
              content: Container(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(widget.items[index]),
                      onTap: () {
                        setState(() {
                          selectedItem = widget.items[index];
                          widget.onChanged(selectedItem);
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            );
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(selectedItem.isEmpty ? 'Select an item' : selectedItem),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}

// Example usage:
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Custom Dropdown Example')),
      body: Center(
        child: CustomDropdown(
          items: ['Item 1', 'Item 2', 'Item 3', 'Item 4'],
          onChanged: (value) {
            print('Selected item: $value');
          },
        ),
      ),
    ),
  ));
}