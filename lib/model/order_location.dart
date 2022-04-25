import 'dart:convert';

class OrderLocation {
  double latitude;
  double longitude;
  DateTime datetime;
  OrderLocation({
    required this.latitude,
    required this.longitude,
    required this.datetime,
  });

  OrderLocation copyWith({
    double? latitude,
    double? longitude,
    DateTime? datetime,
  }) {
    return OrderLocation(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      datetime: datetime ?? this.datetime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'datetime': datetime.toIso8601String(),
    };
  }

  factory OrderLocation.fromMap(Map<String, dynamic> map) {
    return OrderLocation(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      datetime: DateTime.parse(map['datetime']),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderLocation.fromJson(String source) =>
      OrderLocation.fromMap(json.decode(source));

  @override
  String toString() =>
      'OrderLocation(latitude: $latitude, longitude: $longitude, datetime: $datetime)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderLocation &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.datetime == datetime;
  }

  @override
  int get hashCode =>
      latitude.hashCode ^ longitude.hashCode ^ datetime.hashCode;
}
