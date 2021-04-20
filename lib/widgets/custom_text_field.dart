import 'package:flutter/material.dart';

class CustomTextFields extends StatefulWidget {
  final icon;
  final hint;

  TextEditingController password = new TextEditingController();
  CustomTextFields({@required this.icon,@required this.hint,@required this.password});

  @override
  _CustomTextFieldsState createState() => _CustomTextFieldsState();
}

class _CustomTextFieldsState extends State<CustomTextFields> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value)
      {
      },
      controller: widget.password,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: Icon(
          widget.icon,
          color: Colors.deepPurple,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: Colors.white
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: Colors.deepPurple
            )
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
                color: Colors.white
            )
        ),
      ),
    );
  }
}
