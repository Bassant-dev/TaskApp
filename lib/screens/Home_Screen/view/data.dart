
import 'employees.dart';
import 'manager.dart';

class DepartData {
  DepartData({
    this.id,
    this.name,
    this.manager,
    this.employees,});

  DepartData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    manager = json['manager'] != null ? Manager.fromJson(json['manager']) : null;
    if (json['employees'] != null) {
      employees = [];
      json['employees'].forEach((v) {
        employees?.add(Employees.fromJson(v));
      });
    }
  }
  num? id;
  String? name;
  Manager? manager;
  List<Employees>? employees;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (manager != null) {
      map['manager'] = manager?.toJson();
    }
    if (employees != null) {
      map['employees'] = employees?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}