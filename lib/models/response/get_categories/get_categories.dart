

class CategoriesModel{
  String? slug;
  String? name;
  CategoriesModel({
    this.slug,
    this.name,
  });
  factory CategoriesModel.fromJson(Map<String, dynamic> json){
    return CategoriesModel(
      slug : json['slug'],
      name : json['name'],
    );
  }
}
class GetCategoriesResponse{
  List<CategoriesModel> categories;
  GetCategoriesResponse({required this.categories});
  factory GetCategoriesResponse.fromJson({required List categories}){
    return GetCategoriesResponse(categories: categories.map((e)=> CategoriesModel.fromJson(e)).toList());
  }
}

class CategoriesErrorResponse{
  String? message;
  CategoriesErrorResponse({this.message});
  CategoriesErrorResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
  }
}