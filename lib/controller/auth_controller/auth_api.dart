import 'package:ecommerceapp/model/auth_model/login_model.dart';
import 'package:ecommerceapp/model/auth_model/profile_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


Future login({email, password}) async {
  var url = Uri.parse('https://student.valuxapps.com/api/login');
  var response = await http.post(url,
      headers: {'lang': 'ar'}, body: {'email': email, 'password': password});
  var responseBody = jsonDecode(response.body);
  LogInModel logInModel=  LogInModel.fromMap(responseBody);
      // print('$responseBody');
      return logInModel;
}

Future logOut({var token}) async {
  var url = Uri.parse('https://student.valuxapps.com/api/logout');
  var response = await http.post(url,
      headers: {'lang': 'ar', 'Authorization': token.toString()},);
  var responseBody = jsonDecode(response.body);

      return responseBody;
}

Future<String> signUp({email, password, name, phone}) async {
  var url = Uri.parse('https://student.valuxapps.com/api/register');
  var response = await http.post(url, headers: {
    'lang': 'ar'
  }, body: {
    'name': name,
    'email': email,
    'password': password,
    'phone': phone,
  });

  var responseBody = jsonDecode(response.body)['message'];

  return responseBody;
}

Future<String> verifyCode({email,  code,}) async {
  var url = Uri.parse('https://student.valuxapps.com/api/verify-code');
  var response = await http.post(url, headers: {
    'lang': 'ar'
  }, body: {
    'email': email,
    'code': code,
  });

  var responseBody = jsonDecode(response.body)['message'];
  if (responseBody != null){
    return responseBody;
  }
  else {
    return 'تم';
  }


}

Future<String> verifyEmail({ email}) async {
  var url = Uri.parse('https://student.valuxapps.com/api/verify-email');
  var response = await http.post(url, headers: {
    'lang': 'ar'
  }, body: {
    'email': email,

  });

  var responseBody = jsonDecode(response.body)['message'];

  return responseBody;
}

Future<String> resetPassword({email, code, password}) async {
  var url = Uri.parse('https://student.valuxapps.com/api/reset-password');
  var response = await http.post(url,
      headers: {'lang': 'ar'},
      body: {'code': code, 'email': email, 'password': password});

  var responseBody = jsonDecode(response.body)['message'];

  return responseBody;
}

Future profile({var token}) async {
  var url = Uri.parse('https://student.valuxapps.com/api/profile');
  var response = await http.get(url ,headers:{'lang': 'ar','Content-Type': 'application/json',
    'Authorization': token.toString()} );
  var responseBody = jsonDecode(response.body)['data'];
  return responseBody;
}

Future<String> updateProfile({ name, phone ,token ,}) async {
  var url = Uri.parse('https://student.valuxapps.com/api/update-profile');
  var response = await http.put(url, headers: {
    'lang': 'ar',
    'Content-Type': 'application/json',
    'Authorization': token.toString(),
  }, body: {
    'name': name,
    'phone': phone,
  });
  var responseBody = jsonDecode(response.body)['message'];
  return responseBody;
}

