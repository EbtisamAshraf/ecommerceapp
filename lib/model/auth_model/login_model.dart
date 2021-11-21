
class LogInModel {

   late bool status;
  String? message;
  LogInDataModel? data;

   LogInModel({required this.status, this.message, this.data});

   Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory LogInModel.fromMap(Map<String, dynamic> map) {
    return LogInModel(
      status: map['status'],
      message: map['message'] ,
      data: map['data'] != null ? LogInDataModel.fromMap(map['data']) : null ,

    );
  }
}

class LogInDataModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  LogInDataModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.image,
      this.points,
      this.credit,
      this.token});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'points': points,
      'credit': credit,
      'token': token,
    };
  }

  factory LogInDataModel.fromMap(Map<String, dynamic> map) {
    return LogInDataModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      image: map['image'] as String,
      points: map['points'] as int,
      credit: map['credit'] as int,
      token: map['token'] as String,
    );
  }
}

