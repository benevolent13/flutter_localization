import 'package:flutter/material.dart';

abstract class MainState{}

class MainStateInit extends MainState{}

class MainStateOnLanguageChange extends MainState{
  Locale locale;

  MainStateOnLanguageChange(this.locale);
}