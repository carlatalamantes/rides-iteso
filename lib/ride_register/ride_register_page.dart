import 'package:flutter/material.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';

class RideRegisterPage extends StatefulWidget {
  RideRegisterPage({super.key});

  @override
  State<RideRegisterPage> createState() => _RideRegisterPageState();
}

class _RideRegisterPageState extends State<RideRegisterPage> {
  var arrivesTextController = TextEditingController();

  var leavesArrivesVar = false;

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
                textController: arrivesTextController,
                labelText: (leavesArrivesVar)?'Llega a:':'Sale de:',
              ),
              base_ElevatedButton(
                text: (leavesArrivesVar)?'SALE DEL ITESO':'LLEGA AL ITESO', //boton que cambia de color dependiendo
                backgroundColor: const Color(0xFF064789),
                onPressed: () {
                  leavesArrives();
                },
              ),
              base_ElevatedButton(
                text: 'Guardar', //boton que cambia de color dependiendo
                backgroundColor: const Color(0xFF064789),
                onPressed: () {
                  saveButton(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  leavesArrives() {
    print("leavesArrives");
    setState(() {
      leavesArrivesVar = !leavesArrivesVar;
    });
  }

  saveButton(BuildContext context) {
    print("RegistrarAuto");
    Navigator.pop(context);
  }
}
/*
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
*/

/*
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
*/