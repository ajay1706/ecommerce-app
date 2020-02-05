import 'package:flutter/material.dart';

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
        title: Text(
          "Shoppers Stop",
          style: TextStyle(color: Colors.black),
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
            onPressed: () {},
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
                          color: Colors.blue,
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

              Expanded(child: MaterialButton(onPressed: (){},
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
              Expanded(child: MaterialButton(onPressed: (){},
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

              Expanded(child: MaterialButton(onPressed: (){},
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
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 0.3,
                child: Text("Buy",softWrap: true,
                ),)),
        IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.blue,), onPressed: (){}),
              IconButton(icon: Icon(Icons.favorite_border, color: Colors.red,), onPressed: (){})



            ],
          )
        ],
      ),
    );
  }
}
