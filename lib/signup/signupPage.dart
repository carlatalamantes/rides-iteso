import 'package:flutter/material.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';
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

  Future<void> signUp() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: emailTextController.text,
        password: psswrdTextController.text,
        name: nombreTextController.text,
        lastName: apPatTextController.text,
        secondLastName: apMatTextController.text,
      );
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
                        nombreTextController: nombreTextController,
                        labelText: 'Nombre(s) *',
                        isRequired: false,
                      ),
                      base_TextFormField(
                        nombreTextController: apPatTextController,
                        labelText: 'Apellido paterno *',
                        isRequired: false,
                      ),
                      base_TextFormField(
                        nombreTextController: apMatTextController,
                        labelText: 'Apellido materno',
                      ),
                      const SizedBox(height: 10),
                      base_TextFormField(
                          nombreTextController: emailTextController,
                          labelText: 'Correo electrónico *',
                          isRequired: false,
                          keyboardType: TextInputType.emailAddress),
                      base_TextFormField(
                        nombreTextController: psswrdTextController,
                        labelText: 'Contraseña *',
                        isRequired: false,
                        isPassword: true,
                      ),
                      base_TextFormField(
                        nombreTextController: repPsswrdTextController,
                        labelText: 'Repetir contraseña *',
                        isRequired: false,
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
      signUp();
    }
  }
}
