import 'package:flutter/material.dart';
import 'package:shopper_stop/components/products.dart';
import 'package:shopper_stop/pages/product_detail_page.dart';

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
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
    },
    {
      "name": "Black dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": "120",
      "price": "70"
    },
    {
      "name": "Womens Blazer",
      "picture": "images/products/blazer2.jpeg",
      "old_price": "130",
      "price": "82"
    },
    {
      "name":"Black Pant",
      "picture": "images/products/pants1.jpg",
      "old_price": "100",
      "price": "55"
    },
    {
      "name":"Grey Pant",
      "picture": "images/products/pants2.jpeg",
      "old_price": "110",
      "price": "65"
    },
    {
      "name":"Shoe",
      "picture": "images/products/shoe1.jpg",
      "old_price": "200",
      "price": "75"
    },
    {
      "name":"Skirt",
      "picture": "images/products/skt1.jpeg",
      "old_price": "120",
      "price": "75"
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


          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProductDetail(
            // passing the values of product to prod detail page
            prod_detail_img: prod_pic,
            prod_detail_name: prod_name,
            prod_detail_oldprice: prod_old_price,
            prod_detail_price: prod_price,

          ))),
          child: GridTile(
              footer: Container(

                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(prod_name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),),
                      ),
                      Text("\$${prod_price}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue
                        ),),
                    ],
                  )
              ),
              child: Image.asset(prod_pic,fit: BoxFit.fill,)),
        ),
      )),
    );
  }
}
