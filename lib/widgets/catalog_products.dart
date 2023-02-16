import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oye_busy/controllers/cart_controller.dart';
import 'package:oye_busy/models/product_model.dart';
import 'package:get/get.dart';
import 'package:oye_busy/screens/HOMEDETAILPAGE.dart';
import 'package:flutter/foundation.dart';



class CatalogProducts extends StatelessWidget {
  const CatalogProducts({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
      itemCount: Product.products.length,
        itemBuilder: (BuildContext context, int index){
        return InkWell(
            child:CatalogProductCard(index: index)
        );
        }));
  }
}
class CatalogProductCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final int index;


  CatalogProductCard({
    Key? key,required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListTile(
        onTap: ()=> Navigator.push(context,MaterialPageRoute(builder:(context)=>HomeDetailPage(catalog: Product.products[index],),),),
        title: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
       vertical:10,),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              Product.products[index].image,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(Product.products[index].name,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),),
          Expanded(child:Text('\$${Product.products[index].price}',
           textScaleFactor: 1.25,
           style: TextStyle(
             color: Colors.blue,
             fontWeight: FontWeight.bold,
           ),

         )),
          IconButton(onPressed: (){
            cartController.addProduct(Product.products[index]);
          }, icon: Icon(Icons.add_circle,),)
  ]
      ),
        ));
  }
}

