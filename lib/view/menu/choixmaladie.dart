import 'package:flutter/material.dart';
import 'package:frontend/view/menu/Formulaire.dart';
import 'package:frontend/view/menu/gestured.dart';
import 'package:get/get.dart';

import '../../controller/choixcontroller.dart';
import '../../controller/drawercontroller.dart';
import '../../controller/homecontroller.dart';
import 'package:intl/intl.dart';

import '../resources/color/color_manager.dart';
import 'Profile/profile.dart';
import 'widget/buttondrawer.dart';

class Maladies extends StatefulWidget {
  const Maladies({super.key});

  @override
  State<Maladies> createState() => _MaladiesState();
}

class _MaladiesState extends State<Maladies> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int? day;
  int? month;
  int? year;
  String? jour;
  @override
  void initState() {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Format the date as a string
    String formattedDate = "${now.year}-${now.month}-${now.day}";
    day = now.day.toInt();
    month = now.month.toInt();
    year = now.year.toInt();
    String formattedDatee = DateFormat('EEEE').format(now);
    jour = formattedDatee;

    // Print or use the formatted date
    print('Current Date: $formattedDate');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mwd = MediaQuery.of(context).size.width;
    var mhd = MediaQuery.of(context).size.height;
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
            backgroundColor: ColorManager.primary,
            shadowColor: Colors.black,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    topRight: Radius.circular(100))),
            child: ListView(
              children: [
                DrawerHeader(
                  curve: Curves.easeIn,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 90,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(228, 255, 255, 255),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GetBuilder<CustomdrawerController>(
                          init: CustomdrawerController(),
                          builder: (controller) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.Nom ?? "nom",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  controller.Phone ?? "Phone",
                                )
                              ],
                            );
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                GetBuilder<CustomdrawerController>(
                    init: CustomdrawerController(),
                    builder: (controller) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustombuttonDrawer(
                            icon: Icons.person,
                            ontab: () {
                              Get.to(ProfileScreen());
                            },
                            text: " الصفحة الشخصية",
                          ),
                          const CustombuttonDrawer(
                            icon: Icons.history_outlined,
                            text: "المواعيد",
                          ),
                          const CustombuttonDrawer(
                              icon: Icons.receipt_long_rounded,
                              text: "التقارير"),
                          const CustombuttonDrawer(
                            icon: Icons.assignment_add,
                            text: "اضافة موعد",
                          ),
                          SizedBox(
                            height: Get.height / 15,
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: Get.height / 35,
                          ),
                          CustombuttonDrawer(
                            ontab: () {},
                            icon: Icons.logout,
                            text: "تسجيل الخروج",
                          ),
                        ],
                      );
                    })
              ],
            )),
        backgroundColor: ColorManager.primary,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 10, left: 10),
                child: Row(
                  children: [
                    Flexible(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
                            size: 40,
                          ),
                        )),
                    Flexible(
                      flex: 6,
                      child: TextFormField(
                          onSaved: (value) {},
                          decoration: const InputDecoration(
                            counter: SizedBox.shrink(),
                            fillColor: Color.fromARGB(255, 242, 240, 240),
                            hoverColor: Color.fromARGB(255, 232, 229, 229),
                            prefixIcon: Icon(Icons.search_rounded),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            hintText: 'recherche',
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mhd * 0.0038,
              ),
              Container(
                alignment: Alignment.topLeft,
                height: mhd * 0.849,
                width: mwd,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.black),
                    left: BorderSide(width: 1.0, color: Colors.black),
                    right: BorderSide(width: 1.0, color: Colors.black),
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,

                      offset: Offset(0, -2), // Shadow position
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: ColorManager.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(":الاقسام ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500)),
                    GetBuilder<CustomaddController>(
                        init: CustomaddController(),
                        builder: (controller) {
                          return Row(
                            children: [
                              gestured(
                                tab: () {
                                  Get.to(MyForm());
                                  controller.getmaladie("القلب");
                                  controller.getCollectionLength("القلب");
                                },
                                txt: "القلب",
                                path: "assets/image/ceur.png",
                              ),
                              gestured(
                                tab: () {
                                  controller.getmaladie("الاسنان");
                                  Get.to(MyForm());
                                  controller.getCollectionLength("الاسنان");
                                },
                                txt: "الاسنان",
                                path: "assets/image/dentist.png",
                              ),
                              gestured(
                                tab: () {
                                  controller.getmaladie("طب عام");
                                  Get.to(MyForm());
                                  controller.getCollectionLength("طب عام");
                                },
                                txt: "طب عام",
                                path: "assets/image/chaleur.png",
                              ),
                            ],
                          );
                        }),
                    GetBuilder<CustomaddController>(
                        init: CustomaddController(),
                        builder: (controller) {
                          return Row(
                            children: [
                              gestured(
                                tab: () {
                                  controller.getmaladie("التوليد");
                                  Get.to(MyForm());
                                  controller.getCollectionLength("التوليد");
                                },
                                txt: "التوليد",
                                path: "assets/image/femme.png",
                              ),
                              gestured(
                                tab: () {
                                  controller.getmaladie("الأطفال");
                                  Get.to(MyForm());
                                  controller.getCollectionLength("الأطفال");
                                },
                                txt: "الأطفال",
                                path: "assets/image/enfance.png",
                              ),
                              gestured(
                                tab: () {
                                  controller.getmaladie("العيون");
                                  Get.to(MyForm());
                                  controller.getCollectionLength("العيون");
                                },
                                txt: "العظام",
                                path: "assets/image/os.png",
                              ),
                            ],
                          );
                        }),
                    Text(":المواعيد ",
                        style: TextStyle(
                            color: ColorManager.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: mhd * 0.048,
                    ),
                    Container(
                      width: mwd,
                      height: mhd * 0.26,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.black,
                            blurRadius: 10,

                            offset: Offset(0, -2), // Shadow position
                          ),
                        ],
                        color: ColorManager.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              size: mwd * 0.25,
                              opticalSize: 10,
                              color: const Color.fromRGBO(9, 171, 142, 1),
                            ),
                            SizedBox(
                              width: mwd * 0.15,
                            ),
                            GetBuilder<CustomaddController>(
                                init: CustomaddController(),
                                builder: (controller) {
                                  return Column(
                                    children: [
                                      Text(
                                        "اليوم : $day / $month / $year",
                                        style: TextStyle(
                                            color: ColorManager.black,
                                            fontSize: mwd * 0.05,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: mhd * 0.02,
                                      ),
                                      Text(controller.malad,
                                          style: TextStyle(
                                              color: ColorManager.black,
                                              fontSize: mwd * 0.06,
                                              fontWeight: FontWeight.w500)),
                                      SizedBox(
                                        height: mhd * 0.02,
                                      ),
                                      Text(controller.nmb,
                                          style: TextStyle(
                                              color: ColorManager.black,
                                              fontSize: mwd * 0.08,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  );
                                }),
                          ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
