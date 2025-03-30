// To parse this JSON data, do
//
//     final car = carFromJson(jsonString);

import 'dart:convert';

List<Car> carFromJson(String str) => List<Car>.from(json.decode(str).map((x) => Car.fromJson(x)));

String carToJson(List<Car> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Car {
    final int driverNumber;
    final int speed;
    final int throttle;
    final int brake;
    final int drs;
    final int nGear;
    final int rpm;
    final DateTime date;

    Car({
        required this.driverNumber,
        required this.speed,
        required this.throttle,
        required this.brake,
        required this.drs,
        required this.nGear,
        required this.rpm,
        required this.date
    });

    factory Car.fromJson(Map<String, dynamic> json) => Car(
        driverNumber: json["driver_number"],
        speed: json["speed"],
        throttle: json["throttle"],
        brake: json["brake"],
        drs: json["drs"],
        nGear: json["n_gear"],
        rpm: json["rpm"],
        date: DateTime.parse(json["date"])
    );

    Map<String, dynamic> toJson() => {
        "driver_number": driverNumber,
        "speed": speed,
        "throttle": throttle,
        "brake": brake,
        "drs": drs,
        "n_gear": nGear,
        "rpm": rpm,
        "date": date.toIso8601String()
    };
}
