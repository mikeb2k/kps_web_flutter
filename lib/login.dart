import 'package:flutter/material.dart';
import 'package:kps_web_flutter/colors.dart';
import 'package:kps_web_flutter/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController nameCntrl;
  late TextEditingController passCntrl;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    nameCntrl = TextEditingController();
    passCntrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameCntrl.dispose();
    passCntrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPSColors.colorKPS,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (name) {
                      if (name != Login.name) {
                        return "Wrong name!";
                      }
                      return null;
                    },
                    controller: nameCntrl,
                    decoration: InputDecoration(
                        errorStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        helperText: "Name",
                        fillColor: Colors.white,
                        filled: true,
                        helperStyle: const TextStyle(color: Colors.white))),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (pass) {
                      if (pass != Login.pass) {
                        return "Wrong password!";
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      if (nameCntrl.text == Login.name &&
                          passCntrl.text == Login.pass) {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return HomePageMain();
                          },
                        ));
                      }
                    },
                    controller: passCntrl,
                    obscureText: true,
                    decoration: InputDecoration(
                        errorStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        helperText: "Password",
                        fillColor: Colors.white,
                        filled: true,
                        helperStyle: const TextStyle(color: Colors.white))),
              ),
              const SizedBox(height: 20),
              IconButton(
                  color: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (nameCntrl.text == Login.name &&
                          passCntrl.text == Login.pass) {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return HomePageMain();
                          },
                        ));
                      }
                    }
                  },
                  icon: const Icon(Icons.arrow_forward_ios_rounded))
            ],
          ),
        ),
      ),
    );
  }
}

class Login {
  static const name = "michael";
  static const pass = "Kpstrebatice123xd";
}
