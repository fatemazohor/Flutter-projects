

import 'package:primary_app/model/categories.dart';
import 'package:primary_app/model/order.dart';
import 'package:primary_app/model/task.dart';


class TimeAction {
  int? id;
  String? remarks;
  String? expectedStartDate;
  String? actualStartDate;
  String? expectedEndDate;
  String? actualEndDate;
  Order? orderId;
  Task? taskId;

  TimeAction(
      {this.id,
        this.remarks,
        this.expectedStartDate,
        this.actualStartDate,
        this.expectedEndDate,
        this.actualEndDate,
        this.orderId,
        this.taskId});

  TimeAction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    remarks = json['remarks'];
    expectedStartDate = json['expectedStartDate'];
    actualStartDate = json['actualStartDate'];
    expectedEndDate = json['expectedEndDate'];
    actualEndDate = json['actualEndDate'];
    orderId =
    json['orderId'] != null ? new Order.fromJson(json['orderId']) : null;
    taskId = json['taskId'] != null
        ? new Task.fromJson(json['taskId'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['remarks'] = this.remarks;
    data['expectedStartDate'] = this.expectedStartDate;
    data['actualStartDate'] = this.actualStartDate;
    data['expectedEndDate'] = this.expectedEndDate;
    data['actualEndDate'] = this.actualEndDate;
    if (this.orderId != null) {
      data['orderId'] = this.orderId!.toJson();
    }
    if (this.taskId != null) {
      data['taskId'] = this.taskId!.toJson();
    }
    return data;
  }
}








