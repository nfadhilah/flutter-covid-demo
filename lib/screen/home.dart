import 'package:covidinfo/components/my_icon_button.dart';
import 'package:covidinfo/components/province_card_info.dart';
import 'package:covidinfo/components/spinner.dart';
import 'package:covidinfo/models/global_data_provider.dart';
import 'package:covidinfo/models/province_case.dart';
import 'package:covidinfo/models/province_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import '../components/global_card_info.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID19.ID INFO'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
//          Expanded(
//            child: Container(
//              decoration: BoxDecoration(
//                  color: Colors.redAccent,
//                  borderRadius: BorderRadius.only(
//                    bottomLeft: Radius.circular(
//                      40.0,
//                    ),
//                    bottomRight: Radius.circular(40.0),
//                  )),
//            ),
//          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Update Kasus',
                      style: kTextTitleStyle,
                    ),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    trailing: MyIconButton(
                      size: 20.0,
                      icon: Icons.refresh,
                      color: Colors.redAccent,
                      callBack: () {
                        Provider.of<GlobalDataProvider>(
                          context,
                          listen: false,
                        ).getGlobalData();
                      },
                    ),
                    title: Text(
                      'Update terakhir: ${DateTime.now().toLocal()}',
                      style: kSubtitleStyle,
                    ),
                  ),
                  GlobalCardInfo(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Kasus per Provinsi',
                      style: kTextTitleStyle,
                    ),
                  ),
                  Divider(),
                  FutureBuilder(
                    future: Provider.of<ProvinceDataProvider>(
                      context,
                      listen: false,
                    ).getProvinceData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ProvinceCardInfo();
                      } else {
                        return Spinner();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
