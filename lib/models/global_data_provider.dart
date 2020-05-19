import 'dart:collection';
import 'package:covidinfo/network/network_service.dart';
import 'package:flutter/cupertino.dart';

class GlobalData {
  String name;
  String positif;
  String sembuh;
  String meninggal;

  GlobalData({
    this.name,
    this.positif,
    this.sembuh,
    this.meninggal,
  });

  factory GlobalData.fromJson(Map<String, dynamic> json) {
    return GlobalData(
        name: json['name'],
        positif: json['positif'],
        sembuh: json['sembuh'],
        meninggal: json['meninggal']
    );
  }
}

class GlobalDataProvider extends ChangeNotifier {
  List<GlobalData> _globalDataList = [];

  UnmodifiableListView<GlobalData> get globalData {
    return UnmodifiableListView(_globalDataList);
  }

  Future getGlobalData() async {
    List<GlobalData> data = await NetworkService().getGlobalData();
    _globalDataList = data;
    notifyListeners();
  }
}
