import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/model_class.dart';

class ProviderItem extends ChangeNotifier {

    bool loginCheck = false;

  TextEditingController nameCont = TextEditingController();

  TextEditingController emailCont = TextEditingController();

  TextEditingController passCont = TextEditingController();

  TextEditingController phoneCont = TextEditingController();

  TextEditingController loginName = TextEditingController();

  TextEditingController loginPass = TextEditingController();

  String email = '';
  String phone = '';
  String passoword = '';
  String name = '';
  String _loginName = '';
  String _loginPass = '';

  contState() {
    name = name;
    email = email;
    passoword = passoword;
    phone = phone;
    _loginName = _loginName;
    _loginPass = _loginPass;

    notifyListeners();
  }

//**************************** Shared prefernce get  ***************************** */

  Future<void> loadSavedName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString(
      'name',
    )!;
    notifyListeners();
  }

  Future<void> loadSavedEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString(
      'email',
    )!;
    notifyListeners();
  }

  Future<void> loadSavedPass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    passoword = prefs.getString(
      'pass',
    )!;
    notifyListeners();
  }

  Future<void> loadSavedPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phone = prefs.getString(
      'phone',
    )!;
    notifyListeners();
  }

//***********************************  sharedPrefGet  ****************************** */

  sharedPrefNameAdd() async {
    SharedPreferences sharePref = await SharedPreferences.getInstance();
    sharePref.setString('name', nameCont.text);
    notifyListeners();
  }

  sharedPrefEmailAdd() async {
    SharedPreferences sharePref = await SharedPreferences.getInstance();
    sharePref.setString('email', emailCont.text);
    notifyListeners();
  }

  sharedPrefpassAdd() async {
    SharedPreferences sharePref = await SharedPreferences.getInstance();
    sharePref.setString('pass', passCont.text);
    notifyListeners();
  }

  sharedPrefPhoneAdd() async {
    SharedPreferences sharePref = await SharedPreferences.getInstance();
    sharePref.setString('phone', phoneCont.text);
    notifyListeners();
  }

}
