import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_tap_app/my_theme.dart';
import 'package:team_tap_app/screens/farms/farm_controller.dart';
import 'package:team_tap_app/screens/farms/modal_collect_details.dart';

class AllCollectsScreen extends StatelessWidget {
  const AllCollectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final farmController = Get.find<FarmController>();
    final collectslist = farmController.collectsFilter(Get.arguments[0]);
    return Scaffold(
      backgroundColor: MyTheme.background,
      appBar: AppBar(
        elevation: 0,
        forceMaterialTransparency: true,
        title: Text(
          '${Get.arguments[0]} ${Get.arguments[1]}',
          style: TextStyle(fontFamily: 'Qanelas', fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Listado de Recolecciones de ${Get.arguments[1]}'),
          ),
          GetBuilder(
              id: 'listwView',
              init: farmController,
              builder: (_) {
                farmController.getWorkers();
                return Expanded(
                  child: ListView.builder(
                    itemCount: collectslist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(collectslist[index].kgCollected.toString()),
                        subtitle: Text(collectslist[index].idWorker.toString()),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (builder) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: MyTheme.background,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.50,
                                  child:
                                      ModalCollectDetails(collectslist[index]),
                                );
                              });
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
