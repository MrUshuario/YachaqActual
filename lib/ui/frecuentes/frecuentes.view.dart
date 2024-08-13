import 'package:yachaq/ui/base/default.view.dart';
import 'package:yachaq/data/response/frecuentes.response.dart';

abstract class FrecuentesView extends DefaultView {
  getFrecuentess(List<FrecuentesResponse> frecuentes);
}
