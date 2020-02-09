import 'package:flutter/material.dart';
import 'package:shopper_stop/pages/shopping_cart.dart';


class DrawerScreen extends StatelessWidget {

  final name;
  final photoUrl ;

  const DrawerScreen({
    Key key, this.name, this.photoUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(


      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: Colors.white
            ),
            accountName: Text("Ajay",
              style: TextStyle(
                  color: Colors.black
              ), ),
            accountEmail: Text("ajay@shopperstop.in",
              style: TextStyle(
                  color: Colors.black
              ),),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.black12,
                child: Icon(Icons.person,color: Colors.black,),
              ),
            ),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("Home Page"),
              leading: Icon(Icons.home,color: Colors.black,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("My orders"),
              leading: Icon(Icons.shopping_basket,color: Colors.black,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext)=>Cart()));
            },
            child: ListTile(
              title: Text("Shopping Cart"),
              leading: Icon(Icons.shopping_cart,color: Colors.black,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("Favourites"),
              leading: Icon(Icons.favorite,color: Colors.black,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("Person"),
              leading: Icon(Icons.person,color: Colors.black,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Divider(),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings,color: Colors.blue,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("About"),
              leading: Icon(Icons.help,color: Colors.green,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),

        ],
      ),
    );
  }
}
