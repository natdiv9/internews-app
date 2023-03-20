class ElectoralData {
  final int id;
  final String titre;
  final String contenu;
  final String created_at;
  final String updated_at;

  ElectoralData({
    required this.titre,
    required this.contenu,
    required this.id,
    required this.created_at,
    required this.updated_at,
  });

  factory ElectoralData.fromJson(Map<String, dynamic> json) {
    return ElectoralData(
      id: json['id'],
      titre: json['titre'],
      contenu: json['contenu'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titre': titre,
      'contenu': contenu,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }
}

class ElectoralModel {
  int? currentPage;
  List<ElectoralData>? data;
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

  ElectoralModel(
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

  ElectoralModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ElectoralData>[];
      json['data'].forEach((v) {
        data?.add(ElectoralData.fromJson(v));
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
