import 'package:flutter/material.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';

class RideRegisterPage extends StatelessWidget {
  RideRegisterPage({super.key});
  var timeTextController = TextEditingController();
  var passengersTextController = TextEditingController();
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
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Image(
                  image: AssetImage('assets/images/logo_blue.png'),
                  height: 200,
                ),
              ),
              base_TextFormField(
                textController: timeTextController,
                labelText: 'Time',
              ),
              base_TextFormField(
                textController: passengersTextController,
                labelText: 'Number of passengers',
              ),
              base_ElevatedButton(
                text: 'SALE DEL ITESO', //boton que cambia de color dependiendo
                backgroundColor: const Color(0xFF064789),
                onPressed: () {},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: days(),
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

  List<Widget> days() {
    return [
      _Buton(tag: "L", act: false, onTap: (){},),
      _Buton(tag: "M", act: true, onTap: (){},),
      _Buton(tag: "M", act: false, onTap: (){},),
      _Buton(tag: "J", act: true, onTap: (){},),
      _Buton(tag: "V", act: false, onTap: (){},),
      _Buton(tag: "S", act: false, onTap: (){},)
    ];
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

class _Buton extends StatelessWidget {
  const _Buton({required this.tag, required this.act, required this.onTap});
  final String tag;
  final bool act;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: (act) ? const Color(0xFF064789) : Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const Spacer(),
            Text(
              tag,
              style: TextStyle(
                color: (act) ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
