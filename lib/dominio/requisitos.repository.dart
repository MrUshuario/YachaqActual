import 'package:yachaq/data/http_api_rest.dart';
import 'package:yachaq/data/response/requisitos.response.dart';
import 'package:yachaq/dominio/requisitos.usecase.dart';

class RequisitosRepository implements RequisitosUseCase {
  @override
  requisitos(
      Function(List<RequisitosResponse>) onSuccess, Function(String) onError) {
    HttpResponse.get(
        "https://movil.pension65.gob.pe/bonos/wsconsultarq.php",
        (response) => onSuccess(RequisitosResponse.listFromJson(response)),
        (message) => onError(message));
  }
}
