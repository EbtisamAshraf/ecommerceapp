import 'package:ecommerceapp/model/home_model/banners_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future getBanners() async {

  var url = Uri.parse('https://student.valuxapps.com/api/banners');
  var response = await http.get(url);
  var responseBody = jsonDecode(response.body)['data'];
  // print('responseBody: $responseBody');
  // List <BannersModel> listDataModel= [];
  //
  // for (int i=0 ; i<responseBody.length ; i++) {
  //   listDataModel.add(BannersModel.fromMap(responseBody[i]));
  //
  // }
  //
  // print('listDataModel: $listDataModel');

 // print('$responseBody');
  return responseBody;
}
