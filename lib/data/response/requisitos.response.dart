class RequisitosResponse {
  String? size;
  String? icon;
  String? image;
  String? description;
  String? enlace;

  RequisitosResponse(
      {this.size, this.icon, this.image, this.description, this.enlace});

  factory RequisitosResponse.fromJson(dynamic json) {
    return RequisitosResponse(
        size: json['size'],
        icon: json['icono'],
        image: json['image'],
        description: json['descripcion'],
        enlace:
            json['enlace'].toString().isEmpty == true || json['enlace'] == null
                ? ''
                : json['enlace']);
  }

  static List<RequisitosResponse> listFromJson(dynamic json) {
    var requisitosList = json as List;
    List<RequisitosResponse> items = requisitosList
        .map((item) => RequisitosResponse.fromJson(item))
        .toList();
    items.removeAt(0);
    return items ?? [];
  }

  Map<String, dynamic> toJson() {
    return {
      "size": size,
      "icon": icon,
      "image": image,
      "description": description,
      "enlace": enlace,
    };
  }
}
