import 'package:yachaq/dominio/frecuentes.repository.dart';
import 'package:yachaq/ui/frecuentes/frecuentes.view.dart';

class PreguntasFrecuentes {
  FrecuentesRepository? frecuentesRepository;
  FrecuentesView? view;

  PreguntasFrecuentes({this.frecuentesRepository});

  getFrecuentess() {
    frecuentesRepository?.frecuentes(
        (frecuentesListResponse) =>
            {view?.getFrecuentess(frecuentesListResponse)},
        (message) => {view?.onError(message)});
  }
}
