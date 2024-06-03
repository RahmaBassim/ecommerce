class CategoryResponseModel {
  List<GetCategoryProductsModel>? products;
  int? total;
  int? skip;
  int? limit;
  CategoryResponseModel({this.products, this.total, this.skip, this.limit});
  factory CategoryResponseModel.fromJson({required Map<String, dynamic> json}) {
    return CategoryResponseModel(
        products: (json['products'] as List).map((e) => GetCategoryProductsModel.fromJson(json: e)).toList(),
        total: json['total'],
        skip: json['skip'],
        limit: json['limit']);
  }
}

class GetCategoryProductsModel {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rate;
  int? stock;
  Tags? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<Images>? images;
  String? thumbnail;
  GetCategoryProductsModel({
    this.images,
    this.dimensions,
    this.price,
    this.title,
    this.id,
    this.category,
    this.brand,
    this.description,
    this.rate,
    this.availabilityStatus,
    this.discountPercentage,
    this.meta,
    this.minimumOrderQuantity,
    this.returnPolicy,
    this.reviews,
    this.shippingInformation,
    this.sku,
    this.stock,
    this.tags,
    this.thumbnail,
    this.warrantyInformation,
    this.weight,
  });
  factory GetCategoryProductsModel.fromJson(
      {required Map<String, dynamic> json}) {
    return GetCategoryProductsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      rate: json['rating'],
      stock: json['stock'],
      //tags: (json['tags'] as List).map((e)=> Tags.fromJson(e)).toList(),
      brand: json['brand'],
      sku: json['sku'],
      weight: json['weight'],
     // dimensions: (json['dimensions'] as List).map((e)=> Dimensions.fromJson(e)).toList(),
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      //reviews: (json['reviews'] as List).map((e)=> Reviews.fromJson(e)).toList(),
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      //meta: (json['meta'] as List).map((e)=> Meta.fromJson(e)).toList(),
      //images: (json['images'] as List).map((e)=> Images.fromJson(e)).toList(),
      thumbnail: json['thumbnail'],
    );
  }
}

class Tags {
  List<String> tag;
  Tags({this.tag = const []});
  factory Tags.fromJson({required Map<String, dynamic> json}) {
    return Tags(tag: (json['tags'] as List).map((e) => e.toString()).toList());
  }
}

class Dimensions {
  double? width;
  double? height;
  double? depth;
  Dimensions({this.width, this.height, this.depth});
  Dimensions.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }
}

class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerMail;
  Reviews(
      {this.rating,
      this.comment,
      this.date,
      this.reviewerMail,
      this.reviewerName});
  Reviews.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    comment = json['comment'];
    date = json['date'];
    reviewerName = json['reviewerName'];
    reviewerMail = json['reviewerEmail'];
  }
}

class Meta {
  String? createAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;
  Meta({this.createAt, this.updatedAt, this.barcode, this.qrCode});
  Meta.fromJson(Map<String, dynamic> json) {
    createAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    barcode = json['barcode'];
    qrCode = json['qrCode'];
  }
}

class Images {
  List<String> images;
  Images({this.images = const []});
  factory Images.fromJson({required Map<String, dynamic> json}) {
    return Images(
        images: (json['images'] as List).map((e) => e.toString()).toList());
  }
}



class CategoryErrorResponse{
  String? message;
  CategoryErrorResponse({this.message});
  factory CategoryErrorResponse.fromJson(Map<String, dynamic> json){
    return CategoryErrorResponse(
      message: json['message']
    );
  }
}
