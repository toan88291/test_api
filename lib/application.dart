import 'package:api_reqres/api_config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertestapi/data/bloc/app_bloc.dart';
import 'dart:developer' as developer;

import 'package:fluttertestapi/data/repository/app_repository.dart';
import 'package:provider/provider.dart';

import 'page/main_page.dart';

class Application extends StatefulWidget {
  static const ROUTE_NAME = 'Application';

  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  static const TAG = 'Application';

  AppRepository _appRepository;

  @override
  void initState() {
    super.initState();
    _appRepository = AppRepository(ApiConfig.getApiService());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppBloc>(
          create: (context) {
            return AppBloc(_appRepository);
          },
          lazy: false,
        )
      ],
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
            bottomAppBarTheme: BottomAppBarTheme(
              color: Colors.blue,
            ),
            inputDecorationTheme: InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xffDADADA),
                ),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            )),
        themeMode: ThemeMode.light,
        home: MainPage(),
      ),
    );
  }
}
