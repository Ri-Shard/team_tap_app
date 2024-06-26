import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:team_tap_app/models/worker_model.dart';
import 'package:team_tap_app/my_theme.dart';
import 'package:team_tap_app/resources/buttons.dart';
import 'package:team_tap_app/resources/custom_text.dart';
import 'package:team_tap_app/screens/farms/farm_controller.dart';

class RegisterWorkerScreen extends StatefulWidget {
  const RegisterWorkerScreen({super.key});

  @override
  State<RegisterWorkerScreen> createState() => _RegisterWorkerScreenState();
}

class _RegisterWorkerScreenState extends State<RegisterWorkerScreen> {
  final TextEditingController idcontroller = TextEditingController();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  String? idType;
  String? gender;
  String? photo;

  final farmController = Get.find<FarmController>();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final localwidth = MediaQuery.of(context).size.width;
    final localheight = MediaQuery.of(context).size.height;
    var items = ['CC', 'TI', 'CE', 'P'];
    var genders = ['Masculino', 'Femenino', 'Otro'];
    return Scaffold(
      backgroundColor: MyTheme.background,
      appBar: AppBar(
        elevation: 0,
        forceMaterialTransparency: true,
        title: Text(
          'Registro de trabajador',
          style: TextStyle(fontFamily: 'Qanelas', fontWeight: FontWeight.bold),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: MyTheme.brown,
            child: Icon(
              Icons.person_4_outlined,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: localwidth * 0.07,
          )
        ],
      ),
      body: ListView(
        children: [
          Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: localheight * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: localwidth * 0.1,
                    ),
                    SizedBox(
                      width: localwidth * 0.4,
                      child: DropdownButton<String>(
                        value: idType,
                        hint: Text(
                          'Tipo documento',
                          overflow: TextOverflow.clip,
                        ),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            idType = value.toString();
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: localwidth * 0.4,
                      child: CustomText(
                        hint: 'Nro Identificación',
                        inputType: TextInputType.number,
                        controller: idcontroller,
                        validator: (p0) {
                          if (p0!.isEmpty) {
                            return 'Campo vacio, ingrese un Número valido';
                          }

                          if (p0.length > 11 || p0.length < 4) {
                            return 'Número de identificación no valido';
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: localwidth * 0.1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: localwidth * 0.85,
                  child: CustomText(
                    hint: 'Nombre',
                    controller: firstnamecontroller,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Campo vacio, ingrese un Nombre valido';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: localwidth * 0.85,
                  child: CustomText(
                    hint: 'Apellido',
                    controller: lastnamecontroller,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Campo vacio, ingrese un Apellido valido';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: localwidth * 0.85,
                  child: CustomText(
                    hint: 'Telefono',
                    controller: phonecontroller,
                    inputType: TextInputType.phone,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Campo vacio, ingrese un Número valido';
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: localwidth * 0.3,
                  child: DropdownButton<String>(
                    value: gender,
                    hint: Text(
                      'Genero',
                      overflow: TextOverflow.clip,
                    ),
                    items: genders.map((String genders) {
                      return DropdownMenuItem(
                        value: genders,
                        child: Text(
                          genders,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        gender = value.toString();
                      });
                    },
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
                      'Guardar',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: MyTheme.brown,
                    ontap: () async {
                      if (_key.currentState!.validate()) {
                        final response = await farmController.saveWorker(
                            WorkerModel(
                                idWorker: idcontroller.text,
                                typeid: idType,
                                firstname: firstnamecontroller.text,
                                lastname: lastnamecontroller.text,
                                gender: gender,
                                phone: phonecontroller.text));

                        if (response == '-1') {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: 'Error al guardar',
                            autoCloseDuration: const Duration(seconds: 2),
                            showConfirmBtn: false,
                          );
                        } else {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text: response,
                            autoCloseDuration: const Duration(seconds: 2),
                            showConfirmBtn: false,
                          );

                          Get.back();
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
