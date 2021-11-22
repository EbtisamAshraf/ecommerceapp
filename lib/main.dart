import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/controller/shared_pref.dart';
import 'package:ecommerceapp/ui/screens/auth/login.dart';
import 'package:ecommerceapp/ui/screens/home/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:async/async.dart';
import 'package:provider/provider.dart';

import 'controller/auth_controller/auth_provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 await SharedPref.init();
 var token = SharedPref.getData(key: 'token') ;
 var isDarkMode =  SharedPref.getData(key:'isDark');

  runApp(ChangeNotifierProvider<MyProvider>(create:(context) => MyProvider(),child:  MyApp(token ,isDarkMode )));
}

class MyApp extends StatelessWidget {
 late var token;
  var isDarkMode;



  MyApp  (this.token , this.isDarkMode);


  @override
  Widget build(BuildContext context) {
    // var testDarkMode = isDarkMode?? Provider.of<MyProvider>(context ).isDark;
    final C = Provider.of<MyProvider>(context);
    // C.getToken(token.toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Commerce',
      theme:ThemeData(
          textTheme: Typography.blackHelsinki,
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0.0,
              iconTheme: IconThemeData(color:Colors.black),
          ),

          floatingActionButtonTheme:const FloatingActionButtonThemeData(
              backgroundColor: Colors.green),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.green ,
              elevation: 20.0,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white

          )),
      darkTheme: ThemeData(
          textTheme:Typography.whiteHelsinki,
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.black45,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black45,
              elevation: 0.0,
              titleTextStyle: TextStyle(color:Colors.white,),
              iconTheme: IconThemeData(color:Colors.white),
            actionsIconTheme: IconThemeData(color:Colors.white),
          ),
          floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: Colors.green),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.green ,elevation: 20.0, backgroundColor: Colors.black45
          ),
      cardColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white, ),
        buttonTheme: const ButtonThemeData(buttonColor: Colors.white,disabledColor: Colors.white ,
            textTheme:ButtonTextTheme.primary , ) ,
        primaryIconTheme: const IconThemeData(color: Colors.white, ),
        outlinedButtonTheme: OutlinedButtonThemeData(style: ButtonStyle(backgroundColor:MaterialStateProperty.all(white) )),
        dialogBackgroundColor: Colors.black,

      ),

      themeMode:  Provider.of<MyProvider>(context).isDark == false   ? ThemeMode.light :  ThemeMode.dark,

      home: AnimatedSplashScreen(
        splash: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'images/Content.png',
                  ),
                  fit: BoxFit.cover)),
        ),
        duration: 4000,
        nextScreen:  token == null ? LogIn() : MainScreen(),
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }

}
