import 'package:yachaq/ui/general/general.view.dart';
import 'package:yachaq/dominio/consultas.repository.dart';

class GeneralPresenter {
  ConsultasRepository consultasRepository;
  GeneralView view;

  GeneralPresenter({this.consultasRepository});

  getUserInformation(String dni, String fnac) {
    view.showLoading();
    consultasRepository.consultaGeneral(dni, fnac,
        (userInformation, descriptionResponse) {
      view.hideLoading();
      view.getUserInformation(userInformation, descriptionResponse);
    }, (message) {
      view.hideLoading();
      view.onError(message);
    });
  }
}
