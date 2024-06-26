import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:team_tap_app/my_theme.dart';
import 'package:team_tap_app/routes.dart';
import 'package:team_tap_app/screens/farms/farm_controller.dart';
import 'package:team_tap_app/screens/splash_screen.dart';
import 'package:team_tap_app/screens/auth/auth_controller.dart';
import 'package:team_tap_app/screens/auth/login_screen.dart';

Future<void> main() async {
  await Supabase.initialize(
    debug: false,
    url: 'https://rlksrvjcsxgvkisgbxxg.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJsa3Nydmpjc3hndmtpc2dieHhnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg5ODQ4OTQsImV4cCI6MjAzNDU2MDg5NH0.1JrKm-OLXlh9NCOtx5vGDwZ9kfD1QWg0c6bn_C7PQrM',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(FarmController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TeamTapAPP',
      getPages: appRoutes(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyTheme.brown),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
    );
  }
}
