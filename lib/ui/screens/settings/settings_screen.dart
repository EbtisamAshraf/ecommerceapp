import 'package:easy_localization/src/public_ext.dart';
import 'package:ecommerceapp/controller/auth_controller/auth_api.dart';
import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/settings_controller/lang_provider.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/controller/shared_pref.dart';
import 'package:ecommerceapp/ui/screens/auth/login.dart';
import 'package:ecommerceapp/ui/screens/settings/about_us_screen.dart';
import 'package:ecommerceapp/ui/screens/settings/faq_screen.dart';
import 'package:ecommerceapp/ui/screens/settings/order_history_screen.dart';
import 'package:ecommerceapp/ui/screens/settings/profile_screen.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constant.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SettingsScreen extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthProvider>(context );
     final set = Provider.of<SettingsProvider>(context);
    final langChange = Provider.of<LangProvider>(context);
    final lang = context.select((LangProvider lang) => lang.langApi);
    final isDark = context.select((SettingsProvider dark) => dark.isDark);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              // profile data
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: FutureBuilder(
                  future: profile(lang),
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
                            midTitle(snapshot.data['name']  ,textColor(context,  isDark)),
                            const SizedBox(
                              height: 10,
                            ),
                            subTitle(snapshot.data['email'], textColor(context,  isDark)),
                          ],
                        ),
                      ],
                    );
                  }
                  ,
                ),
              ),
              // dark mode
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       midText('Dark Mode' ,textColor(context,  isDark)),
              //       Switch(
              //           value:  isDark,
              //           onChanged: (val) {
              //             set.changeDarkMode();
              //           } ,
              //       ),
              //
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       midText('Arabic' ,textColor(context,  isDark)),
              //       Switch(
              //           value: langChange.isArabic,
              //           onChanged: (val) {
              //            var x = context.locale = langChange.changeLang();
              //           } ,
              //       ),
              //
              //     ],
              //   ),
              // ),
              const SizedBox(height: 30,),
              buildCardSettings(
                  context: context,
                  text: 'Edit Profile',
                  icon: Icons.edit,
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));}, isDark: isDark,
              ),
              buildCardSettings(
                  context: context,
                  text: 'Order History',
                  icon: Icons.history,
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryScreen()));}, isDark:   isDark

              ),

             // buildCardSettings(context: context, text: 'language',image: 'images/Icon_Location.svg', isDark:  set.isDark),
              buildCardSettings(
                  context: context,
                  text: 'about us',
                  icon: Icons.info,
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsScreen()));}, isDark:   isDark
              ),
              buildCardSettings(
                  context: context,
                  text: 'FAQ',
                  icon: Icons.question_answer ,
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => FAQScreen()));}, isDark:   isDark
              ),
              // log out
              GestureDetector(
                onTap: () {
                  logOut(lang, token: auth.token);
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
                          padding:  EdgeInsets.symmetric(horizontal: 15),
                            margin: const EdgeInsets.symmetric(vertical: 3),
                            child: const Icon(Icons.logout , color: green,)),
                        const SizedBox(
                          width: 8,
                        ),
                        midText('Log Out', textColor(context,  isDark)),
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
