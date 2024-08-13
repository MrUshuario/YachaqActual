import 'package:yachaq/data/response/consulta_general.response.dart';
import 'package:yachaq/data/response/consulta_pension.response.dart';
import 'package:yachaq/data/response/descripcion.response.dart';
import 'package:yachaq/data/response/descripcion_general.response.dart';

abstract class ConsultaUseCase {
  consultaGeneral(
      String dni,
      String fnac,
      Function(ConsultaGeneralResponse, DescripcionGeneralResponse) onSuccess,
      Function(String) onError);

  consultaPension(
      String dni,
      String fnac,
      Function(ConsultaPensionResponse, DescripcionResponse) onSuccess,
      Function(String) onError);
}
