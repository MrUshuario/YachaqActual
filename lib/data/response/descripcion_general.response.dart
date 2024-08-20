class DescripcionGeneralResponse {
  String? description;

  DescripcionGeneralResponse({this.description});

  factory DescripcionGeneralResponse.fromJson(dynamic json) {
    return DescripcionGeneralResponse(
      description: json['DESCRIPCION'].toString().isEmpty == true ||
              json['DESCRIPCION'] == null
          ? ''
          : json['DESCRIPCION'].toString(),
    );
  }
}
