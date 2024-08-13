import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:yachaq/data/response/consulta_general.response.dart';
import 'package:yachaq/data/response/descripcion_general.response.dart';
import 'package:yachaq/nav_bar.dart';
import 'package:yachaq/utils/colors.dart';
import 'package:yachaq/utils/resources.dart';
import 'package:yachaq/ui/requisitos/requisitos.dart';

class NotFoundUserInformationPage extends StatefulWidget {
  ConsultaGeneralResponse userInfo;
  DescripcionGeneralResponse descriptionResponse;

  NotFoundUserInformationPage(this.userInfo, this.descriptionResponse);

  static Route<dynamic> route(ConsultaGeneralResponse userInformation,
          DescripcionGeneralResponse dscptnResponse) =>
      MaterialPageRoute(
          builder: (context) =>
              NotFoundUserInformationPage(userInformation, dscptnResponse));

  @override
  _NotFoundUserInformationPageState createState() =>
      _NotFoundUserInformationPageState();
}

class _NotFoundUserInformationPageState
    extends State<NotFoundUserInformationPage> {
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
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text("DNI ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal)),
                          ),
                          Flexible(
                              child: Text(
                            "NO encontrado",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    Container(
                      //padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(38.0)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(Resources.close_red,
                              width: 55, height: 55, fit: BoxFit.contain),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 2),
                                ),
                                Text("Usuario(a)",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w300),
                                    strutStyle: StrutStyle(height: 1.2)),
                                Text("no encontrado",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                    strutStyle: StrutStyle(height: 1.2)),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 2),
                                ),
                              ]),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                    ),
                    Text(
                        "No cumples con los requisitos de ingreso a Pensión 65",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        strutStyle: StrutStyle(height: 1.2),
                        textAlign: TextAlign.center),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Flexible(
                        child: Html(
                          data:
                              "<h3>Consulta tu clasificación socieconómica aquí<b><a href=https://bit.ly/3rz7OKV target=_blank>https://bit.ly/3rz7OKV</a></b></h3>",
                        ),
                      )
                    ]),
                    Padding(
                      padding: EdgeInsets.only(bottom: 60),
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
}
