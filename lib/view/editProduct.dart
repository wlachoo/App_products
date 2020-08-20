import 'package:appnode/controllers/databasehelpers.dart';
import 'package:appnode/view/listProducts.dart';
import 'package:flutter/material.dart';


class EditProduct extends StatefulWidget {

  final List list;
  final int index;

  EditProduct({this.list, this.index});

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {

  DataBaseHelper databaseHelper = new DataBaseHelper();

  TextEditingController controllerName;
  TextEditingController controllerPrice;
  TextEditingController controllerPicture;
  TextEditingController controllerCategory;
  TextEditingController controllerDescription;
  TextEditingController controllerId;

  @override
  void initState() { 

    controllerId= new TextEditingController(text: widget.list[widget.index]['_id'].toString() );
    controllerName= new TextEditingController(text: widget.list[widget.index]['name'].toString() );
    controllerPrice= new TextEditingController(text: widget.list[widget.index]['price'].toString() );
    controllerPicture= new TextEditingController(text: widget.list[widget.index]['stock'].toString() );
    controllerCategory= new TextEditingController(text: widget.list[widget.index]['stock'].toString() );
    controllerDescription= new TextEditingController(text: widget.list[widget.index]['stock'].toString() );
    super.initState();
    
  }



  @override
  Widget build(BuildContext context) {
   return new Scaffold(
      appBar: new AppBar(
        title: new Text("Edit product"),
      ),
      body: Form(       
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerId,
                          validator: (value) {
                            if (value.isEmpty) return "ID";
                          },
                      decoration: new InputDecoration(
                        hintText: "Id", labelText: "Id",
                      ),
                    ),
                  ),
                 new ListTile(
                    leading: const Icon(Icons.person, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerName,
                          validator: (value) {
                            if (value.isEmpty) return "name";
                          },
                      decoration: new InputDecoration(
                        hintText: "Name", labelText: "Name",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerPrice,
                          validator: (value) {
                            if (value.isEmpty) return "Price";
                          },
                      decoration: new InputDecoration(
                        hintText: "Price", labelText: "Price",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.settings_input_component, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerPicture,
                          validator: (value) {
                            if (value.isEmpty) return "Ingresa la imagen";
                          },
                      decoration: new InputDecoration(
                        hintText: "Imagen", labelText: "Imagen",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.settings_input_component, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerCategory,
                          validator: (value) {
                            if (value.isEmpty) return "Ingresa Categoria";
                          },
                      decoration: new InputDecoration(
                        hintText: "Categoria", labelText: "Categoria",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.settings_input_component, color: Colors.black),
                    title: new TextFormField(
                      controller: controllerDescription,
                          validator: (value) {
                            if (value.isEmpty) return "Ingresa Descripcion";
                          },
                      decoration: new InputDecoration(
                        hintText: "Descripcion", labelText: "Descripcion",
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),                                    
                  new Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  new RaisedButton(
                    child: new Text("Edit"),
                    color: Colors.blueAccent,
                    onPressed: (){
                    databaseHelper.editarProduct(
                        controllerId.text.trim(), controllerName.text.trim(), controllerPrice.text.trim(), controllerPicture.text.trim(), controllerCategory.text.trim(), controllerDescription.text.trim());
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new ListProducts(),
                        )
                    );
                  },
                  )
                ],
              ),
            ],
          ),
      ),
    );
  }
}