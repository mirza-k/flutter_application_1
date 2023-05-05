import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  List<String> list;
  DropdownButtonExample({super.key, required this.list});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

// const List<String> list = <String>['Premier Liga', 'Druga Liga'];

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  late var dropdownValue = widget.list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black, fontSize: 18.0),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
