import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/cubit/main_cubit.dart';
import 'package:flutter_localization/language/app_translation.dart';
import 'package:flutter_localization/language/app_translation_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'cubit/main_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  MainCubit mainCubit = MainCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
        bloc: mainCubit,
        builder: (context, state) {
          if (state is MainStateOnLanguageChange) {
            return MaterialApp(
              title: 'Flutter Demo',
              locale: state.locale,
              localizationsDelegates: [
                AppTranslationDelegate(newLocale: state.locale),
                //provides localised strings
                GlobalMaterialLocalizations.delegate,
                //provides RTL support
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                const Locale("en", "US"),
                const Locale("gu", "IN"),
                const Locale("hi", "IN"),
              ],
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: MyHomePage(mainCubit: mainCubit),
            );
          } else {
            return Container();
          }
        });
  }
}

class MyHomePage extends StatefulWidget {
  MainCubit mainCubit;
  MyHomePage({Key? key, required this.mainCubit}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Change Language"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppTranslations.of(context)!.getStringByKey("lastname"),
            ),
            Text(
              AppTranslations.of(context)!.getStringByKey("surname"),
            ),
            Text(
              AppTranslations.of(context)!.getStringByKey("name"),
            ),
            SizedBox(height: 24),
            ElevatedButton(
                onPressed: () {
                  widget.mainCubit.changeLanguage(Locale("en", "US"));
                },
                child: Text( AppTranslations.of(context)!.getStringByKey("change_to_english"))),
            ElevatedButton(
                onPressed: () {
                  widget.mainCubit.changeLanguage(Locale("hi", "IN"));
                },
                child: Text(AppTranslations.of(context)!.getStringByKey("change_to_gujrati"))),
          ],
        ),
      ),
    );
  }
}
