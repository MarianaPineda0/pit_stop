// To parse this JSON data, do
//
//     final raceInterval = raceIntervalFromJson(jsonString);

import 'dart:convert';

List<RaceInterval> raceIntervalFromJson(String str) => List<RaceInterval>.from(json.decode(str).map((x) => RaceInterval.fromJson(x)));

String raceIntervalToJson(List<RaceInterval> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RaceInterval {
    final int driverNumber;
    final double gapToLeader;
    final double interval;
    final String driverImageUrl;
    final String teamColor;

    RaceInterval({
        required this.driverNumber,
        required this.gapToLeader,
        required this.interval,
        required this.driverImageUrl,
        required this.teamColor
    });

    factory RaceInterval.fromJson(Map<String, dynamic> json) => RaceInterval(
        driverNumber: json["driver_number"],
        gapToLeader: json["gap_to_leader"]?.toDouble(),
        interval: json["interval"]?.toDouble(),
        driverImageUrl: json["driver_image_url"],
        teamColor: json["team_color"]
    );

    Map<String, dynamic> toJson() => {
        "driver_number": driverNumber,
        "gap_to_leader": gapToLeader,
        "interval": interval,
        "driver_image_url": driverImageUrl,
        "team_color": teamColor
    };
}
