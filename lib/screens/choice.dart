import 'package:flutter/material.dart';

class Choices extends StatefulWidget {
  final String d;
  final bool chek2;
  final Function onSelect;
  Choices(this.d, {@required this.onSelect,this.chek2});
  @override
  _ChoicesState createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  // bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return _choice(widget.d);
  }

  Widget _choice(String d) {
    return RawChip(
      label: Text(d),
      selectedColor: Colors.blue,
      selected: widget.chek2,
      onSelected: widget.onSelect,
    );
  }
}
