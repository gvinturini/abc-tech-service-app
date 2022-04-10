import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:abctechapp/model/order_location.dart';

class Order {
  int operatorId;
  List<int> services;
  Order({
    required this.operatorId,
    required this.services,
    required this.startLocation,
    required this.endLocation,
  });
  OrderLocation startLocation;
  OrderLocation endLocation;

  Order copyWith({
    int? operatorId,
    List<int>? services,
  }) {
    return Order(
      operatorId: operatorId ?? this.operatorId,
      services: services ?? this.services,
      startLocation: startLocation,
      endLocation: endLocation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'operatorId': operatorId,
      'services': services,
      'startLocation': startLocation,
      'endLocation': endLocation,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      operatorId: map['operatorId']?.toInt() ?? 0,
      services: List<int>.from(map['services']),
      startLocation: map['startLocation'],
      endLocation: map['endLocation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() => 'Order(operatorId: $operatorId, services: $services)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        other.operatorId == operatorId &&
        listEquals(other.services, services);
  }

  @override
  int get hashCode => operatorId.hashCode ^ services.hashCode;
}
