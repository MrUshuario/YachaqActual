import 'package:yachaq/ui/base/default.view.dart';
import 'package:yachaq/data/response/requisitos.response.dart';

abstract class RequisitosView extends DefaultView {
  getRequisitos(List<RequisitosResponse> requisitos);
}
