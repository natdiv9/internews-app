import 'legislative_model.dart';
import 'shared/link.dart';

class CandidatModel {
  int? currentPage;
  List<CandidatData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  CandidatModel(
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

  CandidatModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <CandidatData>[];
      json['data'].forEach((v) {
        data?.add(CandidatData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Link>[];
      json['links'].forEach((v) {
        links?.add(Link.fromJson(v));
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

class CandidatData {
  int? id;
  String? nom;
  String? sexe;
  String? avatar;
  int? circonscriptionId;
  dynamic partiPolitique;
  dynamic description;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  Circonscription? circonscription;
  List<CandidatLegislative>? candidatLegislative;

  CandidatData(
      {this.id,
      this.nom,
      this.sexe,
      this.avatar,
      this.circonscriptionId,
      this.partiPolitique,
      this.description,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.circonscription,
      this.candidatLegislative});

  CandidatData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    sexe = json['sexe'];
    avatar = json['avatar'];
    circonscriptionId = json['circonscription_id'];
    partiPolitique = json['parti_politique'];
    description = json['description'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    circonscription = json['circonscription'] != null
        ? Circonscription?.fromJson(json['circonscription'])
        : null;
    if (json['candidat_legislative'] != null) {
      candidatLegislative = <CandidatLegislative>[];
      json['candidat_legislative'].forEach((v) {
        candidatLegislative?.add(CandidatLegislative.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['sexe'] = sexe;
    data['avatar'] = avatar;
    data['circonscription_id'] = circonscriptionId;
    data['parti_politique'] = partiPolitique;
    data['description'] = description;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (circonscription != null) {
      data['circonscription'] = circonscription?.toJson();
    }
    if (candidatLegislative != null) {
      data['candidat_legislative'] =
          candidatLegislative?.map((v) => v.toJson()).toList();
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
  Ville? ville;

  Circonscription(
      {this.id,
      this.designation,
      this.villeId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.ville});

  Circonscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'];
    villeId = json['ville_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ville = json['ville'] != null ? Ville?.fromJson(json['ville']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['designation'] = designation;
    data['ville_id'] = villeId;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (ville != null) {
      data['ville'] = ville?.toJson();
    }
    return data;
  }
}

class Ville {
  int? id;
  String? designation;
  int? provinceId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  Ville(
      {this.id,
      this.designation,
      this.provinceId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Ville.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'];
    provinceId = json['province_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['designation'] = designation;
    data['province_id'] = provinceId;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class CandidatLegislative {
  int? id;
  int? candidatId;
  int? legislativeId;
  String? createdAt;
  String? updatedAt;
  LegislativeData? legislative;

  CandidatLegislative(
      {this.id,
      this.candidatId,
      this.legislativeId,
      this.createdAt,
      this.updatedAt,
      this.legislative});

  CandidatLegislative.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    candidatId = json['candidat_id'];
    legislativeId = json['legislative_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    legislative = json['legislative'] != null
        ? LegislativeData?.fromJson(json['legislative'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['candidat_id'] = candidatId;
    data['legislative_id'] = legislativeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (legislative != null) {
      data['legislative'] = legislative?.toJson();
    }
    return data;
  }
}
