
class ShopLoginModel {
  bool? status;
  String? massage;
  UserData? data;
  ShopLoginModel.fromJson(Map<String,dynamic>json)
  {
    status= json['status'];
    massage= json['massage'];
    data= json['data'] != null ? UserData.fromJson(json['data']) : null;
    //لو ماكانش = نل حيكون يوزر داتا
    //لانو ماب مش حقدر استخدموا دايركت فبدخلو في يوزرداتا
   //احتمال الداتا تكون بنل
    //الجيسون حيكون في البوست مان في كود الداتا
   }
}

class UserData{
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit;
  late String token;

  /*UserData({

    this.id,
    this.name,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,

});*/

  //named constructor
//عشان الداتا الي حتيجيني تكون من الجيسون
  //استدعيت الداتا واستخرجتها عشان لما استدعي
  UserData.fromJson(Map<String,dynamic>json)
  {
    id= json['id'];
    name= json['name'];
    email= json['email'];
    phone= json['phone'];
    image= json['image'];
    points= json['points'];
    credit= json['credit'];
    token= json['token'];


  }

}