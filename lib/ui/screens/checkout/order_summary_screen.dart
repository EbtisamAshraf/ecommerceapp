import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/ui/widgets/custom_button.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final isDark = context.select((SettingsProvider dark) => dark.isDark);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title:  midText( "Summary ", textColor( context, isDark, ),),),
       body: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(
               height:  MediaQuery.of(context).size.height * 0.38,
               child: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [

                    SizedBox(
                               height:  MediaQuery.of(context).size.height * 0.35,
                               width: double.infinity,
                               child: ListView.separated(
                                 shrinkWrap: true,
                                 scrollDirection: Axis.horizontal,
                                 itemCount: 1,
                                 separatorBuilder: (context, index) =>
                                 const SizedBox(
                                   width: 14,
                                 ),
                                 itemBuilder: (context, index) =>  Container(
                                   width: MediaQuery.of(context).size.width *0.3,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Check_green_icon.svg/2048px-Check_green_icon.svg.png' ),
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: proText('DDGDFHFHFGHJFGHJ',textColor(context, isDark,),txtAlign: TextAlign.center ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: midText('5000'.toString(), green),
                                       ),
                                     ],
                                   ),
                                 ),
                               ),
                             ),


                   ],
                 ),
               ),
             ),
             largeText('Standard Delivery', textColor(context,  isDark ,) ,txtAlign: TextAlign.start),
             const SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Expanded(child: detailsTextL('21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria', textColor(context,  isDark ,))),
                 const SizedBox(width: 50,),
                 const CircleAvatar(radius: 13,child: Icon(Icons.check),),
               ],
             ),
             const SizedBox(height: 10,),
             midText('Change'.toString(), green , )
           ],
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

                  defaultButton('Deliver ', padding: 50, fun: ( ) {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=> Address() ));

                  }),
                ],
              ),
            );
          }),
              );
  }
}
