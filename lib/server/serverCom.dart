// ignore: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hunger_zero/models/user_model.dart';

postUser(UserModel user) async {
  print(user.firstName);
  try {
    var response = await http.post(
      Uri.parse('https://hunger-zero.herokuapp.com/createNewUser'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user': user.toString(),
      }),
    );
    return (jsonDecode(response.body));
  } on Exception catch (e) {
    print(e);
  }
}
//acknowledged: true, insertedId: 62562f7e8e5bcbcdf4abf586