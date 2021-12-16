import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/cart_controller/cart_api.dart';
import 'package:ecommerceapp/controller/cart_controller/cart_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/ui/screens/home/home_screen.dart';
import 'package:ecommerceapp/ui/screens/home/main_screen.dart';
import 'package:ecommerceapp/ui/widgets/custom_button.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';
import '../../../constant.dart';

class Cart extends StatefulWidget {


  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {



  @override
  Widget build(BuildContext context) {
    final set = Provider.of<SettingsProvider>(context);
    final auth = Provider.of<AuthProvider>(context);
    final cart = Provider.of<CartProvider>(context);
  late  var id;
  var  quantity ;
    int upDateQuantity   ;


    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(leading: IconButton(icon:Icon(Icons.arrow_back) ,onPressed:() {
        //   Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen()));},),),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            FutureBuilder(future: getCart(langApi: set.langApi,),
                builder:  (BuildContext context, AsyncSnapshot<dynamic> snapshot) {


                  return snapshot.data == null
                      ? const Center(child: Center(child: Text('Empty')))
                      : Expanded(
                        child: snapshot.data == null
                            ? const Center(child: Center(child: CircularProgressIndicator()))
                            :  ListView.builder(
                          shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {

                      id= snapshot.data[index]['id'].toString();

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
                                              textColor(context, set.isDark),
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
                                                       updateCart(set.langApi,  quantity:cart.quantity.toString() ,id: id.toString() );
                                                      },
                                                      child: const Icon(Icons.add)),
                                                  midText(
                                                    '${snapshot.data[index]['quantity']}',
                                                    textColor(context, set.isDark),
                                                  ),
                                                  TextButton(
                                                      onPressed: () {
                                                        cart.addQuantity(int.parse(snapshot.data[index]['quantity'].toString()));
                                                        cart.deQuantity();
                                                        updateCart(set.langApi,  quantity:cart.quantity.toString() ,id: id.toString() );
                                                      },
                                                      child: const Icon(Icons.remove)),
                                                ]),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            // cart.counter.removeAt(index);
                                            addCart(langApi: set.langApi, productId: snapshot.data[index]['product']['id'].toString());
                                           setState(() {

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
            // BottomSheet(onClosing: (){}, builder: (context){
            //   return Container(
            //     color: Colors.white,
            //     height: 100,
            //     padding: const EdgeInsets.all(20),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Column(
            //           children: [
            //             smallGreyText('PRICE'),
            //             const SizedBox(
            //               height: 5,
            //             ),
            //             midText('\$1500', green)
            //           ],
            //         ),
            //         defaultButton('CHECKOUT', padding: 60, fun: () {
            //
            //         }),
            //       ],
            //     ),
            //   );
            // })
          ]),
        ),

      ),
    );
  }
}
