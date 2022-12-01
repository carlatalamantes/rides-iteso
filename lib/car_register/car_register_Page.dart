import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/user/user_bloc.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';

class CarRegisterPage extends StatefulWidget {
  const CarRegisterPage({super.key});

  @override
  State<CarRegisterPage> createState() => _CarRegisterPageState();
}

class _CarRegisterPageState extends State<CarRegisterPage> {
  var marcaTextController = TextEditingController();
  var modeloTextController = TextEditingController();
  var colorTextController = TextEditingController();
  var yearTextController = TextEditingController();
  var plateTextController = TextEditingController();
  var numPasTextController = TextEditingController();

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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Image(
                  image: AssetImage('assets/images/logo_blue.png'),
                  height: 150,
                ),
              ), 
              base_TextFormField(
                textController: plateTextController,
                labelText: 'Placas',
              ),
              base_TextFormField(
                textController: marcaTextController,
                labelText: 'Marca',
              ),
              base_TextFormField(
                textController: modeloTextController,
                labelText: 'Modelo',
              ),
              base_TextFormField(
                textController: colorTextController,
                labelText: 'Color',
              ),
              base_TextFormField(
                textController: yearTextController,
                labelText: 'Año',
                keyboardType: TextInputType.number
              ),
              base_TextFormField(
                textController: numPasTextController,
                labelText: 'Num de pasajeros',
                keyboardType: TextInputType.number
              ),
              base_ElevatedButton(
                text: 'REGISTRAR AUTO',
                backgroundColor: const Color(0xFF064789),
                onPressed: () {
                  registrarAutoButton(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  registrarAutoButton(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(
      CreateUserCarRequested(
        modeloTextController.text.trim(),
        yearTextController.text.trim(),
        colorTextController.text.trim(),
        plateTextController.text.trim(),
        marcaTextController.text.trim(),
        numPasTextController.text.trim(),
      ),
    );
  }
}


