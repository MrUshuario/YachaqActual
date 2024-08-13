import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:yachaq/utils/colors.dart';
import 'package:yachaq/data/response/bienvenida.response.dart';

class DialogInit extends StatefulWidget {
  final List<BienvenidaResponse> bienvenidaList;
  DialogInit({Key key, this.bienvenidaList}) : super(key: key);

  @override
  _DialogInit createState() => _DialogInit(bienvenidaList: bienvenidaList);
}

class _DialogInit extends State<DialogInit> {
  List<BienvenidaResponse> bienvenidaList;
  bool visiblemsgYanapago = false;
  _DialogInit({this.bienvenidaList});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contextBox(context),
    );
  }

  contextBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 30, top: 45, right: 20),
          margin: EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            /*boxShadow: [
              BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            ]*/
          ),
          height: 300, //370,
          child: ListView.builder(
            itemCount: bienvenidaList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Visibility(
                    visible: (index == 0) && visiblemsgYanapago ? true : false,
                    child: Align(
                      alignment: Alignment.center,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '*El apoyo económico ',
                              style: TextStyle(
                                fontSize: 18,
                                color: ColorsApp.grayDark,
                              ),
                            ),
                            TextSpan(
                              text: 'Yanapago Perú',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ColorsApp.colorBoton,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  '  será pagado junto a la subvención setiembre-octubre 2021*',
                              style: TextStyle(
                                  fontSize: 18, color: ColorsApp.grayDark),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  /*Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),*/
                  Visibility(
                    visible: (index == 0) && visiblemsgYanapago ? true : false,
                    child: Divider(
                      height: 36,
                      color: Colors.black,
                      thickness: 0.2,
                    ),
                  ),
                  Visibility(
                    visible: (index == 0) ? true : false,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        bienvenidaList[index].titulo.toString(),
                        style:
                            TextStyle(fontSize: 22, color: ColorsApp.grayDark),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      Visibility(
                        visible:
                            (bienvenidaList[index].image != "") ? true : false,
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                    "${bienvenidaList[index].image}"),
                                margin: EdgeInsets.only(bottom: 5, top: 5),
                                padding: EdgeInsets.only(right: 10))),
                      ),
                      Flexible(
                        child: Html(
                          data: bienvenidaList[index].alerta,
                        ),
                      ),
                    ]),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
