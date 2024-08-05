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
          InkWell(
            onTap: () {
              Get.toNamed('/registerw');
            },
            child: CircleAvatar(
              backgroundColor: MyTheme.brown,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
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
          Divider(
            thickness: 0.1,
            color: MyTheme.brown,
          ),
          Text('Seleccione un trabajador para realizar la entrega de cafe'),
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
                            '${farmController.bdData[index]!.firstname.toString()} ${farmController.bdData[index]!.lastname.toString()}'),
                        subtitle: Text(
                            '${farmController.bdData[index]!.typeid.toString()} ${farmController.bdData[index]!.idWorker.toString()}'),
                        onTap: () {
                          Get.toNamed('/collect', arguments: [
                            farmController.bdData[index]!.idWorker.toString(),
                            farmController.bdData[index]!.firstname.toString()
                          ]);
                        },
                        splashColor: Colors.brown[200],
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
