

import 'package:flutter/material.dart';

sealed class LanguageEvent{}

class LoadLocalizationEvent extends LanguageEvent{
  final Locale locale;

  LoadLocalizationEvent({required this.locale});
}

class LoadSavedLocalizationEvent extends LanguageEvent{}