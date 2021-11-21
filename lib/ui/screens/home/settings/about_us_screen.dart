import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/home_controller/home_api.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final C = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(title: midText('about us', textColor(context, C.isDark ,) ,),centerTitle: true,),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: getAboutUs(),
            builder:(BuildContext context,AsyncSnapshot<dynamic> snapshot){
              return snapshot.data == null ? const Center(child: CircularProgressIndicator()) :Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    largeText('about', textColor(context, C.isDark)),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: midText(snapshot.data['about'], textColor(context, C.isDark ,) ,txtAlign: TextAlign.end),
                    ),
                    SizedBox(height: 20,),
                    largeText('terms', textColor(context, C.isDark)),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: midText(snapshot.data['terms'], textColor(context, C.isDark),txtAlign: TextAlign.end ),
                    ),
                    SizedBox(height: 20,)
                  ],
                ),
              );
            },

        ),
      ),
    );
  }
}
