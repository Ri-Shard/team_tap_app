import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';
import 'package:team_tap_app/models/collect_model.dart';
import 'package:team_tap_app/models/worker_model.dart';
import 'package:team_tap_app/my_theme.dart';
import 'package:team_tap_app/resources/buttons.dart';
import 'package:team_tap_app/resources/custom_text.dart';
import 'package:team_tap_app/screens/farms/farm_controller.dart';

class CollectScreen extends StatefulWidget {
  const CollectScreen({super.key});

  @override
  State<CollectScreen> createState() => _CollectScreenState();
}

class _CollectScreenState extends State<CollectScreen> {
  File? _image;
  Future<void> _takeImage() async {
    final picker = ImagePicker();

    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        _image = null;
      }
    });
  }

  final TextEditingController quantitybultoController = TextEditingController();
  final TextEditingController kgcollectedController = TextEditingController();
  String? idType;
  String? gender;
  String? photo;

  final farmController = Get.find<FarmController>();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    final localwidth = MediaQuery.of(context).size.width;
    final localheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyTheme.background,
      appBar: AppBar(
        elevation: 0,
        forceMaterialTransparency: true,
        title: Text(
          '${Get.arguments[0]} ${Get.arguments[1]}',
          style: TextStyle(fontFamily: 'Qanelas', fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                farmController.onReady();
                Get.toNamed('/collectslist',
                    arguments: [Get.arguments[0], Get.arguments[1]]);
              },
              icon: Icon(
                Icons.list,
                size: 30,
              ))
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
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _image != null
                          ? Image.file(_image!)
                          : Text('No han tomado imagen'),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _takeImage,
                        child: Text('Tomar una imagen'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: localwidth * 0.85,
                  child: CustomText(
                    hint: 'Cantidad Bultos Recolectados',
                    controller: quantitybultoController,
                    inputType: TextInputType.number,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Campo vacio, ingrese una Cantidad valida';
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
                    hint: 'Peso Recolectado',
                    controller: kgcollectedController,
                    inputType: TextInputType.number,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Campo vacio, ingrese un Numero valido';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
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
                        if (_image == null) {
                          QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: 'La imagen no puede estar vacia',
                            autoCloseDuration: const Duration(seconds: 2),
                            showConfirmBtn: false,
                          );
                        } else {
                          final responseImg =
                              await farmController.saveImage(_image!);

                          if (responseImg != null) {
                            final response = await farmController.saveCollect(
                                CollectModel(
                                    idWorker: Get.arguments[0],
                                    imageURL: responseImg,
                                    kgCollected: kgcollectedController.text,
                                    quantityBulto:
                                        quantitybultoController.text));

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
