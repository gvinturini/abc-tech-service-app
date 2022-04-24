import 'dart:convert';

import 'package:abctechapp/model/order_location.dart';

class Order {
  int operatorId;
  List<int> services = [];
  OrderLocation? startLocation;
  OrderLocation? endLocation;
  Order({
    required this.operatorId,
    required this.services,
    required this.startLocation,
    required this.endLocation,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'operatorId': operatorId,
      'services': services,
      'startLocation': startLocation?.toMap(),
      'endLocation': endLocation?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());
}
