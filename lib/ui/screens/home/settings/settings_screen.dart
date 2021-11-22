import 'package:ecommerceapp/controller/auth_controller/auth_api.dart';
import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
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
    buildCard({required String text, required String image,required BuildContext context, GestureTapCallback? onTap}) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          margin: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: MediaQuery.of(context).size.height * 0.01),
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    // color: Colors.lightGreen[300],
                    child: SvgPicture.asset(image)),
                const SizedBox(
                  width: 20,
                ),
                midText(text , textColor(context, C.isDark)),
                const Expanded(child: SizedBox()),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    midText('Dark Mode' ,textColor(context, C.isDark)),
                    Switch(
                        value: C.isDark,
                        onChanged: (val) {
                          C.changeMode();
                        } ,
                    ),

                  ],
                ),
              ),
              buildCard(
                  context: context,
                  text: 'Edit Profile',
                  image: 'images/Icon_Edit-Profile.svg',
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));},
              ),
              buildCard(
                  context: context,
                  text: 'Order History',
                  image: 'images/Icon_History.svg',
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryScreen()));}

              ),

              buildCard(
                  context: context,
                  text: 'language',
                  image: 'images/Icon_Location.svg'),
              buildCard(
                  context: context,
                  text: 'about us',
                  image: 'images/Icon_Alert.svg',
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsScreen()));}
              ),
              buildCard(
                  context: context,
                  text: 'FAQ',
                  image: 'images/Icon_Alert.svg',
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => FAQScreen()));}
              ),
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
