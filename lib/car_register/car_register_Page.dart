import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/user/user_bloc.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';
import 'package:rides_iteso/rides/rides_page.dart';

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

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: scaffoldMessengerKey,
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
                  if (state is CreateUserCar) {
                    //TODO: Navigate to carpool route
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const RidesPage()),
                    );
                  }
                  if (state is CreateUserCarError) {
                    scaffoldMessengerKey.currentState?.showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Form(
                      key: _formKey,
                      child: Center(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: Image(
                                image:
                                    AssetImage('assets/images/logo_blue.png'),
                                height: 150,
                              ),
                            ),
                            base_TextFormField(
                              textController: plateTextController,
                              labelText: 'Placas',
                              isRequired: true,
                            ),
                            base_TextFormField(
                              textController: marcaTextController,
                              labelText: 'Marca',
                              isRequired: true,
                            ),
                            base_TextFormField(
                              textController: modeloTextController,
                              labelText: 'Modelo',
                              isRequired: true,
                            ),
                            base_TextFormField(
                              textController: colorTextController,
                              labelText: 'Color',
                              isRequired: true,
                            ),
                            base_TextFormField(
                                textController: yearTextController,
                                labelText: 'Año',
                                isRequired: true,
                                keyboardType: TextInputType.number),
                            base_TextFormField(
                              textController: numPasTextController,
                              labelText: 'Num de pasajeros',
                              keyboardType: TextInputType.number,
                              isRequired: true,
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
                      ));
                },
              )),
        ));
  }

  registrarAutoButton(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<UserBloc>(context).add(
        CreateUserCarRequested(
          plateTextController.text.trim(),
          marcaTextController.text.trim(),
          modeloTextController.text.trim(),
          colorTextController.text.trim(),
          yearTextController.text.trim(),
          numPasTextController.text.trim(),
        ),
      );
    }
  }
}
