import 'package:covidinfo/components/spinner.dart';
import 'package:covidinfo/constant.dart';
import 'package:covidinfo/models/global_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'card_info_content.dart';

class GlobalCardInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<GlobalDataProvider>(context, listen: false)
          .getGlobalData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            height: 200.0,
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Consumer<GlobalDataProvider>(
                  builder: (context, data, child) {
                    return Column(
                      children: <Widget>[
                        Text(
                          data.globalData[0].name.toUpperCase(),
                          style: kTextTitleStyle,
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          children: <Widget>[
                            CardInfoContent(
                              counter: data.globalData[0].positif,
                              iconSize: 40,
                              counterSize: 40,
                              icon: Icons.mood_bad,
                              color: Colors.orangeAccent,
                              description: 'Terinfeksi',
                            ),
                            CardInfoContent(
                              counter: data.globalData[0].meninggal,
                              iconSize: 40,
                              counterSize: 40,
                              icon: Icons.sentiment_very_dissatisfied,
                              color: Colors.redAccent,
                              description: 'Meninggal',
                            ),
                            CardInfoContent(
                              iconSize: 40,
                              counterSize: 40,
                              counter: data.globalData[0].sembuh,
                              icon: Icons.sentiment_very_satisfied,
                              color: Colors.greenAccent,
                              description: 'Sembuh',
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return Spinner();
        }
      },
    );
  }
}


