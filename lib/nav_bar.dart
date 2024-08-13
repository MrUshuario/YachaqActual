import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yachaq/utils/resources.dart';

Widget generalBar(BuildContext context) {
  return AppBar(
    centerTitle: false,
    title: Text("Consulta general",
        style: TextStyle(color: Colors.black, fontSize: 20),
        textAlign: TextAlign.left,
        strutStyle: StrutStyle(height: 1.3)),
    backgroundColor: Colors.transparent,
    leading: Padding(
      padding: EdgeInsets.all(18.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          Resources.back,
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}

Widget pensionBar(BuildContext context) {
  return AppBar(
    centerTitle: false,
    title: Text("Consulta de pago",
        style: TextStyle(color: Colors.black, fontSize: 20),
        textAlign: TextAlign.left,
        strutStyle: StrutStyle(height: 1.3)),
    backgroundColor: Colors.transparent,
    leading: Padding(
      padding: EdgeInsets.all(18.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          Resources.back,
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}

Widget requisitosBar(BuildContext context) {
  return AppBar(
    centerTitle: false,
    title: Text("Requisitos",
        style: TextStyle(color: Colors.black, fontSize: 20),
        strutStyle: StrutStyle(height: 1.3)),
    backgroundColor: Colors.transparent,
    leading: Padding(
      padding: EdgeInsets.all(18.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          Resources.back,
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}

Widget frecuentesBar(BuildContext context) {
  return AppBar(
    centerTitle: false,
    title: Text("Preguntas frecuentes",
        style: TextStyle(color: Colors.black, fontSize: 20),
        strutStyle: StrutStyle(height: 1.3)),
    backgroundColor: Colors.transparent,
    leading: Padding(
      padding: EdgeInsets.all(18.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset(
          Resources.back,
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}
