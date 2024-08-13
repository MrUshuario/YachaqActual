import 'package:yachaq/data/http_api_rest.dart';
import 'package:yachaq/dominio/frecuentes.usecase.dart';
import 'package:yachaq/data/response/frecuentes.response.dart';

class FrecuentesRepository implements FrecuentessUseCase {
  @override
  frecuentes(
      Function(List<FrecuentesResponse>) onSuccess, Function(String) onError) {
    HttpResponse.get(
        "https://movil.pension65.gob.pe/bonos/wsconsultafrecuentes.php",
        (response) => onSuccess(FrecuentesResponse.listFromJson(response)),
        (message) => onError(message));
  }
}
