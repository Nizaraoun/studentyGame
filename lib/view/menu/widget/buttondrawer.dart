import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustombuttonDrawer extends StatelessWidget {
  final IconData icon;
  final Function()? ontab;
  final String text;
  const CustombuttonDrawer(
      {super.key, required this.icon, required this.text, this.ontab});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: Get.width / 1.5,
        height: Get.height / 13,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 10), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: Color.fromRGBO(255, 255, 255, 0.826),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Icon(
                icon,
                color: Colors.black,
                size: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
