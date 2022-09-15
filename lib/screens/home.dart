import 'dart:convert';
import '../candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/services/candle_service.dart';
import '../models/data_map.dart';
import '../widgets/candle_sticks.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Candle> candles = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  //========== INSTAGRAM: @lumberjack_programmer ===========//
  //========== GITHUB: @lumberjack-programmer =============//
  //================== FOLLOW FOR MORE ===================//


  Future<void> getData() async {
    CandleService candleService = CandleService();
    var data = await candleService.fetchCandles();
    var test = DataMap.fromJson(jsonDecode(data.body));

    setState(() {
      test.data.forEach((key, value) => candles.add(Candle(date: DateTime.parse(key), high: double.parse(value['2. high']),
          low: double.parse(value['3. low']), open: double.parse(value['1. open']), close: double.parse(value['4. close']),
          volume: double.parse(value['5. volume']))));
    });

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
              splashRadius: 20.0,
              onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Home()));
              },
              icon: Icon(
                Icons.update,
              ),
            )
          ],
        ),
        backgroundColor: Color(0xff170312),

        body: candles.isEmpty ? const Center(child: CircularProgressIndicator())  : Center(
          child: Candlesticks(
            candles: candles,
          ),
        ),
      ),
    );
  }
}
