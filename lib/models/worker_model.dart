class WorkerModel {
  String? idWorker;
  String? typeid;
  String? firstname;
  String? lastname;
  String? phone;
  String? gender;
  String? photo;
  String? idfarm;

  WorkerModel(
      {this.idWorker,
      this.firstname,
      this.typeid,
      this.lastname,
      this.gender,
      this.phone,
      this.idfarm,
      this.photo});

  WorkerModel.fromJson(Map<String, dynamic> json) {
    idWorker = json['idWorker'];
    typeid = json['typeid'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    idfarm = json['idfarm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idWorker'] = idWorker;
    data['typeid'] = typeid;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['gender'] = gender;
    data['phone'] = phone;
    data['photo'] = photo;
    data['idfarm'] = idfarm;
    return data;
  }
}
