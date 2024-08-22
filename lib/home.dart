import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:yachaq/utils/helpersviewBlancoSelect.dart';
import 'package:yachaq/utils/language.dart';
import 'package:yachaq/ui/general/general.dart';
import 'package:yachaq/ui/pension/pension_pago.dart';
import 'package:yachaq/ui/frecuentes/frecuentes.dart';
import 'package:yachaq/ui/requisitos/requisitos.dart';
import 'package:yachaq/utils/colors.dart';
import 'package:yachaq/utils/resources.dart';



class HomePage extends StatefulWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (context) => HomePage());

  //IDIOMA CAMBIAR
  List<String> listIdiomas = [
    "Español",
    "Quechua",
    "Aymara",
  ];
  TextEditingController idiomaCtrl = TextEditingController();

  @override
  State<StatefulWidget> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    _localization.init(
      mapLocales: [
        const MapLocale(
          'en',
          AppLocale.EN,
          countryCode: 'US',
          fontFamily: 'Font EN',
        ),
        const MapLocale(
          'km',
          AppLocale.KM,
          countryCode: 'KH',
          fontFamily: 'Font KM',
        ),
        const MapLocale(
          'ja',
          AppLocale.JA,
          countryCode: 'JP',
          fontFamily: 'Font JA',
        ),
      ],
      initLanguageCode: 'en',
    );
    /*
    _localization.init(
      mapLocales: [
        const MapLocale(
          'es',
          Traductor.ES,
          countryCode: 'PE',
          fontFamily: 'Font EN',
        ),
        const MapLocale(
          'ay',
          Traductor.AY,
          countryCode: 'PE',
          fontFamily: 'Font EN',
        ),
        const MapLocale(
          'qe',
          Traductor.QE,
          countryCode: 'PE',
          fontFamily: 'Font EN',
        ),
      ],
      initLanguageCode: 'ay',
    );*/

    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      home: const FormUI(),
      theme: ThemeData(fontFamily: _localization.fontFamily),
    );
  }


}

class FormUI extends StatefulWidget {
  const FormUI({super.key});

  @override
  State<FormUI> createState() => _FormUI();
}

class _FormUI extends State<FormUI> {
  final FlutterLocalization _localization = FlutterLocalization.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: 420,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Resources.bg),
                fit: BoxFit.fill,
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          ////
                          /*
                        HelpersViewBlancoSelect.formItemsDesign(
                            DropdownButtonFormField(
                                items: widget.listIdiomas
                                    .map((dep) {
                                  return DropdownMenuItem(
                                    value: dep,
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        dep,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? value) async {
                                  widget.idiomaCtrl.text = value!.isEmpty || value == null ? "" : value!;
                                  setState(() {
                                    //widget.formDescVisitatexto = value!;

                                    if (value == "Español")  _localization.translate('en');
                                    if (value == "Aymara") _localization.translate('ay');
                                    if (value == "Quechua") _localization.translate('que');
                                  }
                                  );
                                },
                                /*
                                validator: (value) => HelpersViewBlancoIcon.validateField(
                                    widget.idiomaCtrl.text!,
                                    widget.ParamCondicionVisitaPresencial), */

                                isDense: true,
                                isExpanded: true,
                                hint: const Text("Condición De Visita"),
                                value: widget.listIdiomas.elementAt(widget.listIdiomas.indexOf(widget.idiomaCtrl.text) == -1 ? 0 : widget.listIdiomas.indexOf(widget.idiomaCtrl.text))
                            )
                        ),
*/

                          const SizedBox(height: 16.0),
                          Text(context.formatString(
                            AppLocale.thisIs,
                            [AppLocale.title, 'LATEST'],
                          ),),

                          Expanded(
                            child: ElevatedButton(
                              child: const Text("Español"),
                              onPressed: () {
                                _localization.translate('en', save: true);
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: ElevatedButton(
                              child: const Text('quechua'),
                              onPressed: () {
                                _localization.translate('km', save: true);
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: ElevatedButton(
                              child: const Text('aymara'),
                              onPressed: () {
                                _localization.translate('ja', save: true);
                              },
                            ),
                          ),




                          Container(
                            width: 180,
                            child: Image.asset(Resources.pension65),
                            margin: EdgeInsets.only(bottom: 30),
                          ),
                          Container(
                            width: 200,
                            child: Image.asset(Resources.midis),
                            margin: EdgeInsets.only(bottom: 100),
                          ),
                          GestureDetector(
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorsApp.colorBoton,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    )
                                  ]),
                              child: Center(
                                child: Text("Consulta general",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w300),
                                    strutStyle: StrutStyle(height: 1.2)),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context, GeneralPage.route());
                            },
                          ),
                          Padding(padding: EdgeInsets.only(top: 20)),
                          GestureDetector(
                            child: Container(
                              height: 55,
                              //padding: EdgeInsets.only(left: 80, right: 80),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: ColorsApp.colorBoton,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    )
                                  ]),
                              child: Center(
                                child: Text("Consulta de pago",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w300),
                                    strutStyle: StrutStyle(height: 1.5)),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context, PensionPage.route());
                            },
                          ),
                          Padding(padding: EdgeInsets.only(top: 20)),
                          GestureDetector(
                              child: Container(
                                height: 55,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: ColorsApp.colorBoton,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      )
                                    ]),
                                child: Center(
                                  child: Text(
                                    "Requisitos",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w300),
                                    strutStyle: StrutStyle(height: 1.2),
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(context, RequisitosPage.route());
                              }),
                          Padding(padding: EdgeInsets.only(top: 20)),
                          GestureDetector(
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: ColorsApp.colorBoton,
                                borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Preguntas frecuentes",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w300),
                                  strutStyle: StrutStyle(
                                    height: 1.2,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context, FrecuentesPage.route());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),),
    );
  }
}
