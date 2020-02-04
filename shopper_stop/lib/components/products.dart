import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var products = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": "120",
      "price": "80"
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": "100",
      "price": "50"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,

        ),
        itemBuilder: (BuildContext context, int i) => SimpleProduct(
          prod_name: products[i]['name'],
          prod_pic: products[i]['picture'],
          prod_old_price: products[i]['old_price'],
prod_price:             products[i]['price']
          ,
        ));
  }
}

class SimpleProduct extends StatelessWidget {
  final prod_name;
  final prod_pic;

  final prod_old_price;

  final prod_price;

  const SimpleProduct(
      {Key key,
      this.prod_name,
      this.prod_pic,
      this.prod_old_price,
      this.prod_price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Hero(tag: prod_name, child: Material(
        child: InkWell(
          onTap: (){},
          child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(prod_name,

                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),),
                  title: Text("\$ ${prod_price}",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w800
                    ),),
                  subtitle: Text("\$ ${prod_old_price}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                    decoration: TextDecoration.lineThrough
                  ),),
                ),
              ),
              child: Image.asset(prod_pic,fit: BoxFit.cover,)),
        ),
      )),
    );
  }
}
