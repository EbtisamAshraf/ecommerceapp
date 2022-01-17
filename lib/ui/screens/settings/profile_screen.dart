import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/controller/auth_controller/auth_api.dart';
import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/my_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/settings_controller/lang_provider.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/ui/screens/settings/camera_screen.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:ecommerceapp/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final set = Provider.of<SettingsProvider>(context);
    final lang = context.select((LangProvider lang) => lang.langApi);
    final isDark = context.select((SettingsProvider dark) => dark.isDark);

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: midText(
            'My Profile',
            textColor(
              context,
               isDark,
            )),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
            future: profile(lang ),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return snapshot.data == null
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 75,
                                backgroundImage: snapshot.data == null
                                    ? NetworkImage(
                                        'https://clipartpng.com/?173,pink-flower-png')
                                    : NetworkImage(snapshot.data['image']),
                              ),
                              CircleAvatar(
                                radius: 20,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.add_a_photo,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              title: const Text(
                                                  "From where do you want to take the photo?"),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    GestureDetector(
                                                      child:
                                                          const Text("Gallery"),
                                                      onTap: () {
                                                        set.getFromGallery();
                                                        Navigator.pop(context);
                                                      },
                                                    ),
                                                    const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0)),
                                                    GestureDetector(
                                                      child: const Text("Camera"),
                                                      onTap: () {
                                                        set.getFromCamera();
                                                        Navigator.pop(context);
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ));
                                        });
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => CameraScreen()));
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.subtitles_sharp,
                            color: greyDark,
                          ),
                          title:
                              midText('Name', textColor(context,  isDark)),
                          subtitle: largeText(snapshot.data['name'],
                              textColor(context,  isDark)),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: greyDark,
                            ),
                            onPressed: () {
                              scaffoldKey.currentState!.showBottomSheet((context) => Container(
                                padding:const EdgeInsets.all(20) ,
                                color: greyLight,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    midTitle('Name' , textColor(context,  isDark)),
                                    const SizedBox(height: 15,),
                                    defaultTextFormField(controller: nameController ,
                                        keyboardType: TextInputType.name,
                                        onSaved: (value) => nameController.text = value ,
                                        validator: (value){
                                          if (value.isEmpty){
                                            return 'please enter your name';
                                          }
                                          else {
                                            return null;
                                          }
                                        }
                                    ),
                                    const SizedBox(height: 15,),
                                    Row(
                                      children: [
                                        TextButton(onPressed: (){}, child: subTitle('Save', Colors.green)),
                                        TextButton(onPressed: (){Navigator.pop(context);}, child: subTitle('Cancel', Colors.green)),
                                      ],
                                    ),
                                    const SizedBox(height: 15,),
                                  ],

                                ),
                              ),);
                            },
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.smartphone_outlined,
                            color: greyDark,
                          ),
                          title:
                              midText('phone', textColor(context,  isDark)),
                          subtitle: largeText(snapshot.data['phone'],
                              textColor(context,  isDark)),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: greyDark,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.email,
                            color: greyDark,
                          ),
                          title:
                              midText('Email', textColor(context,  isDark)),
                          subtitle: largeText(snapshot.data['email'],
                              textColor(context,  isDark)),
                        ),
                      ],
                    );
            }),
      ),
    );
  }
}
