// ignore_for_file: unused_local_variable, avoid_print, body_might_complete_normally_nullable, prefer_const_constructors, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frontend/view/auth/signin_screen.dart';
import 'package:frontend/view/menu/choixmaladie.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Function/snackError.dart';
import 'reset.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  TextEditingController mail = TextEditingController();
  TextEditingController passeword = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    var mwd = MediaQuery.of(context).size.width;
    var mhd = MediaQuery.of(context).size.height;

    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            width: mwd,
            height: mhd,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/sente.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              width: mwd,
              height: mhd,
              child: ListView(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: mhd * 0.005,
                          bottom: 60,
                          left: 26,
                        ),
                        child: const Text(
                          "وزارة الصحة التونسية",
                          style: TextStyle(
                            color: Color.fromARGB(255, 65, 61, 61),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mhd * 0.15,
                      ),
                      Form(
                        key: formstate,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "من فضلك البريد الالكتروني";
                                  }
                                },
                                controller: mail,
                                onSaved: (value) {
                                  mail.text = value!;
                                },
                                decoration: InputDecoration(
                                  fillColor: Color.fromRGBO(0, 0, 0, 0.298),
                                  filled: true,
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  hintText: 'البريد الالكتروني',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "كلمة السر من فضلك";
                                }
                              },
                              controller: passeword,
                              obscureText: p,
                              decoration: InputDecoration(
                                fillColor: Color.fromRGBO(0, 0, 0, 0.298),
                                filled: true,
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    p ? Icons.visibility : Icons.visibility_off,
                                    color: const Color.fromARGB(255, 251, 0, 0),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      p = !p;
                                    });
                                  },
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                hintText: 'كلمة السر',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                            onPressed: (() async {
                              var formdata = formstate.currentState;
                              if (formdata!.validate()) {
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: mail.text,
                                          password: passeword.text);
                                  if (FirebaseAuth.instance.currentUser !=
                                      null) {
                                    mail.text = "";
                                    passeword.text = "";

                                    if (credential.user != null) {
                                      Get.to(Maladies());
                                    }
                                  }
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    showSnackError(
                                      "خطأ",
                                      "لا يوجد مستخدم بهذا البريد الإلكتروني",
                                    );
                                  } else if (e.code == 'wrong-password') {
                                    showSnackError(
                                      "خطأ",
                                      "كلمة المرور غير صحيحة",
                                    );
                                  }
                                }
                              }
                            }),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Color.fromARGB(255, 210, 24, 24),
                              shadowColor: Colors.grey,
                              elevation: 5,
                              fixedSize: const Size(200, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            child: const Text("تسجيل الدخول")),
                      ),
                      SizedBox(
                        width: mwd * 0.3,
                      ),
                      IconButton(
                        onPressed: () async {
                          UserCredential cred = await signInWithGoogle();
                          if (cred.user != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => login()),
                            );
                          }
                        },
                        icon: Icon(Icons.mail_outline, size: 50),
                        color: Color.fromARGB(255, 185, 17, 56),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RestPassword()),
                              );
                            });
                          },
                          child: const Text("نسيت كلمة السر",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: Color.fromARGB(255, 79, 15, 255))),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 30),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const singe()),
                                );
                              });
                            },
                            child: const Text("انشاء حساب جديد",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    color: Color.fromARGB(255, 79, 15, 255))),
                          )),
                    ],
                  ),
                ],
              )),
        ],
      )),
    );
  }
}
