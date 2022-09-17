class HomeModel {
  ///////////
  late bool status;
   HomeDataModel? data;

  HomeModel.fromJson(Map<String,dynamic> json)
  {
    status = json['status'];
    data = HomeDataModel.fromJson(json[data]);

  }
}

class HomeDataModel {

  List<BannerModel> banner = [];
  List<ProductModel> product = [];

  HomeDataModel.fromJson(Map<String,dynamic> json)
  {

     // banner = (json['banner'] as List<dynamic>).map((element) => BannerModel.fromJson(element)).toList();

     // product = (json['product'] as List<dynamic>).map((element) => ProductModel.fromJson(element)).toList();

  }

}

class BannerModel {
  late int id;
  late String image;

  BannerModel.fromJson(Map<String, dynamic> json)
  {
    id= json['id'];
    image= json['image'];

  }

}

class ProductModel {
// صح هذا كلاس هو نفسه في المفضلة
// اذا هو اعمله بملف خارجي
  late int id;
  late int price;
  late int oldPrice;
  late int discount;
  late String image ;
  String? name;
  bool?  inFavorites;
  bool? inCart;



  ProductModel.fromJson(Map<String, dynamic> json)
  {

    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'] ;
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];

  }

}