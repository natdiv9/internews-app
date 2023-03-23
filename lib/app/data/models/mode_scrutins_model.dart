class ModeScrutinsModel {
  int? currentPage;
  List<ModeScrutinsData>? data;
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

  ModeScrutinsModel(
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

  ModeScrutinsModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ModeScrutinsData>[];
      json['data'].forEach((v) {
        data?.add(ModeScrutinsData.fromJson(v));
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

class ModeScrutinsData {
  int? id;
  String? titre;
  String? description;
  String? createdAt;
  String? updatedAt;

  ModeScrutinsData(
      {this.id, this.titre, this.description, this.createdAt, this.updatedAt});

  ModeScrutinsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titre = json['titre'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['titre'] = titre;
    data['description'] = description;
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
