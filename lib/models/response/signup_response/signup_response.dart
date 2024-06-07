


class UserModel {
  int? id;
 String? email;

  FullName? fullName;
 String? username;
 String? phone;
 String? password;
 AddressModel? address;

  UserModel({this.id,this.password,this.email,this.phone,this.fullName,this.address,this.username});

  UserModel.fromJson(Map<String, dynamic> json){
     id=json['id'];
     email=json['email'];

     fullName=FullName.fromJson(json: json['name']);
     username=json['username'];
     phone=json['phone'];
     password=json['password'];
     address=AddressModel.fromJson(json: json['address']);
  }
  Map<String,dynamic> toJson(){
    return {
      'email':email,
      'username':username,
      'password':password,
      'name':fullName?.toJson(),
      'address':address?.toJson(),
      'phone':phone
    };
  }
}
class FullName{
  String? firstName;
  String? lastName;
  FullName({this.firstName,this. lastName });
  FullName.fromJson({required Map<String,dynamic> json}){
    firstName = json['firstname'];
    lastName = json['lastname'];
  }
  Map<String,dynamic> toJson() => {
    'firstname':firstName,
    'lastname':lastName,
  };
}

class AddressModel{
  String?  city;
  String?  street;
  int?  number;
  String?  zipcode;
  Geolocation? geolocation;
  AddressModel({this.street,this.zipcode,this.geolocation,this.city,this.number});
  AddressModel.fromJson({required Map<String,dynamic>? json}){
      city = json?['city'];
      street = json?['street'];
      number = json?['number'];
      zipcode = json?['zipcode'];
     geolocation = Geolocation();
  }
 Map<String,dynamic> toJson() =>{
    'city':city,
    'street':street,
    'number':number,
    'zipcode':zipcode,
   'geolocation':geolocation?.toJson(),
 };
}
class Geolocation{
  String?  lat;
  String?  long;
  Geolocation({this.lat,this.long});
  Geolocation.fromJson({required Map<String,dynamic> json}){
    lat = json['lat'];
    long = json['long'];
  }
  Map<String,dynamic> toJson()=>{
    'lat':lat,
    'long':long,
  };
}
class SignupErrorResponse{
  String? message;
  SignupErrorResponse({this.message});

  SignupErrorResponse.fromJson(Map<String, dynamic> json){
    message = 'message';
  }
}