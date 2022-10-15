import 'package:flutter/material.dart';
import 'package:rides_iteso/components/base_Dropdown.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';
import 'package:rides_iteso/signup/driver/conductor_Pickup.dart';

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

  guardarButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConductorPickupPage()),
    );
  }

  return Column(
    children: [
      base_TextFormField(
        nombreTextController: anioTextController,
        labelText: 'Año',
      ),
      base_Dropdown(
        dropdownValue: marcaTextController,
        items: items,
        labelText: 'Marca',
      ),
      base_Dropdown(
        dropdownValue: modeloTextController,
        items: items,
        labelText: 'Modelo',
      ),
      base_Dropdown(
        dropdownValue: colorTextController,
        items: items,
        labelText: 'Color',
      ),
      base_TextFormField(
        nombreTextController: pasajerosTextController,
        labelText: 'Pasajeros que puedo transportar',
      ),
      const SizedBox(
        height: 10,
      ),
      base_Dropdown(
        dropdownValue: colorTextController,
        items: items,
        labelText: 'Zonas de drop off',
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
