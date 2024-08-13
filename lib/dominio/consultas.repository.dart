import 'package:yachaq/data/http_api_rest.dart';
import 'package:yachaq/data/response/consulta_general.response.dart';
import 'package:yachaq/data/response/consulta_pension.response.dart';
import 'package:yachaq/data/response/descripcion.response.dart';
import 'package:yachaq/data/response/descripcion_general.response.dart';
import 'package:yachaq/dominio/consultas.usecase.dart';

class ConsultasRepository implements ConsultaUseCase {
  @override
  consultaGeneral(
      String dni,
      String fnac,
      Function(ConsultaGeneralResponse, DescripcionGeneralResponse) onSuccess,
      Function(String) onError) {
    HttpResponse.get(
        "https://movil.pension65.gob.pe/bonos/wsconsultageneral.php?valdni=$dni&valfnaci=$fnac",
        (response) => onSuccess(ConsultaGeneralResponse.fromJson(response[0]),
            DescripcionGeneralResponse.fromJson(response[1])),
        (message) => onError(message));
  }

  @override
  consultaPension(
      String dni,
      String fnac,
      Function(ConsultaPensionResponse, DescripcionResponse) onSuccess,
      Function(String) onError) {
    HttpResponse.get(
        "https://movil.pension65.gob.pe/bonos/wsconsultap65.php?valdni=$dni&valfnaci=$fnac",
        (response) => onSuccess(ConsultaPensionResponse.fromJson(response[0]),
            DescripcionResponse.fromJson(response[1])),
        (message) => onError(message));
  }
}
