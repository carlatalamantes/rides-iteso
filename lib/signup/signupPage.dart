import 'package:flutter/material.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';
import 'package:rides_iteso/signup/completeProfile.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var nombreTextController = TextEditingController();
  var apPatTextController = TextEditingController();
  var apMatTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var psswrdTextController = TextEditingController();
  var repPsswrdTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              base_TextFormField(
                nombreTextController: nombreTextController,
                labelText: 'Nombre(s)',
              ),
              base_TextFormField(
                nombreTextController: apPatTextController,
                labelText: 'Apellido paterno',
              ),
              base_TextFormField(
                nombreTextController: apMatTextController,
                labelText: 'Apellido materno',
              ),
              const SizedBox(
                height: 10,
              ),
              base_TextFormField(
                nombreTextController: emailTextController,
                labelText: 'Correo electrónico',
              ),
              base_TextFormField(
                nombreTextController: psswrdTextController,
                labelText: 'Contraseña',
              ),
              base_TextFormField(
                nombreTextController: repPsswrdTextController,
                labelText: 'Repetir contraseña',
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: const Color(0xFF064789)),
                  onPressed: () {
                    crearCuentaButton(context);
                  },
                  child: const Text('CREAR CUENTA'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  crearCuentaButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CompleteProfilePage()),
    );
  }
}
