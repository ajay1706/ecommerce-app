import 'package:flutter/material.dart';
import 'package:shopper_stop/components/similar_products.dart';
import 'package:shopper_stop/pages/homepage.dart';
import 'package:shopper_stop/pages/shopping_cart.dart';

class ProductDetail extends StatefulWidget {
  final prod_detail_name;

  final prod_detail_img;

  final prod_detail_price;

  final prod_detail_oldprice;

  const ProductDetail(
      {Key key,
      this.prod_detail_name,
      this.prod_detail_img,
      this.prod_detail_price,
      this.prod_detail_oldprice})
      : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        title: InkWell(
          onTap: (){
           return Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
          },
          child: Text(
            "Shoppers Stop",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>Cart()));

            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
                child: Container(
              color: Colors.white,
              child: Image.asset(widget.prod_detail_img),
            ),
            footer: Container(

color: Colors.white70,
              child: ListTile(
                leading: Text(widget.prod_detail_name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),
                title: Row(
                  children: <Widget>[
                    Expanded(child: Text("\$ ${widget.prod_detail_oldprice}",
                      style: TextStyle(
                        color: Colors.black54,
                          decoration: TextDecoration.lineThrough,
                      ),)),
                    Expanded(child: Text("\$ ${widget.prod_detail_price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16
                      ),)),
                  ],
                ),
              ),
            ),),
          ),

          //Buttons



          Row(
            children: <Widget>[
              //Size buttons

              Expanded(child: MaterialButton(onPressed: (){

                showDialog(context: context,
                builder: (context){
               return   AlertDialog(
                   title: Text("Size"),
                    content: Text("Choose the Size"),
                    actions: <Widget>[
                      MaterialButton(onPressed: (){
                        Navigator.of(context).pop();

                      },child: Text("Close"),)
                    ],
                  );
                });
              },
              color: Colors.white,
              textColor: Colors.grey,
                elevation: 0.3,
              child: Row(
                children: <Widget>[
                  Expanded(child: Text("Size", style: TextStyle(
                      fontSize: 12
                  ),)),
                  Expanded(child: Icon(Icons.arrow_drop_down))
                ],
              ),)),
              Expanded(child: MaterialButton(onPressed: (){
                showDialog(context: context,
                    builder: (context){
                      return   AlertDialog(
                        title: Text("Color"),
                        content: Text("Choose the Color"),
                        actions: <Widget>[
                          MaterialButton(onPressed: (){
                            Navigator.of(context).pop();

                          },child: Text("Close"),)
                        ],
                      );
                    });
              },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.3,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Color", style: TextStyle(
                        fontSize: 12
                    ),)),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),)),

              Expanded(child: MaterialButton(onPressed: (){
                showDialog(context: context,
                    builder: (context){
                      return   AlertDialog(
                        title: Text("Quantity"),
                        content: Text("Choose the Quantity"),
                        actions: <Widget>[
                          MaterialButton(onPressed: (){
                            Navigator.of(context).pop();

                          },child: Text("Close"),)
                        ],
                      );
                    });
              },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.3,
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Quantity",softWrap: true,
                    style: TextStyle(
                      fontSize: 12
                    ),)),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),))
            ],
          ),

          Row(
            children: <Widget>[

              //Second Buttons

              Expanded(child: MaterialButton(

                onPressed: (){},
                color: Colors.black,
                textColor: Colors.white,
                elevation: 0.3,
                child: Text("Buy",softWrap: true,
                ),)),
        IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.black,), onPressed: (){}),
              IconButton(icon: Icon(Icons.favorite_border, color: Colors.red,), onPressed: (){})



            ],
          ),
          Divider(),
          ListTile(
            title: Text("Product Details"),
            subtitle: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer"
                " took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, "
                "but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the "
                "release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus "
                "PageMaker including versions of Lorem Ipsum."),

          ),
          Divider(),

          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
              child: Text("Product name",
              style: TextStyle(
                color: Colors.grey
              ),),),
              Padding(padding: const EdgeInsets.all(5),
                child: Text(widget.prod_detail_name,
                  ),),

            ],
          ),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Product Brand",
                  style: TextStyle(
                      color: Colors.grey
                  ),),),
              Padding(padding: const EdgeInsets.all(5),
                child: Text('Brand X',
               ),),

            ],
          ),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Product condition",
                ),),
              Padding(padding: const EdgeInsets.all(5),
                child: Text('NEW',
                ),),


            ],
          ),
          Divider(),
          Padding(padding: const EdgeInsets.all(8),
          child: Text("Similar products"),),
          Container(
              height: 360,
              child: SimilarProducts())
        ],
      ),
    );
  }
}
