import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/cubit/main_state.dart';

class MainCubit extends Cubit<MainState>{
  MainCubit():super(MainStateInit(

  )){
    changeLanguage(Locale("hi", "IN"));
  }

  changeLanguage(Locale locale){
    emit(MainStateOnLanguageChange(locale));
  }

}