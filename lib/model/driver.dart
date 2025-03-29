import 'dart:convert';

List<Driver> driverFromJson(String str) => List<Driver>.from(json.decode(str).map((x) => Driver.fromJson(x)));

String driverToJson(List<Driver> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Driver {
    final int driverNumber;
    final String fullName;
    final String countryCode;
    final String teamName;
    final String teamColour;
    final String headshotUrl;


    Driver({
        required this.driverNumber,
        required this.fullName,
        required this.countryCode,
        required this.teamName,
        required this.teamColour,
        required this.headshotUrl
    });

    factory Driver.fromJson(Map<String, dynamic> json) => Driver(
        driverNumber: json["driver_number"],
        fullName: json["full_name"],
        countryCode: json["country_code"],
        teamName: json["team_name"],
        teamColour: json["team_colour"],
        headshotUrl: json["headshot_url"]
    );

    Map<String, dynamic> toJson() => {
        "driver_number": driverNumber,
        "full_name": fullName,
        "country_code": countryCode,
        "team_name": teamName,
        "team_colour": teamColour,
        "headshot_url": headshotUrl
    };
}