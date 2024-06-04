

class SignupResponseModel {
  int? id;
  SignupResponseModel({this.id});

  SignupResponseModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
  }
}

class SignupErrorResponse{
  String? message;
  SignupErrorResponse({this.message});

  SignupErrorResponse.fromJson(Map<String, dynamic> json){
    message = 'message';
  }
}