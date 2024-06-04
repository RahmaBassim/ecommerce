

class LoginSuccessResponseModel{
  String? token;
  LoginSuccessResponseModel({
    this.token
  });

  LoginSuccessResponseModel.fromJson(Map<String, dynamic> json){
    token = json['token'];
  }
}

class LoginErrorResponseModel{
   String? message;
  LoginErrorResponseModel({this.message});

  LoginErrorResponseModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
  }
}