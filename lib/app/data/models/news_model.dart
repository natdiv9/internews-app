class NewsModel {
  int? currentPage;
  List<NewsData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  NewsModel(
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

  NewsModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <NewsData>[];
      json['data'].forEach((v) {
        data?.add(NewsData.fromJson(v));
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
    final dataMap = <String, dynamic>{};
    dataMap['current_page'] = currentPage;
    if (data != null) {
      dataMap['data'] = data?.map((v) => v.toJson()).toList();
    }
    dataMap['first_page_url'] = firstPageUrl;
    dataMap['from'] = from;
    dataMap['last_page'] = lastPage;
    dataMap['last_page_url'] = lastPageUrl;
    if (links != null) {
      dataMap['links'] = links?.map((v) => v.toJson()).toList();
    }
    dataMap['next_page_url'] = nextPageUrl;
    dataMap['path'] = path;
    dataMap['per_page'] = perPage;
    dataMap['prev_page_url'] = prevPageUrl;
    dataMap['to'] = to;
    dataMap['total'] = total;
    return dataMap;
  }
}

class NewsData {
  int? id;
  String? titre;
  String? contenu;
  String? lien;
  int? type;
  int? categorie;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  NewsImage? image;

  NewsData(
      {this.id,
      this.titre,
      this.contenu,
      this.lien,
      this.type,
      this.categorie,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.image});

  NewsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titre = json['titre'];
    contenu = json['contenu'];
    lien = json['lien'];
    type = json['type'];
    categorie = json['categorie'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'] != null ? NewsImage?.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['titre'] = titre;
    data['contenu'] = contenu;
    data['lien'] = lien;
    data['type'] = type;
    data['categorie'] = categorie;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (image != null) {
      data['image'] = image?.toJson();
    }
    return data;
  }
}

class NewsImage {
  int? id;
  String? image;
  int? newId;
  dynamic candidatId;
  String? createdAt;
  String? updatedAt;

  NewsImage(
      {this.id,
      this.image,
      this.newId,
      this.candidatId,
      this.createdAt,
      this.updatedAt});

  NewsImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    newId = json['new_id'];
    candidatId = json['candidat_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['new_id'] = newId;
    data['candidat_id'] = candidatId;
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
