import 'dart:math';
import 'package:animation_demo/main_page.dart';
import 'package:animation_demo/text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginView();
  }
}

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: _animatedUI(),
          ),
        ),
      ),
    );
  }

  Widget _animatedUI() {
    const totalDuration = 2500;
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 4.2),
      duration: const Duration(milliseconds: totalDuration),
      builder: (context, double tweenX, widget) {
        return SingleChildScrollView(
          child: SizedBox(
              width: 300,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Opacity(
                          opacity: min(max(tweenX - 1, 0), 1),
                          child: const SizedBox(
                              height: 100, width: 100, child: FlutterLogo()),
                        ),
                        const SizedBox(height: 5),
                        Opacity(
                          opacity: min(max(tweenX - 2, 0), 1),
                          child: const Text(
                            "WELCOME!",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30)
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          Opacity(
                            opacity: min(max(tweenX - 3, 0), 1),
                            child: const RoundedTextField(
                              label: "Email",
                              hintText: "Enter Email",
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Opacity(
                            opacity: min(max(tweenX - 3.1, 0), 1),
                            child: const RoundedTextField(
                              label: "Password",
                              hintText: "Enter Password",
                              obscure: true,
                            ),
                          ),
                          // const SizedBox(height: 20),
                          Opacity(
                            opacity: min(max(tweenX - 3.2, 0), 1),
                            child: _rememberMe(context),
                          ),
                          // const SizedBox(height: 20),
                          Opacity(
                            opacity: min(max(tweenX - 3.3, 0), 1),
                            child: _loginButton(context),
                          ),
                        ],
                      )),
                ],
              )),
        );
      },
    );
  }

  Widget _loginButton(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainPage()));
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            primary: Colors.white,
            textStyle: const TextStyle(
              color: Color(0x11303030),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          child: const Text(
            "Sign in",
          ),
        ),
      ),
    );
  }

  Widget _rememberMe(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          side: const BorderSide(color: Colors.black),
          value: false,
          onChanged: (value) {},
        ),
        const Text(
          "Remember me",
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }
}
