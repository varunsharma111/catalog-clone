
import 'package:flutter/material.dart';
import 'package:oye_busy/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:oye_busy/models/product_model.dart';
class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> SizedBox(height: 600,
        child: ListView.builder(
        itemCount: controller.products.length,
        itemBuilder:(BuildContext context,int index){
          return CartProductsCard(
            controller: controller,
            product: controller.products.keys.toList()[index],
            quantity: controller.products.values.toList()[index],
            index: index,
          );
        }
    )),
          );
  }
}

class CartProductsCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  const CartProductsCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.index,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              product.image,
            ),
          ),
          SizedBox(width: 20,),
          Expanded(child:Text(product.name)
          ),
          IconButton(onPressed: (){
            controller.removeProduct(product);
          },icon: Icon(Icons.remove_circle_sharp),),
          Text('${quantity}',style: TextStyle(fontWeight: FontWeight.bold),),
          IconButton(onPressed: (){
            controller.addProduct(product);
          },icon: Icon(Icons.add_circle_sharp),),
        ],
      ),
    );
  }
}
