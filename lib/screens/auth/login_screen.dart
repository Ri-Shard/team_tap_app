import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_tap_app/my_theme.dart';
import 'package:team_tap_app/resources/buttons.dart';
import 'package:team_tap_app/resources/custom_text.dart';
import 'package:team_tap_app/screens/auth/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final localwidth = MediaQuery.of(context).size.width;
    final localheight = MediaQuery.of(context).size.height;
    final authController = Get.find<AuthController>();

    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    return Scaffold(
        backgroundColor: MyTheme.background,
        body: ListView(
          children: [
            Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: localheight * 0.2,
                  ),
                  Text(
                    'Hola, bienvenido',
                    style: TextStyle(
                        fontFamily: 'Qanelas',
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Ingresa la cuenta de administrador',
                    style: TextStyle(
                        fontFamily: 'Qanelas',
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: MyTheme.textcolor),
                  ),
                  SizedBox(
                    height: localheight * 0.1,
                  ),
                  SizedBox(
                    width: localwidth * 0.85,
                    child: CustomText(
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      controller: emailcontroller,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: localwidth * 0.85,
                    child: CustomText(
                      hint: 'Contraseña',
                      obscureText: true,
                      controller: passwordcontroller,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: Buttons(
                      content: Text(
                        'Iniciar Sesión',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: MyTheme.brown,
                      ontap: () {
                        authController.Login(
                            emailcontroller.text, passwordcontroller.text);
                        Get.offAllNamed('/layout');
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
