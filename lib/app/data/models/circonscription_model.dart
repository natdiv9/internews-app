class CirconscriptionModel {
  int? currentPage;
  List<CirconscriptionData>? data;
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

  CirconscriptionModel(
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

  CirconscriptionModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <CirconscriptionData>[];
      json['data'].forEach((v) {
        data?.add(CirconscriptionData.fromJson(v));
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

class CirconscriptionData {
  int? id;
  String? designation;
  int? villeId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  Ville? ville;
  List<CirconscriptionLegislative>? circonscriptionLegislative;

  CirconscriptionData(
      {this.id,
      this.designation,
      this.villeId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.ville,
      this.circonscriptionLegislative});

  CirconscriptionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'];
    villeId = json['ville_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    ville = json['ville'] != null ? Ville?.fromJson(json['ville']) : null;
    if (json['circonscription_legislative'] != null) {
      circonscriptionLegislative = <CirconscriptionLegislative>[];
      json['circonscription_legislative'].forEach((v) {
        circonscriptionLegislative?.add(CirconscriptionLegislative.fromJson(v));
      });
    }
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
    if (circonscriptionLegislative != null) {
      data['circonscription_legislative'] =
          circonscriptionLegislative?.map((v) => v.toJson()).toList();
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
  Province? province;

  Ville(
      {this.id,
      this.designation,
      this.provinceId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.province});

  Ville.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'];
    provinceId = json['province_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    province =
        json['province'] != null ? Province?.fromJson(json['province']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['designation'] = designation;
    data['province_id'] = provinceId;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (province != null) {
      data['province'] = province?.toJson();
    }
    return data;
  }
}

class Province {
  int? id;
  String? designation;
  dynamic deletedAt;
  dynamic createdAt;
  dynamic updatedAt;

  Province(
      {this.id,
      this.designation,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['designation'] = designation;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class CirconscriptionLegislative {
  int? id;
  int? legislativeId;
  int? circonscriptionId;
  String? createdAt;
  String? updatedAt;
  Legislative? legislative;

  CirconscriptionLegislative(
      {this.id,
      this.legislativeId,
      this.circonscriptionId,
      this.createdAt,
      this.updatedAt,
      this.legislative});

  CirconscriptionLegislative.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    legislativeId = json['legislative_id'];
    circonscriptionId = json['circonscription_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    legislative = json['legislative'] != null
        ? Legislative?.fromJson(json['legislative'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['legislative_id'] = legislativeId;
    data['circonscription_id'] = circonscriptionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (legislative != null) {
      data['legislative'] = legislative?.toJson();
    }
    return data;
  }
}

class Legislative {
  int? id;
  String? designation;
  dynamic createdAt;
  dynamic updatedAt;

  Legislative({this.id, this.designation, this.createdAt, this.updatedAt});

  Legislative.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['designation'] = designation;
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
