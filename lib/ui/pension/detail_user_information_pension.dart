import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:yachaq/data/response/consulta_pension.response.dart';
import 'package:yachaq/data/response/descripcion.response.dart';
import 'package:yachaq/nav_bar.dart';
import 'package:yachaq/utils/colors.dart';
import 'package:yachaq/utils/resources.dart';

class UserInformationPensionPage extends StatefulWidget {
  ConsultaPensionResponse userInfo;
  DescripcionResponse descriptionInfo;

  UserInformationPensionPage(this.userInfo, this.descriptionInfo);

  static Route<dynamic> route(ConsultaPensionResponse userInformation,
          DescripcionResponse descriptionInfo) =>
      MaterialPageRoute(
          builder: (context) =>
              UserInformationPensionPage(userInformation, descriptionInfo));

  @override
  _UserInformationPensionPageState createState() =>
      _UserInformationPensionPageState();
}

class _UserInformationPensionPageState
    extends State<UserInformationPensionPage> {
  String label = '';
  bool personaCobroShow = true;
  bool modalidadShow = false;
  bool lugarShow = false;
  bool iconoUbicacionShow = false;
  bool activeLugarPagoAgencia = false;
  bool showFechaP65 = false;
  bool showLabelYanapago = false;
  bool showLabelYanapagoAgencia = false;
  String msjLugarPagoAgencia = '';

  @override
  void initState() {
    super.initState();
    FlutterTts flutterTts = FlutterTts();
    flutterTts.setSpeechRate(0.5);
    flutterTts.setLanguage('es-ES');
    flutterTts.speak(widget.userInfo.mensaje.toString());
    var personaCobro = widget.userInfo.tercero.toString();

    if (personaCobro == null || personaCobro == "") {
      personaCobroShow = false;
    }

    if (widget.userInfo.modalidadPago == "Agencia Bancaria") {
      modalidadShow = true;
      //ShowFechaP65 = true;
      showLabelYanapagoAgencia = true;
      msjLugarPagoAgencia = widget.userInfo.lugarPago.toString();
    } else if (widget.userInfo.modalidadPago == "Transportadora" ||
        widget.userInfo.modalidadPago == 'Pago a domicilio') {
      modalidadShow = true;
      activeLugarPagoAgencia = true;
      showLabelYanapago = true;
      //msjLugarPagoAgencia = 'Transportadora ${widget.userInfo.LUGAR_AGENCIA}';
      msjLugarPagoAgencia = widget.userInfo.lugarPago.toString();
    }

    label = widget.userInfo.fechaPagoLabel.toString();
    //final date = DateFormat("yyyy-MM").parse(widget.userInfo.PERIODO);
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
                          child: Text(widget.userInfo.nombres ?? "-",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                              strutStyle: StrutStyle(height: 1.4)),
                        )
                      ],
                    ),
                    /*
                    Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(75)),
                        ),
                        child: Image.asset(Resources.pension, width: 150, height: 150)),
                     */
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                    ),
                    Text(
                      "Tienes un depósito en tu cuenta de:",
                      style: TextStyle(fontSize: 18),
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
                          Image.asset(Resources.check_green,
                              width: 55, height: 55, fit: BoxFit.contain),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                ),
                                Text(
                                    "S/ " +
                                        int.parse(widget.userInfo.monto
                                                .toString())
                                            .toStringAsFixed(0),
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500),
                                    strutStyle: StrutStyle(height: 1.2)),
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
                        child: RichText(
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
                                text:
                                    "Autorizaste a ${widget.userInfo.tercero} para que cobre tu pensión",
                                //"La persona autorizada para realizar el cobro es: ${widget.userInfo.tercero}",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      visible: personaCobroShow,
                    ),
                    Visibility(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        visible: modalidadShow),
                    Visibility(
                        child: Align(
                          alignment: Alignment.center,
                          child: RichText(
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
                                  text: "Puedes cobrar en:",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        visible: modalidadShow),
                    Visibility(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        visible: modalidadShow),
                    Visibility(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(msjLugarPagoAgencia,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              strutStyle: StrutStyle(height: 1.2)),
                        ),
                        visible: modalidadShow),
                    Visibility(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        visible: modalidadShow),
                    Visibility(
                        child: RichText(
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
                                text: "Tu lugar de pago es:",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        visible: lugarShow),
                    Visibility(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        visible: lugarShow),
                    Visibility(
                      child: Text(widget.userInfo.lugarPago ?? "-",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          strutStyle: StrutStyle(height: 1.2)),
                      visible: lugarShow,
                    ),
                    Visibility(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                              visible: widget.userInfo.latitud != null &&
                                  widget.userInfo.longitud != null &&
                                  widget.userInfo.longitud!.isNotEmpty &&
                                  widget.userInfo.latitud!.isNotEmpty,
                              child: SizedBox(
                                width: 20,
                              )),
                          Visibility(
                              visible: widget.userInfo.latitud != null &&
                                  widget.userInfo.longitud != null &&
                                  widget.userInfo.longitud!.isNotEmpty &&
                                  widget.userInfo.latitud!.isNotEmpty,
                              child: Container(
                                  //padding: EdgeInsets.only(left: 20),
                                  child: GestureDetector(
                                child: Image.asset(Resources.location,
                                    width: 40, height: 40, fit: BoxFit.contain),
                                onTap: () {
                                  //_launchURL(widget.userInfo.LATITUD, widget.userInfo.LONGITUD);
                                },
                              ))),
                        ],
                      ),
                      visible: iconoUbicacionShow,
                    ),
                    /*
                    Visibility(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20),
                      ),
                      visible: activeLugarPagoAgencia,
                    ),
                    Visibility(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "*" + msjLugarPagoAgencia + "*",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        visible: activeLugarPagoAgencia),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    */
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    Visibility(
                      child: Align(
                        alignment: Alignment.center,
                        child: RichText(
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
                                text: label,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      visible: showFechaP65,
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
                      visible: showFechaP65,
                    ),
                    Visibility(
                      child: Padding(padding: EdgeInsets.only(bottom: 20)),
                      visible: showFechaP65,
                    ),
                    /*
                Visibility(
                  child:Align(
                      alignment: Alignment.center,
                      child: RichText(
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
                              text: 'El apoyo económico ',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            TextSpan(
                              text: widget.userInfo.FECHAPAGOLABELYANAPAY,
                              style:
                              TextStyle(fontSize: 16, color: ColorsApp.colorBoton),
                            ),
                            TextSpan(
                              text: ' será pagado junto a tu pensión',
                              style:
                              TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    visible:ShowLabelYanapago
                ),
                Visibility(
                  child:Align(
                      alignment: Alignment.center,
                      child: Container(
                        child: Text(widget.userInfo.FECHA_YANAPAY ?? "-",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            strutStyle: StrutStyle(height: 1.2)),
                      ),
                    ),
                    visible:ShowLabelYanapago
                ),

                    Visibility(
                        child:Align(
                          alignment: Alignment.center,
                          child: RichText(
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
                                  text: widget.userInfo.FECHAPAGOLABELYANAPAY,
                                  style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                                ),


                              ],
                            ),
                          ),
                        ),
                        visible:ShowLabelYanapagoAgencia
                    ),
                    Visibility(
                        child:Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: Text(widget.userInfo.FECHA_YANAPAY ?? "-",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                strutStyle: StrutStyle(height: 1.2)),
                          ),
                        ),
                        visible:ShowLabelYanapagoAgencia
                    ),
              */
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                    ),
                    Container(
                      //margin: EdgeInsets.only(left: 40, right: 40, top: 10),
                      padding: EdgeInsets.all(5),
                      //color: Colors.grey,
                      child: Text(
                        widget.descriptionInfo.infotipo.toString(),
                        style: TextStyle(
                          //color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                        strutStyle: StrutStyle(height: 1.2),
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
