import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/auth/auth.dart';
import 'package:rides_iteso/bloc/auth/auth_bloc.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';
import 'package:rides_iteso/driver_passenger_page/driver_passenger_page.dart';
import 'package:rides_iteso/rides/rides_page.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  String? errorMessage = '';
  var nombreTextController = TextEditingController();
  var apPatTextController = TextEditingController();
  var apMatTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var psswrdTextController = TextEditingController();
  var repPsswrdTextController = TextEditingController();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  final _formKey = GlobalKey<FormState>();

  Future<void> signUp(BuildContext context) async {
    BlocProvider.of<AuthBloc>(context).add(
      SignUpRequested(
        emailTextController.text.trim(),
        psswrdTextController.text.trim(),
        nombreTextController.text.trim(),
        apPatTextController.text.trim(),
        apMatTextController.text.trim(),
      ),
    );
  }

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
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is Authenticated) {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => DriverPassengerPage(),
                    ),
                  );
                }
                if (state is AuthError) {
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
                          base_TextFormField(
                            textController: nombreTextController,
                            labelText: 'Nombre(s) *',
                            isRequired: true,
                          ),
                          base_TextFormField(
                            textController: apPatTextController,
                            labelText: 'Apellido paterno *',
                            isRequired: true,
                          ),
                          base_TextFormField(
                            textController: apMatTextController,
                            labelText: 'Apellido materno',
                          ),
                          const SizedBox(height: 10),
                          base_TextFormField(
                              textController: emailTextController,
                              labelText: 'Correo electrónico *',
                              isRequired: true,
                              keyboardType: TextInputType.emailAddress),
                          base_TextFormField(
                            textController: psswrdTextController,
                            labelText: 'Contraseña *',
                            isRequired: true,
                            isPassword: true,
                          ),
                          base_ElevatedButton(
                            text: 'CREAR CUENTA',
                            backgroundColor: const Color(0xFF064789),
                            onPressed: () {
                              crearCuentaButton(context);
                            },
                          ),
                        ],
                      ),
                    ));
              },
            )),
      ),
    );
  }

  crearCuentaButton(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      signUp(context);
    }
  }
}
