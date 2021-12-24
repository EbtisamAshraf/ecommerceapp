
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/ui/screens/auth/reset_password.dart';
import 'package:ecommerceapp/ui/screens/checkout/order_summary_screen.dart';
import 'package:ecommerceapp/ui/widgets/custom_button.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:ecommerceapp/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../constant.dart';


class Address extends StatelessWidget {
  var streetController1 = TextEditingController();
  var streetController2 = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var countryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final set = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title:  midText( "Checkout", textColor( context, set.isDark, ),),),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 1 ,vertical: 30),
                  height: 150,
                  child: Row(
                    children: [
                      TimelineTile(
                        axis: TimelineAxis.horizontal,
                        alignment: TimelineAlign.start,
                        indicatorStyle: IndicatorStyle(color:green  ),
                        afterLineStyle:  LineStyle(color: green, thickness: 3),
                        endChild:  Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.10, vertical: 20),
                          child:  proText('Delivery', textColor(context, set.isDark ,)),
                        ),
                        isFirst: true,

                      ),
                      TimelineTile(
                        axis: TimelineAxis.horizontal,
                        alignment: TimelineAlign.start,
                        indicatorStyle: IndicatorStyle(color:green  ),
                        beforeLineStyle:  LineStyle(color: green, thickness: 3),
                        endChild:  Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.10, vertical:20),
                          child: proText('Address', textColor(context, set.isDark ,)),
                        ),
                      ),
                      TimelineTile(
                        axis: TimelineAxis.horizontal,
                        alignment: TimelineAlign.start,
                        isLast: true,
                        endChild:  Padding(
                          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.09, vertical:20),
                          child:proText('Summer', textColor(context, set.isDark ,)),
                        ),
                      ),

                    ],
                  ),

                ),
                Row(
                  children: [
                    CircleAvatar(radius: 10,child: Icon(Icons.check  , size: 15,),),
                        SizedBox(width: 10,),
                        detailsTextL('Billing address is the same as delivery address', textColor(context, set.isDark ,)),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                subTitle('Street 1' , textColor(context, set.isDark)),
                defaultTextFormField(controller: streetController1 ,
                    keyboardType: TextInputType.name,
                    onSaved: (value) => streetController1.text = value ,
                    validator: (value){
                      if (value.isEmpty){
                        return 'please enter your name';
                      }
                      else {
                        return null;
                      }
                    }
                ),
                const SizedBox(
                  height: 40,
                ),
                subTitle('Street 2' , textColor(context, set.isDark)),
                defaultTextFormField(controller: streetController2 ,
                    keyboardType: TextInputType.name,
                    onSaved: (value) => streetController2.text = value ,
                    validator: (value){
                      if (value.isEmpty){
                        return 'please enter your name';
                      }
                      else {
                        return null;
                      }
                    }
                ),
                const SizedBox(
                  height: 40,
                ),
                subTitle('City' , textColor(context, set.isDark)),
                defaultTextFormField(controller: cityController ,
                    keyboardType: TextInputType.name,
                    onSaved: (value) => cityController.text = value ,
                    validator: (value){
                      if (value.isEmpty){
                        return 'please enter your name';
                      }
                      else {
                        return null;
                      }
                    }
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width *0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         subTitle('State' , textColor(context, set.isDark)),
                         defaultTextFormField(controller: stateController ,
                             keyboardType: TextInputType.name,
                             onSaved: (value) => stateController.text = value ,
                             validator: (value){
                               if (value.isEmpty){
                                 return 'please enter your name';
                               }
                               else {
                                 return null;
                               }
                             }
                         ),
                       ],
                      ),
                    ),
                     SizedBox(
                      width:MediaQuery.of(context).size.width *0.1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width *0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          subTitle('Country' , textColor(context, set.isDark)),
                          defaultTextFormField(controller: countryController ,
                              keyboardType: TextInputType.name,
                              onSaved: (value) => countryController.text = value ,
                              validator: (value){
                                if (value.isEmpty){
                                  return 'please enter your name';
                                }
                                else {
                                  return null;
                                }
                              }
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),



              ],
            ),
          ),
        ),
        bottomSheet: BottomSheet(onClosing: (){}, builder: (context){
          return Container(
            color: Colors.white,
            height: 100,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                outLineButton2('BACK' , fun: (){
                  Navigator.pop(context);
                }),

                defaultButton('NEXT', padding: 50, fun: ( ) {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderSummary() ));

                }),
              ],
            ),
          );
        })

    );
  }
}
