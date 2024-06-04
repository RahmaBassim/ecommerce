class LoginRequestModel{
  String? userName;
  String? password;

  LoginRequestModel({
    this.userName,
    this.password
  });
  Map<String, dynamic> toJson() =>  {
    'username':userName,
    'password': password
  };
}