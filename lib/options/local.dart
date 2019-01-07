import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class MyLocalizationsDelegates extends LocalizationsDelegate<MaterialLocalizations>{
  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<MaterialLocalizations> load(Locale locale) =>SynchronousFuture(_MyLocalizations());


  @override
  bool shouldReload(LocalizationsDelegate<MaterialLocalizations> old) =>false;
}

class _MyLocalizations extends DefaultMaterialLocalizations{

  @override
  String get searchFieldLabel => '搜索';

}