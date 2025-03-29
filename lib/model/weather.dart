// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

List<Weather> weatherFromJson(String str) => List<Weather>.from(json.decode(str).map((x) => Weather.fromJson(x)));

String weatherToJson(List<Weather> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Weather {
    final double airTemperature;
    final double trackTemperature;
    final DateTime date;

    Weather({
        required this.airTemperature,
        required this.trackTemperature,
        required this.date,
    });

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        airTemperature: json["air_temperature"]?.toDouble(),
        trackTemperature: json["track_temperature"]?.toDouble(),
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "air_temperature": airTemperature,
        "track_temperature": trackTemperature,
        "date": date.toIso8601String(),
    };
}
