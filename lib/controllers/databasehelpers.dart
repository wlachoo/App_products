import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DataBaseHelper {

  var status;
  var token;
  String serverUrlproducts = "https://product-apirest.herokuapp.com/api/product";

  //funciton getData
  Future<List> getData() async{

    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrlproducts";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
    });
    return json.decode(response.body);
   // print(response.body);
  }


  //function for register products
  void addDataProducto(String _nameController, String _priceController, String _pictureController, String _categoryController, String _descriptionController) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

   // String myUrl = "$serverUrl/api";
   String myUrl = "https://product-apirest.herokuapp.com/api/product";
   final response = await  http.post(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
          "name":       "$_nameController",
          "price":      "$_priceController",        
          "picture":      "$_pictureController",
          "category":      "$_categoryController",
          "description":      "$_descriptionController",
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      _save(data["token"]);
    }
  }

  //function for update or put
  void editarProduct(String _id, String name, String price, String picture, String category, String description) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "https://product-apirest.herokuapp.com/api/product/$_id";
    http.put(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        },
        body: {
         "name":       "$name",
         "price":       "$price",
         "picture":      "$picture",
         "category":      "$category",
         "description":      "$description"
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
    });
  }


  //function for delete
  Future<void> removeRegister(String _id) async {

  String myUrl = "https://product-apirest.herokuapp.com/api/product/$_id";

    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

  Response res = await http.delete("$myUrl",
    headers: {
      'Accept':'application/json',
      'Authorization' : 'Bearer $value'
    });

  if (res.statusCode == 200) {
    print("DELETED");
  } else {
    throw "Can't delete post.";
  }
}

  //function save
  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
  }

//function read
 read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;
    print('read : $value');
  }
}

