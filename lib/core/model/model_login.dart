import 'dart:convert';

class LoginModel{
  final String email;
  final String password;
  final String token;

  LoginModel({required this.email, required this.password,required this.token});
  factory  LoginModel.fromJson(jsonData){
    return LoginModel(email: jsonData['email'], password: jsonData['password'],token:jsonData["data"]['token'] );
}
}

class UserModel{
  final String name;
  final String email;
  final String phone;
  final String password;
  final String usertype;

  UserModel({required this.name, required this.email, required this.phone, required this.password, required this.usertype});

}
class AllUserModel {
  final String name;
  final int id;
  final String email;
  final dynamic phone;
  late final String userType;
  final String userStatus;
  AllUserModel(
      {required this.name,
        required this.userStatus,
        required this.id,
        required this.email,
        required this.phone,
        required this.userType});
  factory AllUserModel.fromJson(Map<String, dynamic> json) {
    return AllUserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        userType: json['user_type'],
        userStatus: json['user_status']??'0'
    );
  }
}
class DepartmentDataModel{
  final int id;
  final String name;

  DepartmentDataModel({required this.id, required this.name});

  factory DepartmentDataModel.fromJson(Map<String,dynamic>json){
    return DepartmentDataModel(id: json['id'],name: json['name']);
  }
}