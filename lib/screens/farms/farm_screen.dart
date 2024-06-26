import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:team_tap_app/my_theme.dart';
import 'package:team_tap_app/resources/buttons.dart';
import 'package:team_tap_app/screens/farms/farm_controller.dart';

class FarmsScreen extends StatefulWidget {
  const FarmsScreen({super.key});

  @override
  State<FarmsScreen> createState() => _FarmsScreenState();
}

class _FarmsScreenState extends State<FarmsScreen> {
  final farmController = Get.find<FarmController>();

  @override
  Widget build(BuildContext context) {
    final localwidth = MediaQuery.of(context).size.width;
    final localheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyTheme.background,
      appBar: AppBar(
        backgroundColor: MyTheme.background,
        elevation: 0,
        title: Text(
          'Listado Trabajadores',
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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 300,
              height: 50,
              child: Buttons(
                content: Text(
                  'Agregar trabajador',
                  style: TextStyle(color: Colors.white),
                ),
                color: MyTheme.brown,
                ontap: () {
                  Get.toNamed('/registerw');
                },
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: MyTheme.brown,
          ),
          GetBuilder(
              id: 'listwView',
              init: farmController,
              builder: (_) {
                farmController.getWorkers();
                return Expanded(
                  child: ListView.builder(
                    itemCount: farmController.bdData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                            farmController.bdData[index]!.firstname.toString()),
                        subtitle: Text('cedula'),
                        onTap: () {},
                        splashColor: const Color.fromARGB(255, 83, 70, 60),
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
