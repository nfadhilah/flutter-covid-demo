import 'dart:collection';

import 'package:covidinfo/models/province_case.dart';
import 'package:covidinfo/network/network_service.dart';
import 'package:flutter/cupertino.dart';

class ProvinceDataProvider extends ChangeNotifier {
  List<ProvinceCase> _provinceCases = [];

  UnmodifiableListView<ProvinceCase> get provinceCases {
    return UnmodifiableListView<ProvinceCase>(_provinceCases);
  }

  Future getProvinceData() async {
    List<ProvinceCase> data = await NetworkService().getProvinceDate();
    _provinceCases = data;
    notifyListeners();
  }
}
