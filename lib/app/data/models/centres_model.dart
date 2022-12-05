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
    final dataJson = <String, dynamic>{};
    dataJson['current_page'] = currentPage;
    if (data != null) {
      dataJson['data'] = data?.map((v) => v.toJson()).toList();
    }
    dataJson['first_page_url'] = firstPageUrl;
    dataJson['from'] = from;
    dataJson['last_page'] = lastPage;
    dataJson['last_page_url'] = lastPageUrl;
    if (links != null) {
      dataJson['links'] = links?.map((v) => v.toJson()).toList();
    }
    dataJson['next_page_url'] = nextPageUrl;
    dataJson['path'] = path;
    dataJson['per_page'] = perPage;
    dataJson['prev_page_url'] = prevPageUrl;
    dataJson['to'] = to;
    dataJson['total'] = total;
    return dataJson;
  }
}

class CentresData {
  int? id;
  String? designation;
  String? province;
  String? commune;
  String? it;
  String? ig;
  int? villeId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  CentresData(
      {this.id,
      this.designation,
      this.province,
      this.commune,
      this.it,
      this.ig,
      this.villeId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  CentresData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    designation = json['designation'];
    province = json['province'];
    commune = json['commune'];
    it = json['it'];
    ig = json['ig'];
    villeId = json['ville_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['designation'] = designation;
    data['province'] = province;
    data['commune'] = commune;
    data['it'] = it;
    data['ig'] = ig;
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
