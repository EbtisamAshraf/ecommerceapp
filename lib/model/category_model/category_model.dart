class CategoryModel {
  bool? status;
  String? message;
  CategoryDataModel? data;

  CategoryModel({this.status, this.message, this.data});

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      status: map['status'] as bool,
      message: map['message'] as String,
      data: map['data'] as CategoryDataModel,
    );
  }
}

class CategoryDataModel {
  CategoryDataModelList? data;

}

class CategoryDataModelList {
  int? id;
  String? name;
  String? image;

  CategoryDataModelList({this.id, this.name, this.image});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': this.image,
    };
  }

  factory CategoryDataModelList.fromMap(Map<String, dynamic> map) {
    return CategoryDataModelList(
      id: map['id'] as int,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }
}