class CollectModel {
  String? idWorker;
  String? kgCollected;
  String? quantityBulto;
  String? imageURL;
  String? dateCreated;

  CollectModel(
      {this.idWorker, this.kgCollected, this.quantityBulto, this.imageURL});

  CollectModel.fromJson(Map<String, dynamic> json) {
    idWorker = json['idWorker'];
    kgCollected = json['kgCollected'];
    quantityBulto = json['quantityBulto'];
    imageURL = json['imageURL'];
    dateCreated = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idWorker'] = idWorker;
    data['kgCollected'] = kgCollected;
    data['quantityBulto'] = quantityBulto;
    data['imageURL'] = imageURL;
    data['created_at'] = dateCreated;

    return data;
  }
}
