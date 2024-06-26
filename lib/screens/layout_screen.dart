import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:team_tap_app/my_theme.dart';
import 'package:team_tap_app/screens/dashboard_screen.dart';
import 'package:team_tap_app/screens/farms/farm_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int index = 0;
  List<Widget> views = [DashboardScreen(), FarmsScreen(), Text('2'), Text('3')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.background,
      body: views[index],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.auto_graph),
            title: Text("Informes"),
            selectedColor: MyTheme.brown,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.home_mini_sharp),
            title: Text("Fincas"),
            selectedColor: MyTheme.brown,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.space_dashboard_rounded),
            title: Text("Insumos"),
            selectedColor: MyTheme.brown,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Clientes"),
            selectedColor: MyTheme.brown,
          ),
        ],
      ),
    );
  }
}
