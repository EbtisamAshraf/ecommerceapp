import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/home_controller/home_api.dart';
import 'package:ecommerceapp/controller/settings_controller/lang_provider.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/ui/screens/home/product_details_screen.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class CategoryDetails extends StatelessWidget {
 int id;
 String name;

 CategoryDetails(this.id , this.name);


  @override
  Widget build(BuildContext context) {


    final auth = Provider.of<AuthProvider>(context );
    final isDark = context.select((SettingsProvider dark) => dark.isDark);
    final lang = context.select((LangProvider lang) => lang.langApi);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title:  midText( name, textColor( context,  isDark, ),),),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getCategoriesDetails(langApi:lang ,token:  auth.token, id:id ),
                builder: (BuildContext context,  AsyncSnapshot<dynamic> snapshot) {
                  return snapshot.data == null
                      ? const Center(child: CircularProgressIndicator())
                      : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: StaggeredGridView.countBuilder(
                        crossAxisCount: 4,
                        itemCount:snapshot.data.length,
                        itemBuilder: (BuildContext context, int index)=> GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails(snapshot.data[index]['id'],snapshot.data[index]['name'] )));
                          },
                          child: Card(
                            elevation: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(snapshot.data[index]['image'] ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: proText(snapshot.data[index]['name'],textColor(context, isDark,),txtAlign: TextAlign.center ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: midText(snapshot.data[index]['price'].toString(), green),
                                ),
                              ],
                            ),
                          ),
                        ),
                        crossAxisSpacing: 7,
                        mainAxisSpacing:7,
                        staggeredTileBuilder: (int index) =>  const StaggeredTile.fit(2)),
                      );
                }

            ),
          ),
        ],
      ),

    );
  }
}
