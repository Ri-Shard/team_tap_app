import 'package:supabase_flutter/supabase_flutter.dart' as supa;
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
}
