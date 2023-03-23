import 'ville_model.dart';

class CentresModel {
  int? currentPage;
  List<CentresData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  CentresModel(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  CentresModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <CentresData>[];
      json['data'].forEach((v) {
        data?.add(CentresData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links?.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final jsonData = <String, dynamic>{};
    jsonData['current_page'] = currentPage;
    if (data != null) {
      jsonData['data'] = data?.map((v) => v.toJson()).toList();
    }
    jsonData['first_page_url'] = firstPageUrl;
    jsonData['from'] = from;
    jsonData['last_page'] = lastPage;
    jsonData['last_page_url'] = lastPageUrl;
    if (links != null) {
      jsonData['links'] = links?.map((v) => v.toJson()).toList();
    }
    jsonData['next_page_url'] = nextPageUrl;
    jsonData['path'] = path;
    jsonData['per_page'] = perPage;
    jsonData['prev_page_url'] = prevPageUrl;
    jsonData['to'] = to;
    jsonData['total'] = total;
    return jsonData;
  }
}

class CentresData {
  int? id;
  String? designation;
  int? circonscriptionId;
  String? it;
  String? ig;
  int? villeId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  Circonscription? circonscription;
  VilleData? ville;

  CentresData(
      {this.id,
      this.designation,
      this.circonscriptionId,
      this.it,
      this.ig,
      this.villeId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.circonscription,
      this.ville});

  CentresData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'];
    circonscriptionId = json['circonscription_id'];
    it = json['it'];
    ig = json['ig'];
    villeId = json['ville_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    circonscription = json['circonscription'] != null
        ? Circonscription?.fromJson(json['circonscription'])
        : null;
    ville = json['ville'] != null ? VilleData?.fromJson(json['ville']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['designation'] = designation;
    data['circonscription_id'] = circonscriptionId;
    data['it'] = it;
    data['ig'] = ig;
    data['ville_id'] = villeId;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (circonscription != null) {
      data['circonscription'] = circonscription?.toJson();
    }
    if (ville != null) {
      data['ville'] = ville?.toJson();
    }
    return data;
  }
}

class Circonscription {
  int? id;
  String? designation;
  int? villeId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  Circonscription(
      {this.id,
      this.designation,
      this.villeId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Circonscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'];
    villeId = json['ville_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['designation'] = designation;
    data['ville_id'] = villeId;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
