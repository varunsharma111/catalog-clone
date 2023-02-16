import 'package:flutter/material.dart';
import 'package:oye_busy/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:oye_busy/controllers/pay_controller.dart';
class CartTotal extends StatelessWidget {
  final CartController controller = Get.find();
   CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentController =  Get.put(PaymentController());
    return Obx(
        () => SafeArea(child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 40 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          ),
          Text('\$ ${controller.total}',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
          ),
          Container(
            height: 50,
            width: 120,
            color: Colors.black,
            child: ElevatedButton(onPressed: ()=>paymentController.makePayment(amount:'5',currency:'USD'),child:Text('Pay',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),

    )));
  }
}
