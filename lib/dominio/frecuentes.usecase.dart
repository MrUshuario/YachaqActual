import 'package:yachaq/data/response/frecuentes.response.dart';

abstract class FrecuentessUseCase {
  frecuentes(
      Function(List<FrecuentesResponse>) onSuccess, Function(String) onError);
}
