import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon1;
  final IconData icon2;
  final Function()? Ontap;
  final String? text;
  final Color? color;
  final double? size;

  const ProfileWidget({
    super.key,
    required this.icon1,
    this.text,
    this.size,
    required this.icon2,
    this.Ontap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Ontap,
      child: Container(
        height: Get.height / 12,
        margin: EdgeInsets.only(
          top: Get.height / 50,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  size: Get.width / 14,
                  icon1,
                  color: color,
                ),
                SizedBox(
                  width: Get.width / 20,
                ),
                Text(
                  text!,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Icon(
                  size: Get.width / 15,
                  Icons.arrow_forward_sharp,
                  color: color,
                )
              ],
            ),
            Divider(
              height: Get.height / 50,
              thickness: 1,
              color: Color.fromARGB(255, 228, 223, 223),
            ),
          ],
        ),
      ),
    );
  }
}
