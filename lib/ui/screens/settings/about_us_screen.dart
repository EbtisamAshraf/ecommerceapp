import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/my_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/home_controller/home_api.dart';
import 'package:ecommerceapp/controller/settings_controller/lang_provider.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {




    final lang = context.select((LangProvider lang) => lang.langApi);
    final isDark = context.select((SettingsProvider dark) => dark.isDark);


    return Scaffold(
      appBar: AppBar(title: midText('about us', textColor(context,  isDark ,) ,),centerTitle: true,),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: getAboutUs(lang),
            builder:(BuildContext context,AsyncSnapshot<dynamic> snapshot){
              return snapshot.data == null ? const Center(child: CircularProgressIndicator()) :Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    largeText('about', green),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: midDetailsText(snapshot.data['about'], textColor(context,  isDark ,) ,txtAlign: TextAlign.end),
                    ),
                    const SizedBox(height: 20,),
                    largeText('terms', green),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: midDetailsText(snapshot.data['terms'], textColor(context,  isDark),txtAlign: TextAlign.end ),
                    ),
                    const SizedBox(height: 20,)
                  ],
                ),
              );
            },

        ),
      ),
    );
  }
}
