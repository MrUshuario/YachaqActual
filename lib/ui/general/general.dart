import 'dart:math';

import 'detail_no_user_information.dart';
import 'detail_not_found_user_information.dart';
import 'detail_user_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hb_check_code/hb_check_code.dart';
import 'package:yachaq/data/response/consulta_general.response.dart';
import 'package:yachaq/data/response/descripcion_general.response.dart';
import 'package:yachaq/dominio/consultas.repository.dart';
import 'package:yachaq/nav_bar.dart';
import 'package:yachaq/ui/dialog/dialog_helper.dart';
import 'package:yachaq/ui/general/general.presenter.dart';
import 'package:yachaq/ui/general/general.view.dart';
import 'package:yachaq/utils/colors.dart';
import 'package:yachaq/utils/resources.dart';

class GeneralPage extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => GeneralPage());

  @override
  _GeneralPageState createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> implements GeneralView {
  String code = "";
  String verifyResult = "";
  String monthValue = "enero";
  String monthKeyValue = "01";
  List<String> monthList = [
    "enero",
    "febrero",
    "marzo",
    "abril",
    "mayo",
    "junio",
    "julio",
    "agosto",
    "septiembre",
    "octubre",
    "noviembre",
    "diciembre"
  ];
  //String selectedDate;
  String selectedDateFormat;

  //String CAPTCHA_SITE_KEY = "6LfUzY4aAAAAAB_L4wPTRFfHpU_lWy6yq7sddIfm";
  //RecaptchaV2Controller recaptchaV2Controller = RecaptchaV2Controller();
  TextEditingController _dni = TextEditingController();
  TextEditingController _captchacode = TextEditingController();
  TextEditingController dayValue = TextEditingController();
  TextEditingController yearValue = TextEditingController();
  GeneralPresenter generalPresenter;

  @override
  void initState() {
    monthValue = getMonthByKey(DateTime.now().month.toString());
    monthKeyValue = getKeyByMonth(monthValue);
    dayValue.text = DateTime.now().day < 10
        ? "0" + DateTime.now().day.toString()
        : DateTime.now().day.toString();
    yearValue.text = (DateTime.now().year - 65).toString();

    generalPresenter =
        GeneralPresenter(consultasRepository: ConsultasRepository());
    generalPresenter.view = this;

    refreshCaptchaNumeric();

    super.initState();
    //recaptchaV2Controller.show();
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
                      child: generalBar(context),
                    ),
                    body: ListView(children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 40, right: 40),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 200,
                                child: Image.asset(Resources.pension65),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 50)),
                            Text(
                              "Consulta si eres usuaria o usuario",
                              style: TextStyle(
                                  fontSize: 17.5, color: ColorsApp.grayDark),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 20),
                            ),
                            TextField(
                                controller: _dni,
                                autocorrect: false,
                                enableSuggestions: false,
                                maxLength: 8,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Ingresa tu DNI",
                                  prefixIcon:
                                      Image.asset(Resources.req2, scale: 2),
                                  contentPadding: EdgeInsets.all(14.0),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0),
                                  ),
                                )),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Ingresa tu fecha de nacimiento",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w200),
                                  strutStyle: StrutStyle(height: 1.2)),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: TextField(
                                        controller: dayValue,
                                        autocorrect: false,
                                        enableSuggestions: false,
                                        maxLength: 2,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(14.0),
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 0),
                                          ),
                                        )),
                                    flex: 2),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                      height: 48,
                                      alignment: Alignment.topCenter,
                                      child: DropdownButtonFormField(
                                        iconSize: 0,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(12.0),
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 0),
                                          ),
                                        ),
                                        value: monthValue,
                                        onChanged: (value) {
                                          setState(() {
                                            monthValue = value.toString();
                                            monthKeyValue =
                                                getKeyByMonth(monthValue);
                                            print(monthValue);
                                            print(monthKeyValue);
                                          });
                                        },
                                        items: monthList
                                            .map((month) => DropdownMenuItem(
                                                value: month,
                                                child: Text("$month")))
                                            .toList(),
                                      ),
                                    ),
                                    flex: 4),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: TextField(
                                        controller: yearValue,
                                        autocorrect: false,
                                        enableSuggestions: false,
                                        maxLength: 4,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(14.0),
                                          filled: true,
                                          fillColor: Colors.white,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8.0)),
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 0),
                                          ),
                                        )),
                                    flex: 3),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding: EdgeInsets.all(2),
                                    child: HBCheckCode(
                                      code: code,
                                      dotCount: 0,
                                      height: 30,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color:
                                              Colors.grey, // set border color
                                          width: 1), // set border width
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    )),
                                ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.grey;
                                        }
                                        return Colors.white;
                                      }),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(38.0),
                                            side: BorderSide(
                                                color: Colors.white)),
                                      )),
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    child: Image.asset(Resources.refresh,
                                        width: 30, height: 30),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      refreshCaptchaNumeric();
                                    });
                                  },
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 20)),
                            TextField(
                                controller: _captchacode,
                                autocorrect: false,
                                enableSuggestions: false,
                                maxLength: 4,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(14.0),
                                  hintText: ("Ingresa el número captcha"),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 0),
                                  ),
                                )),
                            Padding(padding: EdgeInsets.only(bottom: 20)),
                            Container(
                              height: 36,
                              width: 100,
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                )
                              ]),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors.grey;
                                      }
                                      return ColorsApp.colorBoton;
                                    }),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          side: BorderSide(
                                              color: ColorsApp.colorBoton,
                                              width: 1)),
                                    )),
                                child: Container(
                                  child: const Center(
                                    child: Text(
                                      "Buscar",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w100),
                                      strutStyle: StrutStyle(height: 1.2),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  validateDni();
                                },
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 50)),
                          ],
                        ),
                      )
                    ]))))),);
  }

  String getKeyByMonth(String month) {
    switch (month) {
      case "enero":
        return "01";
        break;
      case "febrero":
        return "02";
        break;
      case "marzo":
        return "03";
        break;
      case "abril":
        return "04";
        break;
      case "mayo":
        return "05";
        break;
      case "junio":
        return "06";
        break;
      case "julio":
        return "07";
        break;
      case "agosto":
        return "08";
        break;
      case "septiembre":
        return "09";
        break;
      case "octubre":
        return "10";
        break;
      case "noviembre":
        return "11";
        break;
      case "diciembre":
        return "12";
        break;
      default:
        return "";
        break;
    }
  }

  String getMonthByKey(String key) {
    switch (key) {
      case "1":
        return "enero";
        break;
      case "2":
        return "febrero";
        break;
      case "3":
        return "marzo";
        break;
      case "4":
        return "abril";
        break;
      case "5":
        return "mayo";
        break;
      case "6":
        return "junio";
        break;
      case "7":
        return "julio";
        break;
      case "8":
        return "agosto";
        break;
      case "9":
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

  refreshCaptchaNumeric() {
    code = "";
    for (var i = 0; i < 4; i++) {
      code = code + Random().nextInt(9).toString();
    }
  }

  validateDni() {
    if (_dni.text.isNotEmpty) {
      if (dayValue.text != null && dayValue.text.isNotEmpty) {
        if (monthValue != null) {
          if (yearValue.text != null && yearValue.text.isNotEmpty) {
            if (int.parse(yearValue.text) <= (DateTime.now().year - 65)) {
              selectedDateFormat =
                  yearValue.text + monthKeyValue + dayValue.text;
              if (code == _captchacode.text) {
                generalPresenter.getUserInformation(
                    _dni.text, selectedDateFormat);
              } else {
                _showErrorMessage("Consulta general",
                    "Debes ingresar el código númerico correctamente.");
              }
            } else {
              _showErrorMessage(
                  "Consulta general", "Debes tener 65 a más años.");
            }
          } else {
            _showErrorMessage("Consulta general", "Ingresa un año");
          }
        } else {
          _showErrorMessage("Consulta general", "Selecciona un mes");
        }
      } else {
        _showErrorMessage("Consulta general", "Ingresa un día");
      }
    } else {
      _showErrorMessage("Consulta general", "Ingresa tu número de DNI");
    }
  }

  Future<void> _showErrorMessage(String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title, strutStyle: StrutStyle(height: 1.2)),
          content: Text(message, strutStyle: StrutStyle(height: 1.2)),
          actions: <Widget>[
            CupertinoDialogAction(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.grey;
                      }
                      return ColorsApp.colorBoton;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    )),
                child: Container(
                  child: const Center(
                    child: Text(
                      "Ok",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w100),
                      strutStyle: StrutStyle(height: 1),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  getUserInformation(ConsultaGeneralResponse userInformation,
      DescripcionGeneralResponse descriptionResponse) {
    if (userInformation.condicion == "USUARIO" ||
        userInformation.condicion == "POTENCIAL") {
      Navigator.push(context,
          UserInformationPage.route(userInformation, descriptionResponse));
    } else if (userInformation.condicion == "NO ENCONTRADO" ||
        userInformation.condicion == "ADULTO MAYOR") {
      Navigator.push(
          context,
          NotFoundUserInformationPage.route(
              userInformation, descriptionResponse));
    } else {
      Navigator.push(context,
          NoUserInformationPage.route(userInformation, descriptionResponse));
    }
  }

  @override
  hideLoading() {
    Navigator.of(context).pop();
  }

  @override
  showLoading() {
    DialogHelper.loading(context);
  }

  @override
  onError(String message) {
    _showErrorMessage("Consulta general", message);
  }
}
