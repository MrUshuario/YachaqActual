import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:yachaq/data/response/consulta_pension.response.dart';
import 'package:yachaq/data/response/descripcion.response.dart';
import 'package:yachaq/nav_bar.dart';
import 'package:yachaq/utils/colors.dart';
import 'package:yachaq/utils/resources.dart';

class NoUserInformationPensionPage extends StatefulWidget {
  ConsultaPensionResponse userInfo;
  DescripcionResponse descriptionInfo;

  NoUserInformationPensionPage(this.userInfo, this.descriptionInfo);

  static Route<dynamic> route(ConsultaPensionResponse userInformation,
          DescripcionResponse descriptionResponse) =>
      MaterialPageRoute(
          builder: (context) => NoUserInformationPensionPage(
              userInformation, descriptionResponse));

  @override
  _NoUserInformationPensionPageState createState() =>
      _NoUserInformationPensionPageState();
}

class _NoUserInformationPensionPageState
    extends State<NoUserInformationPensionPage> {
  String label = '';
  bool modalidadShow = true;
  bool lugarpagoShow = true;
  bool iconShow = true;
  bool fechapagoShow = true;
  bool personaCobroShow = true;
  bool infraclabelmontoShow = true;

  @override
  void initState() {
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setSpeechRate(0.5);
    flutterTts.speak(widget.userInfo.mensaje.toString());
    var condicion = widget.userInfo.condicion.toString();
    var personaCobro = widget.userInfo.tercero.toString();

    if (condicion == "INFRACTOR") {
      modalidadShow = false;
      lugarpagoShow = false;
      iconShow = false;
      fechapagoShow = false;
      infraclabelmontoShow = false;
    }

    if (personaCobro == null || personaCobro == "") {
      personaCobroShow = false;
    }

    label = widget.userInfo.fechaPagoLabel;
  }

  @override
  void dispose() {
    super.dispose();
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
            child: pensionBar(context),
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
                              strutStyle: StrutStyle(height: 1.4)),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Visibility(
                      child: Text(
                        widget.userInfo.monto.isNotEmpty
                            ? "Tienes un depósito en tu cuenta"
                            : "Lamentablemente usted",
                        style: TextStyle(fontSize: 16),
                      ),
                      visible: infraclabelmontoShow,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
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
                                Text(widget.userInfo.condicion.toString(),
                                    style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w300),
                                    strutStyle: StrutStyle(height: 1.2)),
                                Text(
                                    "S/. " +
                                        int.parse(widget.userInfo.monto
                                                .toString())
                                            .toStringAsFixed(0),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: ColorsApp.colorBoton),
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
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Icon(Icons.arrow_right_sharp,
                                size: 30, color: ColorsApp.colorBoton),
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          TextSpan(
                            text: 'Periodo:',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                    ),
                    Text(widget.userInfo.periodo ?? "-",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        strutStyle: StrutStyle(height: 1.2)),
                    Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      visible: personaCobroShow,
                    ),
                    Visibility(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "La persona autorizada para realizar el cobro es : ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      visible: personaCobroShow,
                    ),
                    Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      visible: personaCobroShow,
                    ),
                    Visibility(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(widget.userInfo.tercero ?? "-",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            strutStyle: StrutStyle(height: 1.2)),
                      ),
                      visible: personaCobroShow,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    Visibility(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Tu modalidad de pago es:",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      visible: modalidadShow,
                    ),
                    Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      visible: modalidadShow,
                    ),
                    Visibility(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(widget.userInfo.modalidadPago ?? "-",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            strutStyle: StrutStyle(height: 1.2)),
                      ),
                      visible: modalidadShow,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    Visibility(
                      child: Text(
                        "Tu lugar de pago es:",
                        style: TextStyle(fontSize: 16),
                      ),
                      visible: lugarpagoShow,
                    ),
                    Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      visible: lugarpagoShow,
                    ),
                    Visibility(
                      child: Text(widget.userInfo.lugarPago ?? "-",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          strutStyle: StrutStyle(height: 1.2)),
                      visible: lugarpagoShow,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    Visibility(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                              visible: widget.userInfo.latitud != null &&
                                  widget.userInfo.longitud != null &&
                                  widget.userInfo.longitud.isNotEmpty &&
                                  widget.userInfo.latitud.isNotEmpty,
                              child: SizedBox(
                                width: 20,
                              )),
                          Visibility(
                              visible: widget.userInfo.latitud != null &&
                                  widget.userInfo.longitud != null &&
                                  widget.userInfo.longitud.isNotEmpty &&
                                  widget.userInfo.latitud.isNotEmpty,
                              child: Container(
                                  //padding: EdgeInsets.only(left: 20),
                                  child: GestureDetector(
                                child: Image.asset(Resources.location,
                                    width: 40, height: 40, fit: BoxFit.contain),
                                onTap: () {
                                  //_launchUrl(widget.userInfo.LATITUD, widget.userInfo.LONGITUD);
                                },
                              ))),
                        ],
                      ),
                      visible: iconShow,
                    ),
                    Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      visible: fechapagoShow,
                    ),
                    Visibility(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          label,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      visible: fechapagoShow,
                    ),
                    Visibility(
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          child: Text(widget.userInfo.fechaPago ?? "-",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              strutStyle: StrutStyle(height: 1.2)),
                        ),
                      ),
                      visible: fechapagoShow,
                    ),
                    Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      visible: fechapagoShow,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: ColorsApp.colorBoton,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            )
                          ]),
                      child: Center(
                        child: Text(widget.descriptionInfo.infotipo.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            strutStyle: StrutStyle(height: 1.2)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )));
  }
/*
  _launchURL(latitude, longitude) async {
    var url =
        'https://www.google.com/maps/search/?api=1&query=${latitude},${longitude}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
*/
}
