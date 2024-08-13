import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:yachaq/data/response/requisitos.response.dart';
import 'package:yachaq/dominio/requisitos.repository.dart';
import 'package:yachaq/nav_bar.dart';
import 'package:yachaq/utils/colors.dart';
import 'package:yachaq/utils/resources.dart';
import 'package:yachaq/ui/requisitos/requisitos.presenter.dart';
import 'package:yachaq/ui/requisitos/requisitos.view.dart';

class RequisitosPage extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => RequisitosPage());

  @override
  _RequisitosPageState createState() => _RequisitosPageState();
}

class _RequisitosPageState extends State<RequisitosPage>
    implements RequisitosView {
  List<RequisitosResponse> requisitosList = [];
  RequisitosPresenter _requisitosPresenter;

  @override
  void initState() {
    super.initState();

    _requisitosPresenter =
        RequisitosPresenter(requisitosRepository: RequisitosRepository());
    _requisitosPresenter.view = this;
    _requisitosPresenter.getRequisitos();
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
                  child: requisitosBar(context),
                ),
                body: Container(
                  margin:
                      EdgeInsets.only(left: 15, right: 15, bottom: 0, top: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 200,
                          child: Image.asset(Resources.pension65),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 50)),
                      Text(
                        "Requisitos para acceder al Programa\nNacional de Asistencia Solidaria Pensión 65",
                        style: TextStyle(
                            fontSize: 17.5, color: ColorsApp.grayDark),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: requisitosList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 8,
                                          bottom: 8,
                                          right: 20.0,
                                          left: 20.0),
                                      //height: 100,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: (index == 4)
                                                  ? Colors.white
                                                  : ColorsApp.colorBoton,
                                              foregroundColor: Colors.white,
                                              radius: 10,
                                              child: ClipRRect(
                                                  child: Text(
                                                      (index + 1).toString())),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                height: double.parse(
                                                    requisitosList[index]
                                                        .size
                                                        .toString()),
                                                width: double.parse(
                                                    requisitosList[index]
                                                        .size
                                                        .toString()),
                                                child: Image.network(
                                                    "${requisitosList[index].image}"),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: (50 -
                                                      double.parse(
                                                          requisitosList[index]
                                                              .size
                                                              .toString()))),
                                            ),
                                            Flexible(
                                                child: Html(
                                              data: requisitosList[index]
                                                  .description,
                                              //scrollable: false,
                                            )),
                                          ]),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                );
                              })),
                      Container(
                        margin: EdgeInsets.only(left: 0, right: 0, top: 10),
                        padding: EdgeInsets.all(5),
                        child: SingleChildScrollView(
                          child: Text(
                            "Los trámites son gratuitos y sin intermediarios.\nRealízalos en la Unidad Local de Empadronamiento\n(ULE) de la municipalidad del distrito donde vives.",
                            style: TextStyle(
                                color: ColorsApp.grayDark,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                            strutStyle: StrutStyle(height: 1.2),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 3,
                          ),
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ))),);
  }

  @override
  getRequisitos(List<RequisitosResponse> requisitos) {
    setState(() {
      requisitosList = requisitos;
    });
  }

  @override
  hideLoading() {}

  @override
  showLoading() {}

  @override
  onError(String message) {}
}
