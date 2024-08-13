import 'package:yachaq/data/response/requisitos.response.dart';

abstract class RequisitosUseCase {
  requisitos(
      Function(List<RequisitosResponse>) onSuccess, Function(String) onError);
}
