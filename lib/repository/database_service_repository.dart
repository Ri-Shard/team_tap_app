import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart' as supa;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:team_tap_app/models/collect_model.dart';
import 'package:team_tap_app/models/worker_model.dart';

class DataBaseServiceRepository {
  final supabase = supa.Supabase.instance.client;

  Future<String> saveWorker(WorkerModel worker) async {
    try {
      worker.idfarm = '1';
      worker.photo = 'null';
      await Future.delayed(const Duration(milliseconds: 500));
      await supabase.from('workers').insert(worker.toJson());
      return 'Guardado Correctamente';
    } catch (e) {
      return '-1';
    }
  }

  Future<List<WorkerModel?>> getWorkers() async {
    try {
      return await supabase.from('workers').select().then((data) {
        List<WorkerModel?> workers = [];
        data.forEach((element) {
          WorkerModel worker = WorkerModel();
          worker.idWorker = element['idWorker'];
          worker.typeid = element['typeid'];
          worker.firstname = element['firstname'];
          worker.lastname = element['lastname'];
          worker.gender = element['gender'];
          worker.phone = element['phone'];
          worker.idfarm = element['idfarm'];
          workers.add(worker);
        });
        return workers;
      });
    } catch (e) {
      return [];
    }
  }

  Future<String> saveCollect(CollectModel collect) async {
    try {
      collect.dateCreated = DateTime.now().toString();
      await Future.delayed(const Duration(milliseconds: 500));
      await supabase.from('collects').insert(collect.toJson());
      return 'Guardado Correctamente';
    } catch (e) {
      return '-1';
    }
  }

  Future<String> saveImage(File image) async {
    final now = DateTime.now();
    final path = 'public/${now}';
    final String fullPath = await supabase.storage.from('images').upload(
          path,
          image,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );
    final response = await supabase.storage.from('images').getPublicUrl(path);
    return response;
  }

  Stream<List<CollectModel?>> getCollects() async* {
    try {
      yield await supabase.from('collects').select().then((data) {
        List<CollectModel?> collects = [];
        data.forEach((element) {
          collects.add(CollectModel.fromJson(element));
        });
        return collects;
      });
    } catch (e) {
      yield [];
    }
  }
}
