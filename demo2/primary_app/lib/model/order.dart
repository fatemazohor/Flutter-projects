


import 'package:primary_app/model/buyers.dart';
import 'package:primary_app/model/categories.dart';
import 'package:primary_app/model/order_status.dart';
import 'package:primary_app/model/style.dart';

class Order {
  int? id;
  String? oderDate;
  String? deliveryDate;
  String? shippingAddress;
  String? orderUniId;
  double? totalAmount;
  double? paid;
  Style? styleId;
  Buyers? buyersId;
  OrderStatus? orStatusId;
  double? samount;
  double? mamount;
  double? lamount;

  Order(
      {this.id,
        this.oderDate,
        this.deliveryDate,
        this.shippingAddress,
        this.orderUniId,
        this.totalAmount,
        this.paid,
        this.styleId,
        this.buyersId,
        this.orStatusId,
        this.samount,
        this.mamount,
        this.lamount});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    oderDate = json['oderDate'];
    deliveryDate = json['deliveryDate'];
    shippingAddress = json['shippingAddress'];
    orderUniId = json['orderUniId'];
    totalAmount = json['totalAmount'];
    paid = json['paid'];
    styleId =
    json['styleId'] != null ? new Style.fromJson(json['styleId']) : null;
    buyersId = json['buyersId'] != null
        ? new Buyers.fromJson(json['buyersId'])
        : null;
    orStatusId = json['orStatusId'] != null
        ? new OrderStatus.fromJson(json['orStatusId'])
        : null;
    samount = json['samount'];
    mamount = json['mamount'];
    lamount = json['lamount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['oderDate'] = this.oderDate;
    data['deliveryDate'] = this.deliveryDate;
    data['shippingAddress'] = this.shippingAddress;
    data['orderUniId'] = this.orderUniId;
    data['totalAmount'] = this.totalAmount;
    data['paid'] = this.paid;
    if (this.styleId != null) {
      data['styleId'] = this.styleId!.toJson();
    }
    if (this.buyersId != null) {
      data['buyersId'] = this.buyersId!.toJson();
    }
    if (this.orStatusId != null) {
      data['orStatusId'] = this.orStatusId!.toJson();
    }
    data['samount'] = this.samount;
    data['mamount'] = this.mamount;
    data['lamount'] = this.lamount;
    return data;
  }
}