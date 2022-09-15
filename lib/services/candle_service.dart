
import 'package:http/http.dart' as http;
import 'package:stock_app/config/config.dart';

class CandleService {

   Future<http.Response> fetchCandles() async {
    final uri = Uri.parse(
        "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=$apiKey"
    );
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}