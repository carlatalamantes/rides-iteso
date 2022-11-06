import 'package:flutter/material.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';
import 'package:rides_iteso/signup/signupPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  var emailTextController = TextEditingController();
  var psswrdTextController = TextEditingController();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  final _formKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: emailTextController.text,
        password: psswrdTextController.text,
      );
    } on FirebaseAuthException catch (e) {
      var errorMessage = e.message ?? 'Error Firebase Auth Login';
      scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: scaffoldMessengerKey,
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
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
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          base_TextFormField(
                            textController: emailTextController,
                            labelText: 'Correo electrónico *',
                            isRequired: true,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          base_TextFormField(
                            textController: psswrdTextController,
                            labelText: 'Contraseña *',
                            isRequired: true,
                            isPassword: true,
                          ),
                          base_ElevatedButton(
                            text: 'INICIAR SESIÓN',
                            backgroundColor: const Color(0xFF064789),
                            onPressed: () {
                              iniciarSessionButton(context);
                            },
                          )
                        ],
                      )),
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
        ));
  }

  iniciarSessionButton(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      signIn();
    }
  }

  registrarmeButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
  }
}
