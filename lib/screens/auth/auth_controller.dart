import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    verifyUser();
  }

  final supabase = Supabase.instance.client;
  Session? session;
  User? user;
  Login(String email, String password) async {
    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      session = res.session;
      user = res.user;
    } catch (e) {}
  }

  SignOut() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {}
  }

  verifyUser() async {
    User? auxUser = await supabase.auth.currentUser;
    if (auxUser == null) {
      Get.offAllNamed('/login');
    } else {
      Get.offAllNamed('/layout');
    }
  }
}
