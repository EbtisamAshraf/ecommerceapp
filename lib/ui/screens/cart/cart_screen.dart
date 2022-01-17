import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/cart_controller/cart_api.dart';
import 'package:ecommerceapp/controller/cart_controller/cart_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/settings_controller/lang_provider.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/ui/screens/checkout/delivery_screen.dart';
import 'package:ecommerceapp/ui/widgets/custom_button.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constant.dart';

class Cart extends StatefulWidget {

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {



  @override
  Widget build(BuildContext context) {

    final cart = Provider.of<CartProvider>(context);
    final lang = context.select((LangProvider lang) => lang.langApi);
    final isDark = context.select((SettingsProvider dark) => dark.isDark);



  late  var id;
  List priceProduct = [];
  var total = 0   ;

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(leading: IconButton(icon:Icon(Icons.arrow_back) ,onPressed:() {
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen()));},),),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            FutureBuilder(future: getCart(langApi: lang,),
                builder:  (BuildContext context, AsyncSnapshot<dynamic> snapshot) {



                  return snapshot.data == null
                      ? const Center(child: Center(child: CircularProgressIndicator()))
                      : Expanded(
                        child: snapshot.data == null
                            ? const Center(child: Center(child: Text('Empty')))
                            :  ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {

                      id= snapshot.data[index]['id'].toString();
                      // total = snapshot.data['total'];
                      // print('total >>>>>>>>>> $total');

                      //   priceProduct.add(snapshot.data[index]['product']['price']);
                      // for (var i = 0; i < priceProduct.length; i++) {
                      //   total += priceProduct[index];
                      //   print('total >>>>>>>>>> $total');
                      // }


                         return Column(
                          children: [
                            SizedBox(
                                height: MediaQuery.of(context).size.height * 0.20,
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          constraints: BoxConstraints.expand(
                                            height: MediaQuery.of(context).size.height *  0.20,
                                            width: MediaQuery.of(context).size.width * 0.40,),
                                          decoration: BoxDecoration( image: DecorationImage(
                                                image: NetworkImage(snapshot.data[index]['product']['image'].toString(),),fit: BoxFit.contain),

                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10,),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            midText(
                                              snapshot.data[index]['product']['name'].toString(),
                                              textColor(context,  isDark),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            midText('${snapshot.data[index]['product']['price'] * snapshot.data[index]['quantity']}', green),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        cart.addQuantity(int.parse(snapshot.data[index]['quantity'].toString()));
                                                       cart.inQuantity();
                                                       updateCart(lang,  quantity:cart.quantity.toString() ,id: id.toString() );


                                                      },
                                                      child: const Icon(Icons.add)),
                                                  midText(
                                                    '${snapshot.data[index]['quantity']}',
                                                    textColor(context,  isDark),
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        cart.addQuantity(int.parse(snapshot.data[index]['quantity'].toString()));
                                                        cart.deQuantity();
                                                        updateCart(lang,  quantity:cart.quantity.toString() ,id: id.toString() );

                                                      },
                                                      child: const Icon(Icons.remove)),
                                                ]),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            // cart.counter.removeAt(index);
                                           setState(() {
                                             addCart(langApi: lang, productId: snapshot.data[index]['product']['id'].toString());

                                           });



                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ))
                                    ],
                                  ),
                                )),
                            const SizedBox(height:20,)
                          ],
                        );
                    },),
                      );
                }),
            const SizedBox(height: 100,),

          ]),
        ),
        bottomSheet:   BottomSheet(onClosing: (){}, builder: (context){
          return Container(
            color: Colors.white,
            height: 100,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    smallGreyText('PRICE'),
                    const SizedBox(
                      height: 5,
                    ),
                    midText( '$total', green)
                  ],
                ),
                defaultButton('CHECKOUT', padding: 60, fun: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Delivery() ));

                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
