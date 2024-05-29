import 'dart:async';

import 'package:assignment9/features/settings/presentation/bloc/language_event.dart';
import 'package:assignment9/features/settings/presentation/bloc/language_event.dart';
import 'package:assignment9/features/settings/presentation/bloc/language_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageBloc extends Bloc<LanguageEvent,LanguageState>{
  LanguageBloc():super(LanguageState() )
  {
    on<LoadLocalizationEvent>(loadLocalizationEvent);
    on<LoadSavedLocalizationEvent>(loadSavedLocalizationEvent);
  }

  FutureOr<void> loadLocalizationEvent(LoadLocalizationEvent event, Emitter emit) async{
    if(event.locale == state.locale)return;
    saveLocale(event.locale);
    emit(LanguageState(locale: event.locale));
    
  }

  FutureOr<void> loadSavedLocalizationEvent(LoadSavedLocalizationEvent event, Emitter emit) async{
    Locale saveLocale  = await getLocale();
    emit(LanguageState(locale: saveLocale));
  }



saveLocale (Locale locale)async{
SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setString('language', locale.languageCode);
}

  Future<Locale> getLocale()async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('language') ?? 'en';
    print(languageCode);
    return Locale(languageCode);
  }
}