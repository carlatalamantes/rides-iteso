import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rides_iteso/bloc/auth/auth.dart';
import 'package:rides_iteso/bloc/auth/auth_bloc.dart';
import 'package:rides_iteso/components/base_ElevatedButton.dart';
import 'package:rides_iteso/components/base_TextFormField.dart';
import 'package:rides_iteso/driver_home_page/driver_home_page.dart';
import 'package:rides_iteso/driver_passenger_page/driver_passenger_page.dart';
import 'package:rides_iteso/passenger_home_page/passenger_home_page.dart';
import 'package:rides_iteso/signup/signupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  var emailTextController = TextEditingController();
  var psswrdTextController = TextEditingController();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  final _formKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    BlocProvider.of<AuthBloc>(context).add(
      SignInRequested(
        emailTextController.text.trim(),
        psswrdTextController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is Authenticated) {
                Auth().isUserFirstLogin().then((value) {
                  if (value == true) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => DriverPassengerPage(),
                      ),
                    );
                  } else {
                    //Get user role
                    Auth().getUserRole().then((value) {
                      if (value == 'driver') {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const DriverHomePage(),
                          ),
                        );
                      } else {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const PassengerHomePage(),
                          ),
                        );
                      }
                    });
                  }
                });
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
              return Center(
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Image(
                        image: AssetImage('assets/images/logo_blue.png'),
                        height: 250,
                      ),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            base_TextFormField(
                              textController: emailTextController,
                              labelText: 'Correo electr??nico *',
                              isRequired: true,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            base_TextFormField(
                              textController: psswrdTextController,
                              labelText: 'Contrase??a *',
                              isRequired: true,
                              isPassword: true,
                            ),
                            base_ElevatedButton(
                              text: 'INICIAR SESI??N',
                              backgroundColor: const Color(0xFF064789),
                              onPressed: () {
                                iniciarSessionButton(context);
                              },
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '??No tienes cuenta?',
                      style: TextStyle(color: Color(0x80333533)),
                    ),
                    base_ElevatedButton(
                      text: 'REGISTRARME',
                      backgroundColor: Colors.white,
                      textColor: const Color(0xFF064789),
                      onPressed: () {
                        registrarmeButton(context);
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  iniciarSessionButton(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      signIn();
    }
  }

  registrarmeButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
  }
}
