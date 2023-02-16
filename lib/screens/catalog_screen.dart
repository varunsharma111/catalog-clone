import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:oye_busy/widgets/catalog_products.dart';
import 'drawer.dart';
import 'cart_screen.dart';



class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
             bottomLeft: Radius.circular(40),
          )
        ),
        title: const Text("CATALOG APP"),
        actions: [
          IconButton(onPressed:() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CartScreen()));
          }, icon: Icon(Icons.notification_add_outlined) ),
          IconButton(onPressed:() => Get.to(()=> CartScreen())
              , icon: Icon(Icons.shopping_cart) )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            CatalogProducts(),
          ],
        ),
      ),
      drawer:MyDrawer(),
    );
  }
}
