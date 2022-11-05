import 'package:flutter/material.dart';
import 'package:rides_iteso/rides/driver/driver_card.dart';
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

class DriverRidePage extends StatefulWidget {
  DriverRidePage({
    super.key,
  });

  @override
  State<DriverRidePage> createState() => _PassengerRidePageState();
}

class _PassengerRidePageState extends State<DriverRidePage> {
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
          children: const [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                'Pickup',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DriverCard(
              ride: {
                "name": "Juan Perez torrez ",
                "brand": 'Nissan',
                "model": 'Versa',
                "color": 'Rojo',
                "location": 'Plaza del Sol',
                "registererd": 3,
                "passengerLimit": 4,
                "time": "16:00",
                "day": [1, 0, 0, 0, 0, 0, 0],
              },
            ),
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
            ride: {
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
