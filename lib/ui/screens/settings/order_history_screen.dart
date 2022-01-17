import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/controller/my_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final isDark = context.select((SettingsProvider dark) => dark.isDark);


    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TimelineTile(
              alignment: TimelineAlign.manual,
              afterLineStyle: LineStyle(color: green, thickness: 3),
              indicatorStyle: IndicatorStyle( color: green  ),
              isFirst: true,
              lineXY: 0.3,
              startChild: Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Column(
                  children: [
                    smallGreyText('20/18'),
                    vSmallGreyText('10:00 AM')
                  ],
                ),
              ),
              endChild: Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Column(
                  children: [
                    midText('Order Signed', textColor(context,  isDark ,)),
                    proText('Lagos State, Nigeria' ,textColor(context,  isDark ,) )
                  ],
                ),
              ),

            ),
            TimelineTile(

              alignment: TimelineAlign.manual,
              afterLineStyle: LineStyle(color: green, thickness: 3),
              beforeLineStyle: LineStyle(color: green, thickness: 3),

              indicatorStyle: IndicatorStyle(color:green  ),
              lineXY: 0.3,
              startChild: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Column(
                  children: [
                    smallGreyText('20/18'),
                    vSmallGreyText('10:00 AM')
                  ],
                ),
              ),
              endChild: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Column(
                  children: [
                    midText('Order Processed', textColor(context,  isDark ,)),
                    proText('Lagos State, Nigeria' ,textColor(context, isDark ,) )
                  ],
                ),
              ),


            ),
            TimelineTile(

              alignment: TimelineAlign.manual,
              afterLineStyle: LineStyle(color: greyLight, thickness: 3),
              beforeLineStyle: LineStyle(color: green, thickness: 3),
              indicatorStyle: IndicatorStyle(color: green  ),
              lineXY: 0.3,
              startChild: Padding(
                padding: const EdgeInsets.symmetric(vertical:50.0),
                child: Column(
                  children: [
                    smallGreyText('20/18'),
                    vSmallGreyText('10:00 AM')
                  ],
                ),
              ),
              endChild: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Column(
                  children: [
                    midText('Shipped', textColor(context,  isDark ,)),
                    proText('Lagos State, Nigeria' ,textColor(context, isDark ,) )
                  ],
                ),
              ),



            ),
            TimelineTile(

              alignment: TimelineAlign.manual,
              afterLineStyle: LineStyle(color: greyLight, thickness: 3),
              beforeLineStyle: LineStyle(color: greyLight, thickness: 3),
              indicatorStyle: IndicatorStyle(color: greyLight ),
              lineXY: 0.3,
              endChild: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Column(
                  children: [
                    midText('Out for delivery', textColor(context,  isDark ,)),
                    proText('Edo State, Nigeria' ,textColor(context,  isDark ,) )
                  ],
                ),
              ),



            ),
            TimelineTile(

              alignment: TimelineAlign.manual,
              afterLineStyle: LineStyle(color: greyLight, thickness: 3),
              beforeLineStyle: LineStyle(color: greyLight, thickness: 3),
              indicatorStyle: IndicatorStyle(color: greyLight ),
              lineXY: 0.3,
              isLast: true,
              endChild: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Column(
                  children: [
                    midText('Delivered', textColor(context,  isDark ,)),
                    proText('Edo State, Nigeria' ,textColor(context,  isDark ,) )
                  ],
                ),
              ),



            ),
          ],
        ),
      ),
    );
  }
}
