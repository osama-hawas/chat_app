import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/registration_page.dart';
import 'package:chat_app/widgets/custom_buttom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants.dart';
import '../helper/scaffoldmessege.dart';
import '../widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = 'loginpage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? password;

  bool medelProgressState = false;

  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            children: [
              const SizedBox(
                height: 70,
              ),
              Image.asset(
                kLogo,
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Scholar Chat',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(obscureState: false,
                onChanged: (data) {
                  email = data;
                },
                hintText: 'Email',
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextField(obscureState: true,
                onChanged: (data) {
                  password = data;
                },
                hintText: 'Password',
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButtom(
                onTap: () async {
                  medelProgressState = true;
                  setState(() {});
                  if (formkey.currentState!.validate()) {
                    try {
                      await loginAcount();
                      Navigator.pushNamed(context, ChatPage.id,arguments: email);
                    } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'user-not-found') {
                        scaffoldmessege(
                            context, 'No user found for that email.');
                      } else if (ex.code == 'wrong-password') {
                        scaffoldmessege(
                            context, 'Wrong password provided for that user.');
                      }
                    } catch (ex) {
                      scaffoldmessege(context, ex.toString());
                    }
                  }
                  medelProgressState = false;
                  setState(() {});
                },
                textButtom: 'Login',
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'don’t have an acount ?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterPage.id);
                    },
                    child: Text(
                      '  Sign Up',
                      style: TextStyle(
                        color: Color(0xffc7ede6),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginAcount() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
