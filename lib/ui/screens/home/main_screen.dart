import 'package:easy_localization/src/public_ext.dart';
import 'package:ecommerceapp/controller/home_controller/home_provider.dart';
import 'package:ecommerceapp/controller/my_provider.dart';
import 'package:ecommerceapp/ui/screens/cart/cart_screen.dart';
import 'package:ecommerceapp/ui/screens/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class MainScreen extends StatelessWidget {


  List <Widget>pages = [HomeScreen(),Cart(),SettingsScreen()];



  @override
  Widget build(BuildContext context) {

    final home = Provider.of<HomeProvider>(context);

    return Scaffold(
      body:  pages[home.selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: home.selectIndex,
          items:  [
            BottomNavigationBarItem(icon: const Icon(Icons.home,) ,label: 'home'.tr().toString(),),
            BottomNavigationBarItem(icon: const Icon(Icons.add_shopping_cart),label: 'cart'.tr().toString()),
            BottomNavigationBarItem(icon: const Icon(Icons.settings),label: 'settings'.tr().toString()),
          ],
          onTap: (i){
            home.onTapBottomNavigationBar(i);
          }
      ),
    );
  }
}
