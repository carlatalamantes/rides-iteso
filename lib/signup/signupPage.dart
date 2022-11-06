import 'package:flutter/material.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';
import 'package:rides_iteso/login/login_page.dart';
import 'package:rides_iteso/rides/rides_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  String? errorMessage = '';
  var nombreTextController = TextEditingController();
  var apPatTextController = TextEditingController();
  var apMatTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var psswrdTextController = TextEditingController();
  var repPsswrdTextController = TextEditingController();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  final _formKey = GlobalKey<FormState>();

  Future<void> signUp(BuildContext context) async {
    try {
      await Auth()
          .createUserWithEmailAndPassword(
            email: emailTextController.text,
            password: psswrdTextController.text,
            name: nombreTextController.text,
            lastName: apPatTextController.text,
            secondLastName: apMatTextController.text,
          )
          .then((value) => _formKey.currentState?.reset());
      scaffoldMessengerKey.currentState?.showSnackBar(const SnackBar(
          content: Text("Usuario creado"), backgroundColor: Colors.green));
      // ignore: use_build_context_synchronously
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
    } on FirebaseAuthException catch (e) {
      var errorMessage = e.message ?? 'Error Firebase Auth Signup';
      scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    children: [
                      base_TextFormField(
                        textController: nombreTextController,
                        labelText: 'Nombre(s) *',
                        isRequired: true,
                      ),
                      base_TextFormField(
                        textController: apPatTextController,
                        labelText: 'Apellido paterno *',
                        isRequired: true,
                      ),
                      base_TextFormField(
                        textController: apMatTextController,
                        labelText: 'Apellido materno',
                      ),
                      const SizedBox(height: 10),
                      base_TextFormField(
                          textController: emailTextController,
                          labelText: 'Correo electrónico *',
                          isRequired: true,
                          keyboardType: TextInputType.emailAddress),
                      base_TextFormField(
                        textController: psswrdTextController,
                        labelText: 'Contraseña *',
                        isRequired: true,
                        isPassword: true,
                      ),
                      base_TextFormField(
                        textController: repPsswrdTextController,
                        labelText: 'Repetir contraseña *',
                        isRequired: true,
                        isPassword: true,
                      ),
                      base_ElevatedButton(
                        text: 'CREAR CUENTA',
                        backgroundColor: const Color(0xFF064789),
                        onPressed: () {
                          crearCuentaButton(context);
                        },
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }

  crearCuentaButton(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      signUp(context);
    }
  }
}
