class LoginModel{
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});
  factory  LoginModel.fromJson(jsonData){
    return LoginModel(email: jsonData['email'], password: jsonData['password']);
}
}