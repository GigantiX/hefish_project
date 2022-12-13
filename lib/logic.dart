import 'dart:convert';

import 'package:http/http.dart' as http;

// Future<http.Response> register(String email, String username, String password) {
//   return http.post(
//     Uri.parse('http://192.168.56.1:8080/api/create/user'),
//     body: jsonEncode(<String, String>{
//       'email' : email,
//       'username' : username,
//       'password' : password,
//     }),
//   );
// }

void regtest(String email, String username, String password) async {
  var data = <String, String>{
    'email' : email,
    'username' : username,
    'password' : password,
  };
  print(data);
  Map<String, String> head = {
    'Content-Type' : 'application/json; charset=utf-8'
  };
  print(head);
  // var conv = json.encode(data);
  var response = await http.post(
      Uri.parse('http://192.168.56.1:8080/api/create/user'),
      headers: head,
      body: jsonEncode(data)
  );
  print(response);
  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print('A network error occurred');
  }
}
