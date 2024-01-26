import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Function/data_local.dart';

class ShowDialog extends StatefulWidget {
  final String title;
  final String hint;

  const ShowDialog({
    Key? key,
    required this.title,
    required this.hint,
  }) : super(key: key);

  @override
  State<ShowDialog> createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _controller,
        decoration: InputDecoration(hintText: widget.hint),
      ),
      actions: [
        TextButton(
          child: const Text("CANCEL"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text("OK"),
          onPressed: () async {
            await updatePreferences(widget.hint, _controller.text);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
