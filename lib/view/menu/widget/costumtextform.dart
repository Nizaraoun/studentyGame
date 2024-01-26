import 'package:flutter/material.dart';

class Customtextform extends StatelessWidget {
  final TextEditingController? Controller;
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final String label;
  Customtextform({super.key, this.Controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formstate,
        child: TextFormField(
            textDirection: TextDirection.rtl,
            validator: (value) {
              if (value!.isEmpty) {
                return 'this field is required';
              }
            },
            controller: Controller,
            decoration: InputDecoration(
              labelText: label,
              fillColor: const Color.fromRGBO(0, 0, 0, 0.178),
              filled: true,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            )));
  }
}
