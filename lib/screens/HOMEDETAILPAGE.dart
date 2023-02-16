import 'package:flutter/material.dart';
import 'package:oye_busy/models/product_model.dart';
import 'package:get/get.dart';
import 'package:oye_busy/controllers/cart_controller.dart';
import 'package:oye_busy/screens/cart_screen.dart';
class HomeDetailPage extends StatelessWidget {
  final Product catalog;
const HomeDetailPage({Key? key,required this.catalog }) : assert(catalog!=null), super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController2 = Get.put(CartController());
    final CartController controller = Get.find();
    Size size = MediaQuery.of(context).size;
        var index;
        return Scaffold(
          appBar: AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                )
            )
            ,
          ),
      backgroundColor: Colors.lightBlue,
      body :
      Column(
        children: <Widget>[
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
    height: 500,
    width: double.infinity,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),
    bottomRight: Radius.circular(50),
      topRight: Radius.circular(50),
      topLeft: Radius.circular(50),
    ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
    child : Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    height: size.width*0.8,
    color: Colors.white,
    child: Stack(
    alignment: Alignment.bottomCenter,
    children: [
    Container(
    height: size.width*0.7,
    width: size.width*0.7,
    decoration: BoxDecoration(
    color: Colors.white
    ),
    ),
    Image.network(catalog.image,
    height: size.width*0.75,
    width:size.width*0.75 ,
    fit: BoxFit.cover,
    ),
    ],
    ),
    )),
      Padding(padding: const EdgeInsets.symmetric(vertical: 20/2) ,
      child:
      Text(catalog.name,style:  Theme.of(context).textTheme.headline5,
      )
      ),
      Text(catalog.desc,style: TextStyle(fontWeight: FontWeight.w600),),
      Padding(padding: const EdgeInsets.symmetric(vertical: 20/2) ,
          child:
          Text('\$${catalog.price}',style:  Theme.of(context).textTheme.headline5,
          )
      ),
    ],
    ),
    ),
          Container(
            margin: EdgeInsets.all( 20),
            padding: EdgeInsets.symmetric(horizontal: 20,
            vertical: 20/2),
            decoration: BoxDecoration(
              color: Color(0xFFFCBF1E),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                IconButton(onPressed:() => Get.to(()=> CartScreen())
                    , icon: Icon(Icons.shopping_cart) ),
                Text('Add To Cart',style:  Theme.of(context).textTheme.headline5,
                ),
                SizedBox(width: 110,),
               InkWell(
                 onTap:()=> {
                 cartController2.addProduct(Product.products[index]),
               }, child: Icon(Icons.add_circle,),),
                Spacer(),


              ],
            ),
          )
    ],
    )
        );
  }
}
