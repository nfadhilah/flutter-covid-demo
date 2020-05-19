import 'package:covidinfo/models/province_case.dart';
import 'package:covidinfo/models/province_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant.dart';
import 'card_info_content.dart';

class ProvinceCardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ProvinceCase> provinceCases =
        Provider.of<ProvinceDataProvider>(context).provinceCases;

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: provinceCases.length,
        itemBuilder: (context, index) {
          final provinceCase = provinceCases[index];
          return Card(
            elevation: 5.0,
            child: Container(
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      provinceCase.provinceName,
                      style: kTextTitleStyle,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        CardInfoContent(
                          icon: Icons.mood_bad,
                          description: 'Terinfeksi',
                          iconSize: 25.0,
                          counterSize: 25.0,
                          color: Colors.orangeAccent,
                          counter: provinceCase.positive.toString(),
                        ),
                        CardInfoContent(
                          icon: Icons.sentiment_very_dissatisfied,
                          iconSize: 25.0,
                          counterSize: 25.0,
                          description: 'Meninggal',
                          color: Colors.redAccent,
                          counter: provinceCase.death.toString(),
                        ),
                        CardInfoContent(
                          icon: Icons.mood_bad,
                          iconSize: 25.0,
                          counterSize: 25.0,
                          description: 'Sembuh',
                          color: Colors.greenAccent,
                          counter: provinceCase.recovered.toString(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
