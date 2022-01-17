import 'dart:developer';

import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/ui/screens/checkout/address_screen.dart';
import 'package:ecommerceapp/ui/widgets/custom_button.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../constant.dart';

class Delivery extends StatelessWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final isDark = context.select((SettingsProvider dark) => dark.isDark);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title:  midText( "Checkout", textColor( context, isDark, ),),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
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
                 beforeLineStyle: LineStyle(color: green, thickness: 3),
                 afterLineStyle:  LineStyle(color: green, thickness: 3),
                  endChild:  Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.10, vertical: 20),
                    child:  proText('Delivery', textColor(context, isDark ,)),
                  ),
                    isFirst: true,

                ),
                    TimelineTile(
                      axis: TimelineAxis.horizontal,
                      alignment: TimelineAlign.start,
                      endChild:  Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.10, vertical:20),
                        child: proText('Address', textColor(context, isDark ,)),
                      ),
                    ),
                    TimelineTile(
                      axis: TimelineAxis.horizontal,
                      alignment: TimelineAlign.start,
                      isLast: true,
                      endChild:  Padding(
                        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.09, vertical:20),
                        child:proText('Summer', textColor(context, isDark ,)),
                      ),
                    ),

                  ],
                ),

              ),
              SizedBox(
                width: double.infinity,
                  child: largeText('Standard Delivery', textColor(context, isDark ,) ,txtAlign: TextAlign.start)),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: detailsTextL('Order will be delivered between 3 - 5 business days', textColor(context,  isDark ,))),
                  const CircleAvatar(radius: 13,),
                ],
              ),
              const SizedBox(height: 40,),
              SizedBox(
                  width: double.infinity,
                  child: largeText('Next Day Delivery', textColor(context,  isDark ,) ,txtAlign: TextAlign.start)),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: detailsTextL('Place your order before 6pm and your items will be delivered the next day', textColor(context,  isDark ,))),
                  const CircleAvatar(radius: 13,),
                ],
              ),
              const SizedBox(height: 40,),
              SizedBox(
                  width: double.infinity,
                  child: largeText('Nominated Delivery', textColor(context,  isDark ,) ,txtAlign: TextAlign.start)),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: detailsTextL('Pick a particular date from the calendar and order will be delivered on selected date', textColor(context,  isDark ,))),
                  const CircleAvatar(radius: 13,),
                ],
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              defaultButton('NEXT', padding: 50, fun: ( ) {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Address() ));

              }),
            ],
          ),
        );
      })

    );
  }
}
