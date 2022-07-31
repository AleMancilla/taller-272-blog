import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  final TextEditingController controllerLevel;
  final List<String> listItems;
  final String defaultText;

  const DropDownList({
    Key? key,
    required this.controllerLevel,
    required this.listItems,
    required this.defaultText,
  }) : super(key: key);
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String? _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: DropdownButton<String>(
        value: _chosenValue,
        //elevation: 5,
        style: const TextStyle(color: Colors.black),

        items: widget.listItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Text(
          widget.defaultText,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        onChanged: (String? value) {
          setState(() {
            _chosenValue = value;
            widget.controllerLevel.text = value!;
          });
        },
      ),
    );
  }
}
