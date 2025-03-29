// To parse this JSON data, do
//
//     final session = sessionFromJson(jsonString);

import 'dart:convert';

List<Session> sessionFromJson(String str) => List<Session>.from(json.decode(str).map((x) => Session.fromJson(x)));

String sessionToJson(List<Session> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Session {
    final int sessionKey;
    final String location;
    final String sessionName;
    final DateTime dateStart;
    final DateTime dateEnd;


    Session({
        required this.sessionKey,
        required this.location,
        required this.sessionName,
        required this.dateStart,
        required this.dateEnd,
    });

    factory Session.fromJson(Map<String, dynamic> json) => Session(
        sessionKey: json["session_key"],
        location: json["location"],
        sessionName: json["session_name"],
        dateStart: DateTime.parse(json["date_start"]),
        dateEnd: DateTime.parse(json["date_end"]),
    );

    Map<String, dynamic> toJson() => {
        "session_key": sessionKey,
        "location": location,
        "session_name": sessionName,
        "date_start": dateStart.toIso8601String(),
        "date_end": dateEnd.toIso8601String(),
    };
}
