import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/user/user_bloc.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';

class RideRegisterPage extends StatefulWidget {
  RideRegisterPage({super.key});

  @override
  State<RideRegisterPage> createState() => _RideRegisterPageState();
}

class _RideRegisterPageState extends State<RideRegisterPage> {
  var originTextController = TextEditingController(text: "");
  var destinyTextController = TextEditingController(text: "ITESO");

  var originIsIteso = false;

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is CreateOriginDestinationError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              }

              if (state is CreateOriginDestination) {
                //TODO: implementar navegacion a la pagina de calendario
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => RideRegisterPage(),
                  ),
                );
              }

              // TODO: implement listener
            },
            builder: (context, state) {
              return Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child: Image(
                        image: AssetImage('assets/images/logo_blue.png'),
                        height: 150,
                      ),
                    ),
                    const Text("Switch para cambiar entre origen y destino",
                        style: TextStyle(
                            color: Colors.black, fontStyle: FontStyle.italic)),
                    Switch(
                      // This bool value toggles the switch.
                      value: originIsIteso,
                      activeColor: Colors.blue,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          originIsIteso = value;
                          if (originIsIteso) {
                            originTextController.text = "ITESO";
                            destinyTextController.text = "";
                          } else {
                            originTextController.text = "";
                            destinyTextController.text = "ITESO";
                          }
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        readOnly: originIsIteso,
                        controller: originTextController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Origen',
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.edit_location_rounded,
                            ),
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Este campo es requerido' : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        readOnly: !originIsIteso,
                        controller: destinyTextController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Destino',
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: Icon(
                              Icons.square,
                            ),
                          ),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Este campo es requerido' : null,
                      ),
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
              );
            },
          )),
    ));
  }

  saveButton(BuildContext context) {
    BlocProvider.of<UserBloc>(context).add(
      CreateOriginDestinationRequested(
          originTextController.text, destinyTextController.text),
    );
  }
}
