import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginInfo(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class LoginInfo extends ChangeNotifier {
  String _email = '';
  String _password = '';

  String get getEmail => _email;
  String get getPassword => _password;

  set setEmail(String newInfo) {
    _email = newInfo;
    notifyListeners();
  }

  set setPassword(String newInfo) {
    _password = newInfo;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginInfo = Provider.of<LoginInfo>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 136, 32),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.headphones_outlined,
                size: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Start Your Journey With Audible!",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              TextFieldd(
                obs: false,
                hintText: 'Username',
                controller: TextEditingController(text: loginInfo.getEmail),
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldd(
                obs: true,
                hintText: 'Password',
                controller: TextEditingController(text: loginInfo.getPassword),
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              const Dash(),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: LoginButton(
                  color: Colors.blue.shade600,
                  text: 'Login with Google',
                  loginMethod: () {},
                  icon: FontAwesomeIcons.google,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldd extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obs;
  final void Function()? onTap;
  const TextFieldd(
      {super.key,
      required this.obs,
      required this.hintText,
      required this.controller,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        obscureText: obs,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade200,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade200,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          fillColor: Colors.amber.shade200,
          filled: true,
        ),
      ),
    );
  }
}

class Dash extends StatelessWidget {
  const Dash({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.black87,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("OR"),
          ),
          Expanded(
            child: Divider(
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;
  const LoginButton({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
    required this.loginMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(24, 10, 24, 10),
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(18),
          backgroundColor: color,
        ),
        onPressed: () => loginMethod(),
        label: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
