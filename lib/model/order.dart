import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:abctechapp/model/order_location.dart';

class Order {
  int operatorId;
  List<int> services = [];
  Order({
    required this.operatorId,
    required this.services,
    required this.startLocation,
    required this.endLocation,
  });
  OrderLocation? startLocation;
  OrderLocation? endLocation;

  Map<String, dynamic> toMap() {
    return {
      'operatorId': operatorId,
      'services': services,
      'startLocation': startLocation?.toMap(),
      'endLocation': endLocation?.toMap(),
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
}
