import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundTip extends StatefulWidget {
   RoundTip({
    super.key,
  });
  bool roundTip = false;
  @override
  State<RoundTip> createState() => _RoundTipState();
}

class _RoundTipState extends State<RoundTip> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Round Tip Up?',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        Switch(value: widget.roundTip, onChanged: (value) { 
          setState(() {
            widget.roundTip = value;
          });
         },),
      ],
    );
  }
}
