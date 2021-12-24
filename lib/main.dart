import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/home_controller/home_provider.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/controller/shared_pref.dart';
import 'package:ecommerceapp/ui/screens/auth/login.dart';
import 'package:ecommerceapp/ui/screens/checkout/delivery_screen.dart';
import 'package:ecommerceapp/ui/screens/home/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'controller/cart_controller/cart_provider.dart';
import 'controller/my_provider.dart';
import 'package:easy_localization/easy_localization.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
 await Firebase.initializeApp();
 await SharedPref.init();
 var token = SharedPref.getStringData(key: 'token') ;
 var isDarkMode =  SharedPref.getBoolData(key:'isDark') ;

  runApp(MultiProvider(providers:
  [
    ChangeNotifierProvider<MyProvider>(create:(context) => MyProvider(),),
    ChangeNotifierProvider<AuthProvider>(create:(context) => AuthProvider()),
    ChangeNotifierProvider<HomeProvider>(create:(context) => HomeProvider(),),
    ChangeNotifierProvider<SettingsProvider>(create:(context) => SettingsProvider()),
    ChangeNotifierProvider<CartProvider>(create:(context) => CartProvider()),
  ],
  child:  EasyLocalization(child: MyApp(token ,isDarkMode ),
    path:'resources/langs' ,
    supportedLocales: const [
      Locale('en', 'EN'),
      Locale('ar', 'AR'),
    ],
    saveLocale: true,

  ), ));
}

class MyApp extends StatelessWidget {
 late var token;
  var isDarkMode;

  MyApp  (this.token , this.isDarkMode);


  @override
  Widget build(BuildContext context) {
     // final auth = Provider.of<AuthProvider>(context );
    // final set = Provider.of<SettingsProvider>(context);
     // set.changeDarkMode(isDarkMode: isDarkMode);
     // auth.getToken(token.toString());
    // SettingsProvider.get(context).initDarkMode();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Commerce',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
      themeMode:  Provider.of<SettingsProvider>(context).isDark == false   ? ThemeMode.light :  ThemeMode.dark,

      home:
      AnimatedSplashScreen(
        splash: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/icon.png' ,fit: BoxFit.scaleDown,),
                 const SizedBox(height:30 ,),
                 const Text('E Commerce' , style: TextStyle(color: Colors.green, fontSize: 35 , fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        // Container(
        //   decoration:
        //   const BoxDecoration(
        //       image: DecorationImage(
        //           image: AssetImage(
        //             'images/Content.png',
        //           ),
        //           fit: BoxFit.cover)),
        // ),
        duration: 4000,
        nextScreen:  token == null ? LogIn() : MainScreen(),
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
      ),
    );
  }

}
