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
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home,) ,label: 'home',),
            BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart),label: 'cart'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'settings'),
          ],
          onTap: (i){
            home.onTapBottomNavigationBar(i);
          }
      ),
    );
  }
}
