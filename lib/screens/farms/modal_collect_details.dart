import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:team_tap_app/models/collect_model.dart';
import 'package:team_tap_app/my_theme.dart';

class ModalCollectDetails extends StatelessWidget {
  final CollectModel collect;
  const ModalCollectDetails(this.collect, {super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(collect.dateCreated!);
    String formattedDate = DateFormat('yyyy-MM-dd hh:mm a').format(date);
    final localwidth = MediaQuery.of(context).size.width;
    final localheight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Detalles de la recoleccion',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: CircleAvatar(
                  backgroundColor: MyTheme.background,
                  child: Icon(
                    Icons.close,
                    color: MyTheme.brown,
                  ),
                ),
              )
            ],
          ),
          Text(
            'Recolectado ${collect.kgCollected} KG',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Fecha ${formattedDate}',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
              width: localwidth * 0.9,
              height: localheight * 0.3,
              child: Image.network(collect.imageURL!))
        ],
      ),
    );
  }
}
