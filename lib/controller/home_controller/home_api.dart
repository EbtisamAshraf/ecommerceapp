import 'package:http/http.dart' as http;
import 'dart:convert';

Future getBanners(langApi) async {

  var url = Uri.parse('https://student.valuxapps.com/api/banners');
  var response = await http.get(url , headers: {'lang' : langApi});
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
Future getAboutUs(langApi) async {

  var url = Uri.parse('https://student.valuxapps.com/api/settings');
  var response = await http.get(url , headers: {'lang' : langApi});
  var responseBody = jsonDecode(response.body)['data'];

  return responseBody;
}
Future getFAQ(langApi) async {
  var url = Uri.parse('https://student.valuxapps.com/api/faqs');
  var response = await http.get(url , headers: {'lang' : langApi});
  var responseBody = jsonDecode(response.body)['data']['data'];
  return responseBody;
}
Future getCategories(langApi) async {
  var url = Uri.parse('https://student.valuxapps.com/api/categories');
  var response = await http.get(url , headers: {'lang' : langApi});
  var responseBody = jsonDecode(response.body)['data']['data'];
  return responseBody;
}
Future getHomeData(langApi) async {
  var url = Uri.parse('https://student.valuxapps.com/api/home');
  var response = await http.get(url , headers: {'lang' : langApi});
  var responseBody = jsonDecode(response.body)['data']['products'];
  return responseBody;
}
