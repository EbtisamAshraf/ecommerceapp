import 'package:ecommerceapp/controller/auth_controller/auth_api.dart';
import 'package:ecommerceapp/controller/my_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/shared_pref.dart';
import 'package:ecommerceapp/ui/screens/auth/login.dart';
import 'package:ecommerceapp/ui/screens/home/settings/about_us_screen.dart';
import 'package:ecommerceapp/ui/screens/home/settings/faq_screen.dart';
import 'package:ecommerceapp/ui/screens/home/settings/profile_screen.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'order_history_screen.dart';

class SettingsScreen extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {

    final C = Provider.of<MyProvider>(context );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // profile data
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FutureBuilder(
                  future: profile(token: C.token),
                  builder:(BuildContext context,AsyncSnapshot<dynamic> snapshot){
                    return snapshot.data == null ? const Center(child: CircularProgressIndicator()) : Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: green,
                          backgroundImage: snapshot.data == null? NetworkImage('https://clipartpng.com/?173,pink-flower-png'): NetworkImage(snapshot.data['image'] ),
                          radius: 50,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            midTitle(snapshot.data['name']  ,textColor(context, C.isDark)),
                            const SizedBox(
                              height: 10,
                            ),
                            subTitle(snapshot.data['email'], textColor(context, C.isDark)),
                          ],
                        ),
                      ],
                    );
                  }
                  ,
                ),
              ),
              // dark mode
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    midText('Dark Mode' ,textColor(context, C.isDark)),
                    Switch(
                        value: C.isDark,
                        onChanged: (val) {
                          C.changeDarkMode();
                        } ,
                    ),

                  ],
                ),
              ),
              buildCardSettings(
                  context: context,
                  text: 'Edit Profile',
                  image: 'images/Icon_Edit-Profile.svg',
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));}, isDark: C.isDark,
              ),
              buildCardSettings(
                  context: context,
                  text: 'Order History',
                  image: 'images/Icon_History.svg',
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryScreen()));}, isDark:  C.isDark

              ),

              buildCardSettings(
                  context: context,
                  text: 'language',
                  image: 'images/Icon_Location.svg', isDark:  C.isDark),
              buildCardSettings(
                  context: context,
                  text: 'about us',
                  image: 'images/Icon_Alert.svg',
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsScreen()));}, isDark:  C.isDark
              ),
              buildCardSettings(
                  context: context,
                  text: 'FAQ',
                  image: 'images/Icon_Alert.svg',
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => FAQScreen()));}, isDark:  C.isDark
              ),
              // log out
              GestureDetector(
                onTap: () {
                  logOut(token: C.token);
                  SharedPref.removeData(key:'token' );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  margin: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: Card(
                    elevation: 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(vertical: 3),
                            child: SvgPicture.asset('images/Icon_Exit.svg')),
                        const SizedBox(
                          width: 20,
                        ),
                        midText('Log Out', textColor(context, C.isDark)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
