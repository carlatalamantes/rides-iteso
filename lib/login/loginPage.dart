import 'package:flutter/material.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';
import 'package:rides_iteso/signup/signupPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailTextController = TextEditingController();
  var psswrdTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Image(
                  image: AssetImage('assets/images/logo_blue.png'),
                  height: 250,
                ),
              ),
              base_TextFormField(
                nombreTextController: emailTextController,
                labelText: 'Correo electrónico',
              ),
              base_TextFormField(
                nombreTextController: psswrdTextController,
                labelText: 'Contraseña',
              ),
              base_ElevatedButton(
                text: 'INICIAR SESIÓN',
                backgroundColor: const Color(0xFF064789),
                onPressed: () {
                  iniciarSessionButton(context);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '¿No tienes cuenta?',
                style: TextStyle(color: Color(0x80333533)),
              ),
              base_ElevatedButton(
                text: 'REGISTRARME',
                backgroundColor: Colors.white,
                textColor: const Color(0xFF064789),
                onPressed: () {
                  registrarmeButton(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  iniciarSessionButton(BuildContext context) {}

  registrarmeButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
  }
}
