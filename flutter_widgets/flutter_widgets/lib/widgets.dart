import 'package:flutter/material.dart';

enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud(
    'Cloud',
    Icons.cloud_outlined,
  ),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}

// ignore: must_be_immutable
class WidgetScreen extends StatelessWidget {
  WidgetScreen({super.key});

  List<String> list = ['one', 'two', 'three', 'four', 'five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: InputDecorator(
          expands: true,
          isEmpty: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.red))),
          child: DropdownMenu(
            width: double.infinity,
            menuStyle: MenuStyle(
              backgroundColor: WidgetStateProperty.all(Colors.green),
            ),
            enableFilter: true,
            enableSearch: true,
            hintText: 'Select text',
            inputDecorationTheme: InputDecorationTheme(
                isDense: true,
                isCollapsed: true,
                filled: true,
                enabledBorder: InputBorder.none,
                fillColor: Colors.red,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                outlineBorder: const BorderSide(color: Colors.yellow),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.red)),
                activeIndicatorBorder:
                    const BorderSide(color: Colors.transparent)),
            textStyle: const TextStyle(color: Colors.black),
            requestFocusOnTap: true,
            dropdownMenuEntries: list.map<DropdownMenuEntry>(
              (e) {
                return DropdownMenuEntry(label: e, value: e);
              },
            ).toList(),
            onSelected: (value) {
              print(value);
            },
          ),
        ),
      ),
    );
  }
}
