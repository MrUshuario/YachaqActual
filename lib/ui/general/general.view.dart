import 'package:yachaq/ui/base/default.view.dart';
import 'package:yachaq/data/response/consulta_general.response.dart';
import 'package:yachaq/data/response/descripcion_general.response.dart';

abstract class GeneralView extends DefaultView {
  getUserInformation(ConsultaGeneralResponse userInformation,
      DescripcionGeneralResponse descriptionResponse);
}
