import 'package:abctechapp/model/order.dart';
import 'package:abctechapp/model/order_created.dart';
import 'package:abctechapp/provider/order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OrderServiceInterface {
  Future<OrderCreated> createOrder(Order order);
}

class OrderService extends GetxService implements OrderServiceInterface {
  final OrderProviderInterface _orderProvider;
  OrderService(this._orderProvider);

  @override
  Future<OrderCreated> createOrder(Order order) async {
    Response response = await _orderProvider.postOrder(order);
    try {
      if (response.hasError) {
        return Future.error(ErrorDescription('Erro na API'));
      }
      return Future.sync(
        () => OrderCreated(success: true, message: ""),
      );
    } catch (e) {
      e.printError();
      return Future.error(
        ErrorDescription('Erro não esperado'),
      );
    }
  }
}
