class ConsultaPensionResponse {
  String dni;
  String nombres;
  String apellidosNombres;
  String sexo;
  String monto;
  String periodo;
  String tercero;
  String modalidadPago;
  String lugarPago;
  String fechaPago;
  String fechaBono;
  String fechaBonoLabel;
  String fechaPagoLabel;
  String latitud;
  String longitud;
  String condicion;
  String mensaje;

  ConsultaPensionResponse(
      {this.dni,
      this.nombres,
      this.apellidosNombres,
      this.sexo,
      this.monto,
      this.periodo,
      this.tercero,
      this.modalidadPago,
      this.lugarPago,
      this.fechaPago,
      this.fechaBono,
      this.fechaBonoLabel,
      this.fechaPagoLabel,
      this.latitud,
      this.longitud,
      this.condicion,
      this.mensaje});

  ConsultaPensionResponse.fromJson(dynamic json) {
    dni = json['DNI'].toString().isEmpty == true ? '' : json['DNI'].toString();
    nombres = json['NOMBRES'].toString().isEmpty == true
        ? ''
        : json['NOMBRES'].toString();
    apellidosNombres = json['APELLIDOS_NOMBRES'].toString().isEmpty == true
        ? ''
        : json['APELLIDOS_NOMBRES'].toString();
    sexo =
        json['SEXO'].toString().isEmpty == true ? '' : json['SEXO'].toString();
    monto = json['MONTO'].toString().isEmpty == true
        ? ''
        : json['MONTO'].toString();
    periodo = json['PERIODO'].toString().isEmpty == true
        ? ''
        : json['PERIODO'].toString();
    tercero = json['TERCERO'].toString().isEmpty == true
        ? ''
        : json['TERCERO'].toString();
    modalidadPago = json['MODALIDAD_PAGO'].toString().isEmpty == true
        ? ''
        : json['MODALIDAD_PAGO'].toString();
    lugarPago = json['LUGAR_AGENCIA'].toString().isEmpty == true
        ? ''
        : json['LUGAR_AGENCIA'].toString();
    fechaPago = json['FECHA_PAGO'].toString().isEmpty == true
        ? ''
        : json['FECHA_PAGO'].toString();
    fechaBono = json['FECHA_YANAPAY'].toString().isEmpty == true
        ? ''
        : json['FECHA_YANAPAY'].toString();
    fechaBonoLabel = json['FECHAPAGOLABELYANAPAY'].toString().isEmpty == true
        ? ''
        : json['FECHAPAGOLABELYANAPAY'].toString();
    fechaPagoLabel = json['FECHAPAGOLABEL'].toString().isEmpty == true
        ? ''
        : json['FECHAPAGOLABEL'].toString();
    latitud = json['LATITUD'].toString().isEmpty == true
        ? ''
        : json['LATITUD'].toString();
    longitud = json['LONGITUD'].toString().isEmpty == true
        ? ''
        : json['LONGITUD'].toString();
    condicion = json['CONDICION'].toString().isEmpty == true
        ? ''
        : json['CONDICION'].toString();
    mensaje = json['MENSAJE'].toString().isEmpty == true
        ? ''
        : json['MENSAJE'].toString();
  }

  static List<ConsultaPensionResponse> listFromJson(dynamic json) {
    var list = json as List;
    List<ConsultaPensionResponse> items =
        list.map((item) => ConsultaPensionResponse.fromJson(item)).toList();

    return items ?? [];
  }
}
