import 'package:flutter/material.dart';

class Constants {
  static List<String> columnLeft = [
    "Hutný materiál",
    "",
    "Kanalizačný materiál, liatina",
    "",
    "Vodárenský, kúrenársky materiál",
    "",
    "Liatinové, plechové, kompozitné poklopy",
    "",
    "Spojovací materiál, elektro",
    "",
    "Klampiarsky materiál",
    "",
    "Šporáky, kachle, dymovina",
    "",
    "Pletivá, siete, drôty"
  ];

  static String urlGDPR = "";

  static List<DropdownMenuItem> iconList = const [
    DropdownMenuItem(value: "info", child: Icon(Icons.info_outline_rounded)),
    DropdownMenuItem(value: "time", child: Icon(Icons.access_time_rounded)),
    DropdownMenuItem(value: "error", child: Icon(Icons.error_outline_rounded)),
  ];
}
