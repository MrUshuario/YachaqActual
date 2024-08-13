import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:yachaq/data/response/frecuentes.response.dart';
import 'package:yachaq/dominio/frecuentes.repository.dart';
import 'package:yachaq/nav_bar.dart';
import 'package:yachaq/utils/colors.dart';
import 'package:yachaq/utils/resources.dart';
import 'package:yachaq/ui/frecuentes/frecuentes.presenter.dart';
import 'package:yachaq/ui/frecuentes/frecuentes.view.dart';

class FrecuentesPage extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => FrecuentesPage());

  @override
  _FrecuentesPage createState() => _FrecuentesPage();
}

class _FrecuentesPage extends State<FrecuentesPage> implements FrecuentesView {
  List<FrecuentesResponse> frecuentesList = [];
  PreguntasFrecuentes _preguntasFrecuentes;
  final ScrollController listScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _preguntasFrecuentes =
        PreguntasFrecuentes(frecuentesRepository: FrecuentesRepository());
    _preguntasFrecuentes.view = this;
    _preguntasFrecuentes.getFrecuentess();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Container(
      width: 420,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Resources.bg),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: frecuentesBar(context),
          ),
          body: Container(
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 20),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 222,
                height: 58,
                child: Image.asset(Resources.pension65),
                margin: EdgeInsets.only(bottom: 30),
              ),
              Expanded(
                  child: ListView.builder(
                shrinkWrap: false,
                itemCount: frecuentesList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(mainAxisSize: MainAxisSize.max, children: [
                    new ExpansionTile(
                        leading: CircleAvatar(
                          backgroundColor: ColorsApp.colorBoton,
                          foregroundColor: Colors.white,
                          radius: 12,
                          child: ClipRRect(child: Text((index + 1).toString())),
                        ),
                        title: Container(
                          child: Html(
                            data:
                                """<h3><b>${frecuentesList[index].pregunta}</b></h3>""",
                            //defaultTextStyle:  TextStyle(color: Colors.grey),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        children: <Widget>[
                          Column(children: <Widget>[
                            ListTile(
                              title: Container(
                                child: Align(
                                  child: Html(
                                    data: frecuentesList[index].respuesta,
                                    //defaultTextStyle:  TextStyle(color: Colors.grey, fontSize: 15.0,),
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                          ])
                        ])
                  ]);
                },
              )),
            ]),
          ),
        ),
      ),
    )),);
  }

  @override
  hideLoading() {}

  @override
  showLoading() {}

  @override
  onError(String message) {}

  @override
  getFrecuentess(List<FrecuentesResponse> frecuentes) {
    setState(() {
      frecuentesList = frecuentes;
    });
  }
}
