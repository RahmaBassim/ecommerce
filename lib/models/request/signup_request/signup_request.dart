

class SignupRequestModel {
  String? email;
  String? password;
  String? name;

  SignupRequestModel({
    this.email,
    this.password,
    this.name
  });

  Map<String, dynamic> toJson() => {
    'email' : email,
    'username' : name,
    'password' : password
  };
}