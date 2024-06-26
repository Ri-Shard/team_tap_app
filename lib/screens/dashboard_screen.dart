import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:team_tap_app/my_theme.dart';
import 'package:team_tap_app/screens/auth/auth_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final localwidth = MediaQuery.of(context).size.width;
    final localheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.background,
        elevation: 0,
        forceMaterialTransparency: true,
        title: Text(
          'Bienvenido, Administrador',
          style: TextStyle(fontFamily: 'Qanelas', fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              await authController.SignOut();
              Get.offAndToNamed('/login');
            },
            child: CircleAvatar(
              backgroundColor: MyTheme.brown,
              child: Icon(
                Icons.person_4_outlined,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: localwidth * 0.07,
          )
        ],
      ),
      backgroundColor: MyTheme.background,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Cantidad recolectada hoy: 40kg',
              style: TextStyle(
                  fontFamily: 'Qanelas',
                  fontWeight: FontWeight.bold,
                  fontSize: 23),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Ventas por dia',
                style: TextStyle(
                  fontSize: 20,
                ),
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 3),
                        FlSpot(1, 2),
                        FlSpot(2, 5),
                        FlSpot(3, 4),
                        FlSpot(4, 6),
                        FlSpot(5, 7),
                      ],
                      isCurved: false,
                      dotData: FlDotData(
                        show: false,
                      ),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Ventas por Mes',
                style: TextStyle(
                  fontSize: 20,
                ),
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 22),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0.0, 0.0),
                        FlSpot(1.0, 2.0),
                        FlSpot(2.0, 4.0),
                        FlSpot(3.0, 6.0),
                        FlSpot(4.0, 8.0),
                        FlSpot(5.0, 10.0)
                      ],
                      isCurved: false,
                      dotData: FlDotData(
                        show: false,
                      ),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
