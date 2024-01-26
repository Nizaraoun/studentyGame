import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Function/data_local.dart';
import '../../../model/usermodel.dart';
import '../../resources/color/color_manager.dart';
import 'widget/profilewidget.dart';
import 'widget/showdialog.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 193, 192, 192),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height / 2.3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                color: ColorManager.primary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: Get.width / 6,
                    child: Icon(
                      Icons.person,
                      size: Get.width / 6,
                      color: ColorManager.darkGrey,
                    ),
                    // backgroundImage: AssetImage("assets/images/Profile.png"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder<UserProfile?>(
                    future: getUserProfile(),
                    builder: (BuildContext context,
                        AsyncSnapshot<UserProfile?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          UserProfile? userProfile = snapshot.data;
                          if (userProfile != null) {
                            // Use userProfile data here
                            return Text(
                                'Hello, ${userProfile.name.toUpperCase()}',
                                style: TextStyle(
                                    fontSize: Get.width / 15,
                                    fontWeight: FontWeight.w500,
                                    color: ColorManager.black));
                          } else {
                            return Text('No user profile found');
                          }
                        }
                      }
                    },
                  )

                  // By default, show a loading spinner.
                ],
              ),
            ),
            Positioned(
              top: Get.height / 25,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  size: Get.width / 10,
                  Icons.arrow_circle_left_sharp,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Center(
              child: Container(
                width: Get.width / 1.15,
                height: Get.height / 1.7,
                margin: EdgeInsets.only(
                  top: Get.height / 2.6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: Column(
                  children: [
                    ProfileWidget(
                      icon1: Icons.edit,
                      icon2: Icons.arrow_forward_ios,
                      text: "Edit Profile Name",
                      Ontap: () {
                        showDialog(
                          context: context,
                          builder: (context) => ShowDialog(
                            title: "Edit Profile Name",
                            hint: "name",
                          ),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon1: Icons.mail_lock_outlined,
                      icon2: Icons.arrow_forward_ios,
                      text: "Change Mail Address",
                      Ontap: () {
                        showDialog(
                          context: context,
                          builder: (context) => ShowDialog(
                            title: "Change Mail Address",
                            hint: "mail",
                          ),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon1: Icons.phone,
                      icon2: Icons.arrow_forward_ios,
                      text: "Change Phone Number",
                      Ontap: () {
                        showDialog(
                          context: context,
                          builder: (context) => ShowDialog(
                            title: "Change Phone Number",
                            hint: "phone",
                          ),
                        );
                      },
                    ),
                    ProfileWidget(
                      icon1: Icons.settings_rounded,
                      icon2: Icons.arrow_forward_ios,
                      text: "Setting",
                      Ontap: () {},
                    ),
                    Spacer(),
                    ProfileWidget(
                      color: Colors.red,
                      icon1: Icons.logout_outlined,
                      icon2: Icons.arrow_forward_ios,
                      text: "Log Out",
                      Ontap: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
