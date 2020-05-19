import 'package:covidinfo/models/global_data_provider.dart';
import 'package:covidinfo/models/province_case.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = 'https://api.kawalcorona.com';

class NetworkService {
  Future<List<GlobalData>> getGlobalData() async {
    print('Requesting global data...');
    final List<GlobalData> globalDataList = [];
    var response = await http.get('$baseUrl/indonesia');
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      data.forEach((element) {
        print(element);
        globalDataList.add(
          GlobalData.fromJson(element)
        );
      });
    }
    return globalDataList;
  }

  Future<List<ProvinceCase>> getProvinceDate() async {
    print('Requesting province data');
    List<ProvinceCase> provinceCases = [];
    var response = await http.get('$baseUrl/indonesia/provinsi');
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      data.forEach((element) {
        provinceCases.add(
          ProvinceCase.fromJson(element['attributes'])
        );
      });
    }
    return provinceCases;
  }
}