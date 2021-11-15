import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> login({email, password}) async {
  var url = Uri.parse('https://student.valuxapps.com/api/login');
  var response = await http.post(url,
      headers: {'lang': 'ar'}, body: {'email': email, 'password': password});

  var responseBody = jsonDecode(response.body)['message'];
  print('responseBody  $responseBody');
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
