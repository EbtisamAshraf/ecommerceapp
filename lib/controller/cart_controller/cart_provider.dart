import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../shared_pref.dart';


class CartProvider with ChangeNotifier{

// List <int> counter = [];
// inCounter (index){
//   counter[index] ++;
//   notifyListeners();
// }
// deCounter (index){
//   if (counter[index] >=2 ){
//     counter[index] --;
//   }
//   notifyListeners();
// }
int quantity = 1;
addQuantity(val){
  quantity = val;
  notifyListeners();
}

deQuantity (){
  if (quantity > 1){
     quantity --;
  }
  notifyListeners();
  return quantity;
}
inQuantity (){
   quantity ++;
  notifyListeners();
  return quantity;
}

Future updateCart(String langApi, {  quantity , id }) async {
  var token = SharedPref.getStringData(key: 'token') ;
  var url = Uri.parse('https://student.valuxapps.com/api/carts/$id');
  var response = await http.put(url , headers: {'lang' : langApi ,'Authorization': token.toString() } , body: {'quantity' :quantity });
  var responseBody = jsonDecode(response.body)['data'];
  print('upData= $responseBody');
  notifyListeners();
  return responseBody;
}



}