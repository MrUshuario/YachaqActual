class DescripcionResponse {
  String? icon;
  String? description;
  String? infotipo;

  DescripcionResponse({this.description, this.icon, this.infotipo});

  factory DescripcionResponse.fromJson(dynamic json) {
    return DescripcionResponse(
      icon: json['icono'].toString().isEmpty == true || json['icono'] == null
          ? ''
          : json['icono'].toString(),
      description: json['descripcion'].toString().isEmpty == true ||
              json['descripcion'] == null
          ? ''
          : json['descripcion'].toString(),
      infotipo: json['infotipo']
                      .toString()
                      .replaceAll(RegExp(r'^<p>|</p>'), '')
                      .isEmpty ==
                  true ||
              json['infotipo'] == null
          ? ''
          : json['infotipo'].toString().replaceAll(RegExp(r'^<p>|</p>'), ''),
    );
  }

  static List<DescripcionResponse> listFromJson(dynamic json) {
    var requisitosList = json as List;
    List<DescripcionResponse> items = requisitosList
        .map((item) => DescripcionResponse.fromJson(item))
        .toList();

    return items ?? [];
  }
}
