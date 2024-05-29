


class ErrorResponseCode{
  static String checkError(int? code){
    String newCode ="";
    if(code==ResponseCode.badRequest){
      newCode ='';
    }else if(code==ResponseCode.cacheError){
      newCode ='';
    }else if(code==ResponseCode.connectTimeout){
      newCode ='';
    }else if(code==ResponseCode.forbidden){
      newCode ='';
    }else if(code==ResponseCode.notFound){
      newCode ='';
    }else if(code==ResponseCode.noInternetConnection){
      newCode ='';
    }else if(code==ResponseCode.noContent){
      newCode ='';
    }else if(code==ResponseCode.internalServerError){
      newCode ='';
    }else if(code==ResponseCode.receiveTimeout){
      newCode ='';
    }else if(code==ResponseCode.sendTimeout){
      newCode ='';
    }else if(code==ResponseCode.defaultError){
      newCode ='';
    }
    return newCode;
  }
}

class ResponseCode{
  //Remote states code
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalServerError = 500;

  //local status code
  static const int connectTimeout =-1;
  static const int cancel =-2;
  static const int receiveTimeout=-3;
  static const int sendTimeout=-4;
  static const int cacheError=-5;
  static const int noInternetConnection=-6;
  static const int defaultError=-7;
}

