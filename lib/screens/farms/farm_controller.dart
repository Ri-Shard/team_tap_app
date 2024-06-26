import 'package:get/get.dart';
import 'package:team_tap_app/repository/database_service_repository.dart';

import '../../models/worker_model.dart';

class FarmController extends GetxController {
  List<WorkerModel?> bdData = [];
  DataBaseServiceRepository database = DataBaseServiceRepository();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getWorkers();
  }

  saveWorker(WorkerModel worker) async {
    try {
      return await database.saveWorker(worker);
    } catch (e) {}
  }

  getWorkers() async {
    try {
      bdData = await database.getWorkers();
    } catch (e) {}
  }
}
