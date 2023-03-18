import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RadioList extends StatefulWidget {
   RadioList({super.key, required this.label,required this.value, required this.variable});
   String label;
   String value;
   String variable;
  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: widget.value, 
      groupValue: widget.variable,
      title: Text('${widget.label} (${widget.value}%)'),
      onChanged: (value) {
        setState(() {
        widget.variable = value.toString();
        });
      }
    );
  }
}