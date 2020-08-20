import 'dart:async';
import 'dart:convert';

import 'package:appnode/view/detailProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListProducts extends StatefulWidget {
  @override
  _ListProductsState createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {

  List data;

  Future<List> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    final response = await http.get("https://product-apirest.herokuapp.com/api/product",
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        });
        var data1 = json.decode(response.body);
        print(data1["products"]);
    return data1["products"] ;
  }

  @override
  void initState() { 
    super.initState();
     this.getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Listviews Products"),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ItemList(
                  list: snapshot.data,
                );
          }else if (snapshot.hasError){
            print(snapshot.error);
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

  class ItemList extends StatelessWidget {

    final List list;
    ItemList({this.list});


    @override
    Widget build(BuildContext context) {
      return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                            list: list,
                            index: i,
                          )),
                ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['name'].toString(),
                  style: TextStyle(fontSize: 25.0, color: Colors.orangeAccent),
                ),
               
              ),
            ),
          ),
        );
      },
        
      );
    }
  }
  