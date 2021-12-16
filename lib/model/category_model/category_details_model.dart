// class CategoryDetailsModel {
//   bool? status;
//   String? message;
//   CategoryDetailsDataModel? data;
//
//   CategoryDetailsModel({this.status, this.message, this.data});
//
//   Map<String, dynamic> toMap() {
//     return {
//       'status': this.status,
//       'message': this.message,
//       'data': this.data,
//     };
//   }
//
//   factory CategoryDetailsModel.fromMap(Map<String, dynamic> map) {
//     return CategoryDetailsModel(
//       status: map['status'] ,
//       message: map['message'] ,
//       data: map['data'] ,
//     );
//   }
// }
//
// class CategoryDetailsDataModel {
//   CategoryDetailsDataModelList? data;
//
// }

class CategoryDetailsDataModelList {
  int? id;
  num? price;
  num? old_price;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<dynamic>? images;
  bool? in_favorites;
  bool? in_cart;

  CategoryDetailsDataModelList(
      {this.id,
      this.price,
      this.old_price,
      this.discount,
      this.image,
      this.name,
      this.description,
      this.images,
      this.in_favorites,
      this.in_cart});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'old_price': old_price,
      'discount': discount,
      'image': image,
      'name': name,
      'description': description,
      'images': images,
      'in_favorites': in_favorites,
      'in_cart': in_cart,
    };
  }

  factory CategoryDetailsDataModelList.fromMap(Map<String, dynamic> map) {
    return CategoryDetailsDataModelList(
      id: map['id'] ,
      price: map['price'] ,
      old_price: map['old_price'] ,
      discount: map['discount'] ,
      image: map['image'] ,
      name: map['name'] ,
      description: map['description'] ,
      images: map['images'] ,
      in_favorites: map['in_favorites'] ,
      in_cart: map['in_cart'] ,
    );
  }
}