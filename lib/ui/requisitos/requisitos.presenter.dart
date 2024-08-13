import 'package:yachaq/ui/requisitos/requisitos.view.dart';
import 'package:yachaq/dominio/requisitos.repository.dart';

class RequisitosPresenter {
  RequisitosRepository requisitosRepository;
  RequisitosView view;

  RequisitosPresenter({this.requisitosRepository});

  getRequisitos() {
    requisitosRepository.requisitos(
        (requisitosListResponse) =>
            {view.getRequisitos(requisitosListResponse)},
        (message) => {view.onError(message)});
  }
}
