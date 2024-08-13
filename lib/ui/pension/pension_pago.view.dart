import 'package:yachaq/ui/base/default.view.dart';
import 'package:yachaq/data/response/consulta_pension.response.dart';
import 'package:yachaq/data/response/descripcion.response.dart';

abstract class PensionView extends DefaultView {
  getUserInformation(ConsultaPensionResponse userInformation,
      DescripcionResponse descriptionResponse);
}
