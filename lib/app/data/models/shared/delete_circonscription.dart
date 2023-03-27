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
