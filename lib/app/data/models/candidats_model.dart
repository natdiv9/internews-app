class CandidatsModel {
  int? currentPage;
  List<CandidatsData>? data;
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

  CandidatsModel(
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

  CandidatsModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <CandidatsData>[];
      json['data'].forEach((v) {
        data?.add(CandidatsData.fromJson(v));
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

class CandidatsData {
  int? id;
  String? candidature;
  String? province;
  String? partiPolitique;
  String? description;
  int? userId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  User? user;
  dynamic ville;
  Detail? detail;

  CandidatsData(
      {this.id,
      this.candidature,
      this.province,
      this.partiPolitique,
      this.description,
      this.userId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.ville,
      this.detail});

  CandidatsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    candidature = json['candidature'];
    province = json['province'];
    partiPolitique = json['parti_politique'];
    description = json['description'];
    userId = json['user_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
    ville = json['ville'];
    detail = json['detail'] != null ? Detail?.fromJson(json['detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['candidature'] = candidature;
    data['province'] = province;
    data['parti_politique'] = partiPolitique;
    data['description'] = description;
    data['user_id'] = userId;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    data['ville'] = ville;
    if (detail != null) {
      data['detail'] = detail?.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  int? roles;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.roles,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    roles = json['roles'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['roles'] = roles;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Detail {
  int? id;
  String? bio;
  String? mission;
  String? projet;
  int? candidatId;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  Detail(
      {this.id,
      this.bio,
      this.mission,
      this.projet,
      this.candidatId,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bio = json['bio'];
    mission = json['mission'];
    projet = json['projet'];
    candidatId = json['candidat_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['bio'] = bio;
    data['mission'] = mission;
    data['projet'] = projet;
    data['candidat_id'] = candidatId;
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
