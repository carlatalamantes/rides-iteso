import 'package:flutter/material.dart';
import 'package:rides_iteso/components/base_DropdownButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';
import 'package:rides_iteso/rides/conductor_Car.dart';
import 'package:rides_iteso/rides/pasajero_Pickup.dart';

class ConductorPickupPage extends StatefulWidget {
  ConductorPickupPage({Key? key}) : super(key: key);

  @override
  _ConductorPickupPageState createState() => _ConductorPickupPageState();
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class _ConductorPickupPageState extends State<ConductorPickupPage> {
  bool isDriver = true;
  final List<Item> _data = [
    Item(expandedValue: "Expanded", headerValue: "LUNES")
  ];

  var zonaTextController = "Value 1";
  var horaTextController = TextEditingController();

  var items = [
    {"value": "Value 1", "label": "Label 1"},
    {"value": "Value 2", "label": "Label 2"},
    {"value": "Value 3", "label": "Label 3"},
    {"value": "Value 4", "label": "Label 4"},
    {"value": "Value 5", "label": "Label 5"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text(
                  'Pickup',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _buildPanel(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>(
        (Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  item.headerValue,
                  style: TextStyle(
                    color: const Color(0xFF064789),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: base_DropdownButton(
                        dropdownValue: zonaTextController,
                        items: items,
                        labelText: 'Marca',
                        selectedIndex: 0,
                      ),
                    ),
                    Expanded(
                      child: base_TextFormField(
                        nombreTextController: horaTextController,
                        labelText: 'Año',
                      ),
                    )
                  ],
                ),
                ListTile(
                    trailing: const Icon(
                      Icons.add,
                    ),
                    onTap: () {}),
              ],
            ),
            isExpanded: item.isExpanded,
          );
        },
      ).toList(),
    );
  }
}
