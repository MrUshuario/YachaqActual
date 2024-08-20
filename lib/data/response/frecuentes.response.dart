class FrecuentesResponse {
  String? pregunta;
  String? respuesta;

  FrecuentesResponse({this.pregunta, this.respuesta});

  factory FrecuentesResponse.fromJson(dynamic json) {
    return FrecuentesResponse(
      pregunta: json['pregunta'].toString().isEmpty == true ||
              json['pregunta'] == null
          ? ''
          : json['pregunta'],
      respuesta: json['respuesta'].toString().isEmpty == true ||
              json['respuesta'] == null
          ? ''
          : json['respuesta'],
    );
  }

  static List<FrecuentesResponse> listFromJson(dynamic json) {
    var frecuentesList = json as List;
    List<FrecuentesResponse> items = frecuentesList
        .map((item) => FrecuentesResponse.fromJson(item))
        .toList();

    return items ?? [];
  }

  Map<String, dynamic> toJson() {
    return {
      "pregunta": pregunta,
      "respuesta": respuesta,
    };
  }
}
