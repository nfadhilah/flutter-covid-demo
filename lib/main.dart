import 'package:covidinfo/models/global_data_provider.dart';
import 'package:covidinfo/models/loader_service.dart';
import 'package:covidinfo/models/province_data_provider.dart';
import 'package:covidinfo/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GlobalDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProvinceDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoaderService(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(accentColor: Colors.redAccent),
        home: HomeScreen(),
      ),
    );
  }
}
