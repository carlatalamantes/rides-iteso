import 'package:flutter/material.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';

class RideRegisterPage extends StatelessWidget {
  RideRegisterPage({super.key});
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
                textController: nombreTextController,
                labelText: 'Marca',
              ),
              base_TextFormField(
                textController: apPatTextController,
                labelText: 'Modelo',
              ),
              base_TextFormField(
                textController: apMatTextController,
                labelText: 'Color',
              ),
              base_ElevatedButton(
                text: 'REGISTRAR AUTO',
                backgroundColor: const Color(0xFF064789),
                onPressed: () {
                  registrarAutoButton(context);
                },
              ),
              base_ElevatedButton(
                text: 'Cancelar',
                backgroundColor: Colors.white,
                textColor: const Color(0xFF064789),
                onPressed: () {
                  cancelarButton(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  cancelarButton(BuildContext context) {
    print("cacelar");
    Navigator.pop(context);
  }

  registrarAutoButton(BuildContext context) {
    print("RegistrarAuto");
    Navigator.pop(context);
  }
}

