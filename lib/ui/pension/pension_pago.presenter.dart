import 'package:yachaq/ui/pension/pension_pago.view.dart';
import 'package:yachaq/dominio/consultas.repository.dart';

class PensionPresenter {
  ConsultasRepository consultasRepository;
  PensionView view;

  PensionPresenter({this.consultasRepository});

  getUserInformation(String dni, String fnac) {
    view.showLoading();
    consultasRepository.consultaPension(dni, fnac,
        (listUserInformation, descriptionInfo) {
      view.hideLoading();
      view.getUserInformation(listUserInformation, descriptionInfo);
    }, (message) {
      view.hideLoading();
      view.onError(message);
    });
  }
}
