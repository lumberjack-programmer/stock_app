import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:stock_app/model/candle_model.dart';
import 'package:stock_app/services/candle_service.dart';
import '../model/data_map.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Candle> candles = [];
  bool themeIsDark = false;

  @override
  void initState() {
    super.initState();
      getData();
  }


  Future<void> getData() async {
    CandleService candleService = CandleService();
    var data = await candleService.fetchCandles();
    var test = DataMap.fromJson(jsonDecode(data.body));

    test.data.forEach((key, value) => candles.add(Candle(date: DateTime.parse(key), high: double.parse(value['2. high']),
        low: double.parse(value['3. low']), open: double.parse(value['1. open']), close: double.parse(value['4. close']),
        volume: double.parse(value['5. volume']))));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Stocker'),
          backgroundColor: Color(0xff33032f),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  themeIsDark = !themeIsDark;
                });
              },
              icon: Icon(
                themeIsDark
                    ? Icons.wb_sunny_sharp
                    : Icons.nightlight_round_outlined,
              ),
            )
          ],
        ),
        backgroundColor: Color(0xff170312),

        body: Center(
          child: Candlesticks(
            candles: candles,
          ),
        ),
      ),
    );
  }
}
