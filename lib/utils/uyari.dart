import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void hataliEposta() {
  Fluttertoast.showToast(
      msg: "Hatalı E-mail Adresi Girdiniz.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void hataliSifre() {
  Fluttertoast.showToast(
      msg: "Hatalı Şifre Girdiniz.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void hataliEpostaSifre() {
  Fluttertoast.showToast(
      msg: "Email Adresiniz veya Şifreniz Yanlış.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void EmailkayitVar() {
  Fluttertoast.showToast(
      msg: "Email Adresine Kayıtlı Kullanıcı Var.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void EmailkayitYok() {
  Fluttertoast.showToast(
      msg: "Email Adresine Kayıtlı Kullanıcı Yok. Kayıt Ol.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void KullaniciEklendi() {
  Fluttertoast.showToast(
      msg: "Kullanıcı Eklendi.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

void yanlisSifre() {
  Fluttertoast.showToast(
      msg: "Yanlış Şifre Girdiniz.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}