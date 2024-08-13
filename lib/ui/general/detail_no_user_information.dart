import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yachaq/data/response/consulta_general.response.dart';
import 'package:yachaq/data/response/descripcion_general.response.dart';
import 'package:yachaq/nav_bar.dart';
import 'package:yachaq/utils/colors.dart';
import 'package:yachaq/utils/resources.dart';
import 'package:yachaq/ui/general/detail_user_information.dart';
import 'package:yachaq/ui/requisitos/requisitos.dart';

class NoUserInformationPage extends StatefulWidget {
  ConsultaGeneralResponse userInfo;
  DescripcionGeneralResponse descriptionResponse;

  NoUserInformationPage(this.userInfo, this.descriptionResponse);

  static Route<dynamic> route(ConsultaGeneralResponse userInformation,
          DescripcionGeneralResponse dscrptnResponse) =>
      MaterialPageRoute(
          builder: (context) =>
              NoUserInformationPage(userInformation, dscrptnResponse));

  @override
  _NoUserInformationPageState createState() => _NoUserInformationPageState();
}

class _NoUserInformationPageState extends State<NoUserInformationPage> {
  bool clasificacionShow = true;
  @override
  void initState() {
    super.initState();
    if (widget.userInfo.condicion == 'EX-USUARIO' ||
        widget.userInfo.condicion == 'FALLECIDO' ||
        widget.userInfo.condicion == 'FALLECIDA') {
      clasificacionShow = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: generalBar(context),
          ),
          body: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              padding:
                  EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 40),
              child: Center(
                child: Column(
                  children: [
                    Container(
                        height: 58,
                        width: 222,
                        margin: EdgeInsets.only(bottom: 77),
                        child: Image.asset(Resources.pension65)),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text("Hola, ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.normal)),
                        ),
                        Flexible(
                            child: Text(widget.userInfo.nombres.toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                                strutStyle: StrutStyle(height: 1.4)))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(38.0)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(Resources.check_green,
                              width: 55, height: 55, fit: BoxFit.contain),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5, left: 8),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.userInfo.condicion.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                    strutStyle: StrutStyle(height: 1.2))
                              ]),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                    ),
                    Visibility(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Por tu clasificación socioeconómica:",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        visible: clasificacionShow),
                    Visibility(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        visible: clasificacionShow),
                    Visibility(
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                                widget.userInfo.cse.isEmpty
                                    ? "-"
                                    : widget.userInfo.cse.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                strutStyle: StrutStyle(height: 1.2))),
                        visible: clasificacionShow),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.arrow_right_sharp,
                                size: 30, color: Colors.red),
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          TextSpan(
                            text: "Tu ubigeo es:",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Text(
                        widget.userInfo.ubigeo.isEmpty
                            ? "-"
                            : widget.userInfo.ubigeo.toString() +
                                ", " +
                                widget.userInfo.departamento.toString() +
                                ", " +
                                widget.userInfo.provincia.toString() +
                                ", " +
                                widget.userInfo.distrito.toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        strutStyle: StrutStyle(height: 1.2),
                        textAlign: TextAlign.center),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.arrow_right_sharp,
                                size: 30, color: Colors.red),
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          TextSpan(
                            text: "Tu clasificación socioeconómica vence el",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Text(
                        widget.userInfo.fechaVencimientoCSE.isEmpty
                            ? "-"
                            : customFormat(
                                widget.userInfo.fechaVencimientoCSE.toString()),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        strutStyle: StrutStyle(height: 1.2)),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: widget.descriptionResponse.description,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.grey;
                            }
                            return ColorsApp.colorBoton;
                          }),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(38.0),
                                side: BorderSide(color: Colors.red)),
                          )),
                      child: Container(
                        height: 45,
                        child: const Center(
                          child: Text(
                            " Ver requisitos ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w300),
                            strutStyle: StrutStyle(height: 1.2),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, RequisitosPage.route());
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
        )));
  }

  String customFormat(String date) {
    final splitDate = date.split("-");
    final day = splitDate[0];
    final month = splitDate[1];
    final year = splitDate[2];
    //final monthString = DateFormat("MMMM", "es_PE").format(DateFormat("dd MMM yyyy").parse("$day $month $year"));
    final monthString = getMonthByKey(month);
    //final dayWeek = DateFormat("EEEE", "es_PE").format(DateFormat("dd MMM yyyy").parse("$day $month $year"));
    final resultado = day + " de " + monthString + " del " + year;

    return date == null ? "" : resultado;
  }
}
