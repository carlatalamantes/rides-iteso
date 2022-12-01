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
  var numPassajerosTextController = TextEditingController();

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
                textController: numPassajerosTextController,
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
      ),
    );
  }
}




/*
import 'package:flutter/material.dart';
import 'package:rides_iteso/components/base_DropdownButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';

class CarRegisterPage extends StatelessWidget {
  const CarRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConductorCarPage(context),
        ),
      ),
    );
  }

  Widget ConductorCarPage(BuildContext context) {
    var anioTextController = TextEditingController();
    String marcaTextController = "Value 1";
    var modeloTextController = "Value 1";
    var colorTextController = "Value 1";
    var pasajerosTextController = TextEditingController();

    var items = [
      {"value": "Value 1", "label": "Label 1"},
      {"value": "Value 2", "label": "Label 2"},
      {"value": "Value 3", "label": "Label 3"},
      {"value": "Value 4", "label": "Label 4"},
      {"value": "Value 5", "label": "Label 5"},
    ];

    guardarButton(BuildContext context) {}

    return Column(
      children: [
        base_TextFormField(
          nombreTextController: anioTextController,
          labelText: 'Año',
        ),
        base_DropdownButton(
          dropdownValue: marcaTextController,
          items: items,
          labelText: 'Marca',
          selectedIndex: 0,
        ),
        base_DropdownButton(
          dropdownValue: modeloTextController,
          items: items,
          labelText: 'Modelo',
          selectedIndex: 0,
        ),
        base_DropdownButton(
          dropdownValue: colorTextController,
          items: items,
          labelText: 'Color',
          selectedIndex: 0,
        ),
        base_TextFormField(
          nombreTextController: pasajerosTextController,
          labelText: 'Pasajeros que puedo transportar',
        ),
        const SizedBox(
          height: 10,
        ),
        base_DropdownButton(
          dropdownValue: colorTextController,
          items: items,
          labelText: 'Zonas de drop off',
          selectedIndex: 0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                minimumSize: const Size.fromHeight(50),
                backgroundColor: const Color(0xFF064789)),
            onPressed: () {
              guardarButton(context);
            },
            child: const Text('GUARDAR'),
          ),
        ),
      ],
    );
  }
}
*/