import 'package:flutter/material.dart';

class gestured extends StatelessWidget {
  final String txt;
  final String path;
  final void Function() tab;
  const gestured({
    super.key,
    required this.txt,
    required this.path,
    required this.tab,
  });

  @override
  Widget build(BuildContext context) {
    var mwd = MediaQuery.of(context).size.width;
    var mhd = MediaQuery.of(context).size.height;
    return Flexible(
      flex: 1,
      child: GestureDetector(
          onTap: tab,
          child: Container(
            alignment: Alignment.center,
            height: 150,
            margin: EdgeInsets.all(mwd * 0.0265),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Color.fromARGB(255, 244, 239, 239),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  txt,
                  style: TextStyle(
                      color: Color.fromARGB(188, 0, 0, 0),
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                Image.asset(
                  path,
                  height: mhd * 0.12,
                  width: mwd * 0.9,
                ),
              ],
            ),
          )),
    );
  }
}
