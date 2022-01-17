class BannersModel {
  var status;
  String? message;
  List <BannersDataModel>? data;
  BannersModel({this.status, this.message, this.data});

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data,
    };
  }
  factory BannersModel.fromMap(Map<String, dynamic> map) {
    return BannersModel(
      status: map['status'] ,
      message: map['message'] as String,
      data: map['data'] ,


    );
  }

}

class BannersDataModel {
  int? id;
  String? image;
  var category;
  var product;

  BannersDataModel({this.id, this.image, this.category, this.product});

  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'image': image,
  //     'product': product,
  //     'category': category,
  //   };
  // }
  // factory BannersDataModel.fromMap(Map<String, dynamic> map) {
  //   return BannersDataModel(
  //     id: map['id'] as int,
  //     image: map['image'] as String,
  //     product: map['product'],
  //     category: map['category'] ,
  //
  //   );
  // }
}
