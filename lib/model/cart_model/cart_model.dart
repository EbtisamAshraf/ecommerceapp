class CartModel {
  int id;
  int quantity;
  productCartModel product;

  CartModel({required this.id, required this.quantity, required this.product});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'quantity': this.quantity,
      'product': this.product,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] ,
      quantity: map['quantity'] ,
      product: map['product'] ,
    );
  }
}

class productCartModel {
  int id;
  int price;
  int old_price;
  int discount;
  String image;
  String name;
  String description;
  List images;
  bool in_favorites;
  bool in_cart;

  productCartModel(
      {required this.id,
      required this.price,
      required this.old_price,
      required this.discount,
      required this.image,
      required this.name,
      required this.description,
      required this.images,
      required this.in_favorites,
      required this.in_cart});

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

  factory productCartModel.fromMap(Map<String, dynamic> map) {
    return productCartModel(
      id: map['id'] ,
      price: map['price'] ,
      old_price: map['old_price'],
      discount: map['discount'] ,
      image: map['image'] ,
      name: map['name'] ,
      description: map['description'] ,
      images: map['images'] ,
      in_favorites: map['in_favorites'],
      in_cart: map['in_cart'] ,
    );
  }
}