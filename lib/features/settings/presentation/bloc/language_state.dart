import 'package:flutter/material.dart';



class LanguageState {
  final Locale locale;

  LanguageState({Locale? locale}) : locale = locale ?? const Locale('en');
}

//class InitialLanguageState extends LanguageState{}