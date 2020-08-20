import 'package:appnode/controllers/databasehelpers.dart';
import 'package:appnode/main.dart';
import 'package:flutter/material.dart';

class AddDataProduct extends StatefulWidget {

  AddDataProduct({Key key , this.title}) : super(key : key);
  final String title;

  @override
  _AddDataProductState createState() => _AddDataProductState();
}

class _AddDataProductState extends State<AddDataProduct> {

  DataBaseHelper databaseHelper = new DataBaseHelper();


  final TextEditingController _nameController = new TextEditingController();  
  final TextEditingController _priceController = new TextEditingController();
  final TextEditingController _pictureController = new TextEditingController();
  final TextEditingController _categoryController = new TextEditingController();
  final TextEditingController _descriptionController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Product',
      home: Scaffold(
        appBar: AppBar(
          title:  Text('Add Product'),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
            children: <Widget>[
              
              Container(
                height: 50,
                child: new TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'name',
                    hintText: 'Product name',
                    icon: new Icon(Icons.email),
                  ),
                ),
              ),

              Container(
                height: 50,
                child: new TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'price',
                    hintText: 'Place your price',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              
              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              Container(
                height: 50,
                child: new TextField(
                  controller: _pictureController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Imagen',
                    hintText: 'Place your image',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),

              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              Container(
                height: 50,
                child: new TextField(
                  controller: _categoryController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'categoria',
                    hintText: 'Place your category',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),

              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              Container(
                height: 50,
                child: new TextField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'descripcion',
                    hintText: 'Place your description',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),


             new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: (){
                    databaseHelper.addDataProducto(
                        _nameController.text.trim(), _priceController.text.trim(), _pictureController.text.trim(), _categoryController.text.trim(), _descriptionController.text.trim());
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new MainPage(),
                        )
                    );
                  },
                  color: Colors.blue,
                  child: new Text(
                    'Add',
                    style: new TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.blue),),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }



}
