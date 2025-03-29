// To parse this JSON data, do
//
//     final raceControlMessage = raceControlMessageFromJson(jsonString);

import 'dart:convert';

List<RaceControlMessage> raceControlMessageFromJson(String str) => List<RaceControlMessage>.from(json.decode(str).map((x) => RaceControlMessage.fromJson(x)));

String raceControlMessageToJson(List<RaceControlMessage> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RaceControlMessage {
    final String message;
    final String category;
    final DateTime date;

    RaceControlMessage({
        required this.message,
        required this.category,
        required this.date,
    });

    factory RaceControlMessage.fromJson(Map<String, dynamic> json) => RaceControlMessage(
        message: json["message"],
        category: json["category"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "category": category,
        "date": date.toIso8601String(),
    };
}
