import 'package:flutter/material.dart';
import 'package:rides_iteso/rides/passenger/passenger_card.dart';

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

class PassengerRidePage extends StatefulWidget {
  const PassengerRidePage({
    super.key,
  });

  @override
  State<PassengerRidePage> createState() => _PassengerRidePageState();
}

class _PassengerRidePageState extends State<PassengerRidePage> {
  final List<Item> _data = [
    Item(expandedValue: "Expanded", headerValue: "LUNES"),
    Item(expandedValue: "Expanded", headerValue: "MARTES"),
    Item(expandedValue: "Expanded", headerValue: "MIERCOLES"),
    Item(expandedValue: "Expanded", headerValue: "JUEVES"),
    Item(expandedValue: "Expanded", headerValue: "VIERNES"),
    Item(expandedValue: "Expanded", headerValue: "SABADO")
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
    return SingleChildScrollView(
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
          return _panel(item);
        },
      ).toList(),
    );
  }

  ExpansionPanel _panel(Item item) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(
            item.headerValue,
            style: const TextStyle(
              color: Color(0xFF064789),
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
      isExpanded: item.isExpanded,
      body: Column(
        children: const [
          PassengerCard(
            ride:{
            "name": "Juan Perez torrez ",
            "brand": 'Nissan',
            "model": 'Versa',
            "color": 'Rojo',
            "location": 'Plaza del Sol',
            "registererd": "3",
            "passengerLimit": "4",
            "time": "16:00"
            },
          ),
          Text("+ Buscar ride"), //"Nissan Versa Rojo"
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

}

/*
  Widget OldBody() {
    return Column(
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
                keyboardType: TextInputType.number,
              ),
            )
          ],
        ),
        ListTile(
          leading: const Icon(
            Icons.add,
          ),
          title: const Text("Añadir punto"),
          onTap: () {},
        ),
      ],
    );
  }
*/