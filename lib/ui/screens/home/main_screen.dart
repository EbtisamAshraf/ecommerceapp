import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/ui/screens/home/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  List <Widget>pages = [HomeScreen(),Container(color: Colors.grey,),SettingsScreen()];



  @override
  Widget build(BuildContext context) {
    final C = Provider.of<MyProvider>(context);
    return Scaffold(
      body:  pages[C.selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: C.selectIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home,) ,label: 'home',),
            BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart),label: 'cart'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'settings'),
          ],
          onTap: (i){
            C.onTap(i);
          }
      ),
    );
  }
}
