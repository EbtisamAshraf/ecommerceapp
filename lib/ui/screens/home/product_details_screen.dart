import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/cart_controller/cart_api.dart';
import 'package:ecommerceapp/controller/cart_controller/cart_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/home_controller/home_api.dart';
import 'package:ecommerceapp/controller/settings_controller/lang_provider.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/ui/screens/cart/cart_screen.dart';
import 'package:ecommerceapp/ui/widgets/custom_button.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatelessWidget {
  int id;
  String name;


  ProductDetails(this.id, this.name);

  @override
  Widget build(BuildContext context) {



    final auth = Provider.of<AuthProvider>(context );
    final lang = context.select((LangProvider lang) => lang.langApi);
    final isDark = context.select((SettingsProvider dark) => dark.isDark);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(centerTitle: true, title:  midText( name, textColor( context, set.isDark, ),),),
        body:  SingleChildScrollView(
          child: FutureBuilder(
        future: getProductDetails(langApi: lang,token:  auth.token, id:id ),
    builder: (BuildContext context,  AsyncSnapshot<dynamic> snapshot) {
            return snapshot.data == null
                ? const Center(child: CircularProgressIndicator())
                : Column(
              children: [
                Stack(
                  children: [
                    Container(
                      constraints: BoxConstraints.expand(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width:MediaQuery.of(context).size.width ,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image:NetworkImage(snapshot.data['image'].toString(), ),fit: BoxFit.contain),),

                    ),
                    PositionedDirectional(child: CircleAvatar( backgroundColor: Colors.green[300],child: IconButton(onPressed: (){}, icon: Icon(Icons.star_border))),
                      top: MediaQuery.of(context).size.height *0.03,end: 7, ),
                    PositionedDirectional(child: CircleAvatar(backgroundColor: Colors.green[300],child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back))),
                      top: MediaQuery.of(context).size.height *0.03,start:  7,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      midTitle(snapshot.data['name'].toString(),textColor(context,  isDark) ,  ),
                      const SizedBox(height: 20,),
                      midText('Details',textColor(context,  isDark) , ),
                      const SizedBox(height: 20,),
                      detailsText(  snapshot.data['description'].toString(), textColor(context, isDark) ,),
                      const SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                smallGreyText('PRICE'),
                                const SizedBox(height: 5,),
                                midText('\$${snapshot.data['price']}' , green)
                              ],
                            ),
                            defaultButton('Add' , padding: 40 , fun: (){

                              addCart(langApi: lang, productId: snapshot.data['id'].toString());
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart()));
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen()));
                              // cart.counter.add(1);

                             }),
                          ],),
                      ),
                    ],
                  ),
                ),




              ],
            );
        }

          ),
        ),
      ),
    );
  }
}
