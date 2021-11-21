import 'package:ecommerceapp/controller/auth_controller/auth_api.dart';
import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final C = Provider.of<MyProvider>(context );
    return Scaffold(
      appBar: AppBar(title: midText('My Profile',textColor(context, C.isDark ,)),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: profile(token: C.token),
          builder:(BuildContext context,AsyncSnapshot<dynamic> snapshot){
            return snapshot.data == null ? const Center(child: CircularProgressIndicator()) : Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(radius: 75,backgroundImage: snapshot.data == null? NetworkImage('https://clipartpng.com/?173,pink-flower-png'): NetworkImage(snapshot.data['image'] ), ),
                    CircleAvatar(radius: 20,child: IconButton(icon:const Icon(Icons.add_a_photo) ,onPressed: (){},),)
                  ],
                ),
                const SizedBox(height: 20,),
                ListTile(leading: const Icon(Icons.subtitles_sharp),title: midText('Name' ,textColor(context, C.isDark)),subtitle:largeText(snapshot.data['name'] , textColor(context, C.isDark)) ,trailing: IconButton(icon: const Icon(Icons.edit) ,onPressed:(){} ,),),
                ListTile( leading: const Icon(Icons.smartphone_outlined),title: midText('phone' ,textColor(context, C.isDark)),subtitle:largeText(snapshot.data['phone'] , textColor(context, C.isDark)) ,trailing: IconButton(icon: const Icon(Icons.edit) ,onPressed:(){} ,),),
                ListTile( leading: const Icon(Icons.email), title: midText('Email' , textColor(context, C.isDark)),subtitle:largeText(snapshot.data['email'] , textColor(context, C.isDark)) ,),

              ],
            );
          }

        ),
      ),
    );
  }
}
