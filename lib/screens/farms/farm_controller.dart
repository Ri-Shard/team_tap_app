import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';
import 'package:team_tap_app/models/collect_model.dart';
import 'package:team_tap_app/repository/database_service_repository.dart';

import '../../models/worker_model.dart';

class FarmController extends GetxController {
  List<WorkerModel?> bdData = [];
  List<CollectModel?> collectData = [];
  DataBaseServiceRepository database = DataBaseServiceRepository();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getWorkers();
    getCollects();
  }

  saveWorker(WorkerModel worker) async {
    try {
      return await database.saveWorker(worker);
    } catch (e) {}
  }

  saveCollect(CollectModel collect) async {
    try {
      return await database.saveCollect(collect);
    } catch (e) {}
  }

  saveImage(File image) async {
    try {
      return await database.saveImage(image);
    } catch (e) {
      print(e);
    }
  }

  getWorkers() async {
    try {
      bdData = await database.getWorkers();
    } catch (e) {}
  }

  getCollects() async {
    try {
      database.getCollects().listen((collects) {
        collectData = collects;
      });
    } catch (e) {}
  }

  List<CollectModel> collectsFilter(String idworker) {
    List<CollectModel> auxCollects = [];

    for (var element in collectData) {
      if (element!.idWorker == idworker) {
        auxCollects.add(element);
      }
    }

    return auxCollects;
  }
}
