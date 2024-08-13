import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:yachaq/data/response/consulta_general.response.dart';
import 'package:yachaq/data/response/descripcion_general.response.dart';
import 'package:yachaq/nav_bar.dart';
import 'package:yachaq/utils/resources.dart';

class UserInformationPage extends StatefulWidget {
  ConsultaGeneralResponse userInfo;
  DescripcionGeneralResponse descriptionResponse;

  UserInformationPage(this.userInfo, this.descriptionResponse);

  static Route<dynamic> route(ConsultaGeneralResponse userInformation,
          DescripcionGeneralResponse dscrptnResponse) =>
      MaterialPageRoute(
          builder: (context) =>
              UserInformationPage(userInformation, dscrptnResponse));

  @override
  _UserInformationPageState createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage> {
  String cse = '';
  String condicion;
  @override
  void initState() {
    super.initState();

    if (widget.userInfo.cse == 'Pobre Extremo' && widget.userInfo.ddjj == '1') {
      condicion = 'Potencial usuario';
      cse = 'Estás en lista de espera';
    }
    if (widget.userInfo.condicion == 'USUARIO') {
      condicion = 'Usuario';
      cse = 'Eres usuario de Pensión 65';
    }
    if (widget.userInfo.condicion == 'USUARIA') {
      condicion = 'Usuaria';
      cse = 'Eres usuaria de Pensión 65';
    }
    if (widget.userInfo.condicion == 'POTENCIAL') {
      condicion = 'Potencial usuario';
      cse = 'Estás en lista de espera';
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
                      width: 222,
                      height: 58,
                      margin: EdgeInsets.only(bottom: 77),
                      child: Image.asset(Resources.pension65),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
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
                                Text(condicion,
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
                    Text(cse,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        strutStyle: StrutStyle(height: 1.2)),
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
                            text: "Tu ubigeo es",
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
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                ),
              ),
            ),
          ),
        )));
  }

/*
  Widget _columnIconEstado(String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          value == "1"
              ? const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  //child: Icon(Icons.add_task_rounded,color: Colors.green,),
                  child: Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.green,
                  ),
                )
              : const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: Icon(
                    Icons.close,
                    color: Colors.red,
                  )),
        ],
      ),
    );
  }

  Widget _columnHeader(String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
*/
  String customFormat(String date) {
    final splitDate = date.split("-");
    final day = splitDate[0];
    final month = splitDate[1];
    //final year = (2000 + int.parse(splitDate[2])).toString();
    final year = splitDate[2];
    //final monthString = DateFormat("MMMM", "es_PE").format(DateFormat("dd MMM yyyy").parse("$day $month $year"));
    final monthString = getMonthByKey(month);
    //final dayWeek = DateFormat("EEEE", "es_PE").format(DateFormat("dd MMM yyyy").parse("$day $month $year"));
    final resultado = day + " de " + monthString + " de " + year;

    return date == null ? "" : resultado;
  }
}

String getMonthByKey(String key) {
  switch (key) {
    case "01":
      return "enero";
      break;
    case "02":
      return "febrero";
      break;
    case "03":
      return "marzo";
      break;
    case "04":
      return "abril";
      break;
    case "05":
      return "mayo";
      break;
    case "06":
      return "junio";
      break;
    case "07":
      return "julio";
      break;
    case "08":
      return "agosto";
      break;
    case "09":
      return "septiembre";
      break;
    case "10":
      return "octubre";
      break;
    case "11":
      return "noviembre";
      break;
    case "12":
      return "diciembre";
      break;
    default:
      return "";
      break;
  }
}
