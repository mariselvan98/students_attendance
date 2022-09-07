// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

const atthead = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: "Gordita",
    fontSize: 14,
    color: Color(0xff222222));
const atthead1 = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: "Gordita",
    fontSize: 16,
    color: Color(0xff222222));
const attcontent = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: "Gordita",
    fontSize: 12,
    color: Color(0xff000000));
const childsname = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: "Gordita",
    fontSize: 14,
    color: Color(0xff222222));
const childgrades = TextStyle(
    fontWeight: FontWeight.normal,
    fontFamily: "Gordita",
    fontSize: 10,
    color: Color(0xffa4a4a4));

const weekdays = TextStyle(
    letterSpacing: 1,
    color: Color(0xffa5a5a5),
    fontFamily: "Gordita",
    fontSize: 11,
    fontWeight: FontWeight.normal);
const attenTitle = TextStyle(
    color: Color(0xff251f1f),
    fontFamily: "Gordita",
    fontSize: 16,
    fontWeight: FontWeight.w700);
const month = TextStyle(
    color: Color(0xff222222),
    fontFamily: "Gordita",
    fontSize: 14,
    fontWeight: FontWeight.w500);
const nos = TextStyle(
    color: Color(0xff444444),
    fontFamily: "Gordita",
    fontSize: 14,
    fontWeight: FontWeight.w500);
const present = TextStyle(
    color: Color(0xff444444),
    fontFamily: "Gordita",
    fontSize: 12,
    fontWeight: FontWeight.w500);
const resontitle = TextStyle(
    color: Color(0xff000000),
    fontFamily: "Gordita",
    fontSize: 14,
    fontWeight: FontWeight.w500);

const resondate = TextStyle(
    color: Color(0xff222222),
    fontFamily: "Gordita",
    fontSize: 12,
    fontWeight: FontWeight.w500);

const reason = TextStyle(
    color: Color(0xff222222),
    fontFamily: "Gordita",
    fontSize: 11,
    fontWeight: FontWeight.normal);
const monthlist = TextStyle(
    color: Color(0xff222222),
    fontFamily: "Gordita",
    fontSize: 11,
    fontWeight: FontWeight.normal);
const colorinidiP =
    BoxDecoration(shape: BoxShape.circle, color: Color(0xffe1f69a));
const colorinidiA =
    BoxDecoration(shape: BoxShape.circle, color: Color(0xffffd5e6));
var decpresent = BoxDecoration(
  color: Color(0xffffd5e6),
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(4), topRight: radiusCircular(4)),
);
var decabsent = BoxDecoration(
  color: Color(0xffe1f69a),
  borderRadius: BorderRadius.only(
    bottomLeft: radiusCircular(4),
    bottomRight: radiusCircular(4),
  ),
);
var attendancedec = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(46, 81, 122, 0.12),
        blurRadius: 5,
      )
    ]);
