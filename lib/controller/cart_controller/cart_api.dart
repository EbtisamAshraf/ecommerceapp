import 'package:ecommerceapp/model/cart_model/cart_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../shared_pref.dart';

Future getCart({langApi}) async {
  var token = SharedPref.getStringData(key: 'token') ;
  List <productCartModel> listDataModel = [];
  var url = Uri.parse('https://student.valuxapps.com/api/carts');
  var response = await http.get(url , headers: {'lang' : langApi ,'Authorization': token.toString() });
  var responseBody = jsonDecode(response.body)['data']['cart_items'];

  // for (int i=0 ; i<responseBody.length ; i++){
  //   listDataModel.add(productCartModel.fromMap(responseBody[i]));
  //   }
 // print('responseBody= $responseBody');
  return responseBody;
}
Future addCart({langApi,  required String productId}) async {
  var token = SharedPref.getStringData(key: 'token') ;

  var url = Uri.parse('https://student.valuxapps.com/api/carts');
  var response = await http.post(url ,
      headers: {'lang' : langApi ,'Authorization': token.toString() } ,
      body: {'product_id': productId.toString()} );
  var responseBody = jsonDecode(response.body);
  print('add cart = $responseBody');
  return responseBody;
}


Future deleteCart({langApi }) async {
  var token = SharedPref.getStringData(key: 'token') ;
  var url = Uri.parse('https://student.valuxapps.com/api/carts');
  var response = await http.delete(url , headers: {'lang' : langApi ,'Authorization': token.toString() } );
  var responseBody = jsonDecode(response.body);
  return responseBody;
}
Future updateCart(String langApi, {  quantity , id }) async {
  var token = SharedPref.getStringData(key: 'token') ;
  var url = Uri.parse('https://student.valuxapps.com/api/carts/$id');
  var response = await http.put(url , headers: {'lang' : langApi ,'Authorization': token.toString() } , body: {'quantity' :quantity });
  var responseBody = jsonDecode(response.body)['data'];
  print('upData= $responseBody');
  return responseBody;
}

