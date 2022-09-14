class DataMap {
 final Map<String, dynamic> data;

  DataMap({
    required this.data,
  });

  factory DataMap.fromJson(Map<String, dynamic> json)  {
    return DataMap(data : json['Time Series (5min)'] as Map<String, dynamic>);
  }
}
