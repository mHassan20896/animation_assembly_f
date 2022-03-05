import 'package:animation_demo/login_page.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class LogoPage extends StatefulWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  double size = 400;
  var colors = [Colors.transparent, Colors.green, Colors.brown, Colors.black];
  int selectedColor = 0;
  double translation = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _normalContainer(),
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: _changeState,
                  child: const Text("Change State"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text("Next page"),
                ),
              ),
              const SizedBox(width: 10),
            ],
          )
        ],
      ),
    );
  }

  _changeState() => setState(() {
        size /= 1.2;
        // selectedColor = (selectedColor + 1) % colors.length;
        // translation += 50;
      });

  Widget _animatedContainer() => AnimatedContainer(
        color: colors[selectedColor],
        margin: const EdgeInsets.symmetric(vertical: 10),
        transform: Matrix4.translation(vector.Vector3(translation, 0, 0)),
        height: size,
        width: size,
        duration: const Duration(milliseconds: 500),
        child: const FlutterLogo(),
      );

  Widget _normalContainer() => Container(
        color: colors[selectedColor],
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: size,
        width: size,
        child: const FlutterLogo(),
      );
}
