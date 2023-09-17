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
