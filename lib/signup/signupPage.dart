import 'package:flutter/material.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';
import 'package:rides_iteso/rides/rides_page.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
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
              const SizedBox(height: 10),
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
              base_ElevatedButton(
                text: 'CREAR CUENTA',
                backgroundColor: const Color(0xFF064789),
                onPressed: () {
                  crearCuentaButton(context);
                },
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
      MaterialPageRoute(builder: (context) => RidesPage()),
    );
  }
}


/*
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
              base_ElevatedButton(
                text: 'CREAR CUENTA',
                backgroundColor: const Color(0xFF064789),
                onPressed: () {
                  crearCuentaButton(context);
                },
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
      MaterialPageRoute(builder: (context) => RidesPage()),
    );
  }
}
*/
