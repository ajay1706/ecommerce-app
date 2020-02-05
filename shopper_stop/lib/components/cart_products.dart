import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {

  var cart_products = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": "120",
  "size":"L",
      "price": "80",
      "quantity":"2"
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": "100",
    "size":"M",
      "price": "50",
      "quantity":"1"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cart_products.length,
        itemBuilder: (context, i )  {

          return SingleCartProducts(
            cart_prod_name: cart_products[i]['name'],
            cart_prod_pic: cart_products[i]['picture'],
            cart_prod_quantity: cart_products[i]['quantity'],
            cart_prod_size: cart_products[i]['size'],
            cart_prod_price: cart_products[i]['price'],

          );
        });
  }
}


class SingleCartProducts extends StatelessWidget {

  final cart_prod_name;
  final cart_prod_pic;
  final cart_prod_size;
  final cart_prod_quantity;


  final cart_prod_price;

  const SingleCartProducts({Key key, this.cart_prod_name, this.cart_prod_pic, this.cart_prod_size, this.cart_prod_quantity, this.cart_prod_price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Card(

        child: ListTile(
          leading: Image.asset(cart_prod_pic,width: 80,height: 800,),
          title: Text(cart_prod_name),
          subtitle: Column(
            children: <Widget>[
             Row(
               children: <Widget>[
                Padding(padding: const EdgeInsets.all(0),
                child: Text("Size"),),
                 Padding(padding: const EdgeInsets.all(4),
                   child: Text(cart_prod_size,
                   style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.w600
                   ),),),

                 Padding(padding: const EdgeInsets.fromLTRB(20,8,8,8),
                   child: Text("Quantity"),
                  ),
                 Padding(padding: const EdgeInsets.all(4),
                   child: Text(cart_prod_quantity,
                     style: TextStyle(
                         color: Colors.black,
                         fontWeight: FontWeight.w600
                     ),),),

               ],
             ),

              Container(
                alignment: Alignment.topLeft,
                child: Text('\$${cart_prod_price}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    fontSize: 16
                  ),),
              )
            ],
          ),
          trailing: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(icon: Icon(Icons.add,), onPressed: (){}),
                Text("$cart_prod_quantity",textAlign: TextAlign.center,style: TextStyle(fontSize: 40,),),
                IconButton(icon: Icon(IconData(0xe15b,fontFamily: 'MaterialIcons',)), onPressed: (){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
