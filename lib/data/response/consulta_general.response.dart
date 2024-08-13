class ConsultaGeneralResponse {
  String dni;
  String nombres;
  String apellidosNombres;
  String condicion;
  String ubigeo;
  String departamento;
  String provincia;
  String distrito;
  String cse;
  String fechaVencimientoCSE;
  String descripcion;
  String ddjj;

  ConsultaGeneralResponse(
      {this.dni,
      this.nombres,
      this.apellidosNombres,
      this.condicion,
      this.ubigeo,
      this.departamento,
      this.provincia,
      this.distrito,
      this.cse,
      this.fechaVencimientoCSE,
      this.descripcion,
      this.ddjj});

  ConsultaGeneralResponse.fromJson(dynamic json) {
    dni = json['dni'].toString().isEmpty == true ? '' : json['DNI'].toString();
    nombres = json['NOMBRES'].toString().isEmpty == true
        ? ''
        : json['NOMBRES'].toString();
    apellidosNombres = json['APELLIDOS_NOMBRES'].toString().isEmpty == true
        ? ''
        : json['APELLIDOS_NOMBRES'].toString();
    condicion = json['CONDICION'].toString().isEmpty == true
        ? ''
        : json['CONDICION'].toString();
    ubigeo = json['UBIGEO'].toString().isEmpty == true
        ? ''
        : json['UBIGEO'].toString();
    departamento = json['DEPARTAMENTO'].toString().isEmpty == true
        ? ''
        : json['DEPARTAMENTO'].toString();
    provincia = json['PROVINCIA'].toString().isEmpty == true
        ? ''
        : json['PROVINCIA'].toString();
    distrito = json['DISTRITO'].toString().isEmpty == true
        ? ''
        : json['DISTRITO'].toString();
    cse = json['CSE'].toString().isEmpty == true ? '' : json['CSE'].toString();
    fechaVencimientoCSE =
        json['FECHA_VENCIMIENTO_VIGENCIA'].toString().isEmpty == true
            ? ''
            : json['FECHA_VENCIMIENTO_VIGENCIA'].toString();
    descripcion = json['DESCRIPTION'].toString().isEmpty == true
        ? ''
        : json['DESCRIPTION'].toString();
    ddjj =
        json['DDJJ'].toString().isEmpty == true ? '' : json['DDJJ'].toString();
  }

  static List<ConsultaGeneralResponse> listFromJson(dynamic json) {
    var list = json as List;
    List<ConsultaGeneralResponse> items =
        list.map((item) => ConsultaGeneralResponse.fromJson(item)).toList();

    return items ?? [];
  }
}
