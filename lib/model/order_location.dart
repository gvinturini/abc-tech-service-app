import 'dart:convert';

class OrderLocation {
  double latitude;
  double longitude;
  DateTime dateTime;
  OrderLocation({
    required this.latitude,
    required this.longitude,
    required this.dateTime,
  });

  OrderLocation copyWith({
    double? latitude,
    double? longitude,
    DateTime? dateTime,
  }) {
    return OrderLocation(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory OrderLocation.fromMap(Map<String, dynamic> map) {
    return OrderLocation(
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderLocation.fromJson(String source) =>
      OrderLocation.fromMap(json.decode(source));

  @override
  String toString() =>
      'OrderLocation(latitude: $latitude, longitude: $longitude, dateTime: $dateTime)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderLocation &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode =>
      latitude.hashCode ^ longitude.hashCode ^ dateTime.hashCode;
}
