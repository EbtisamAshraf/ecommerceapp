import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/home_controller/home_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/home_controller/home_api.dart';
import 'package:ecommerceapp/controller/settings_controller/lang_provider.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/model/home_model/banners_model.dart';
import 'package:ecommerceapp/ui/screens/category/category_details_screen.dart';
import 'package:ecommerceapp/ui/screens/home/product_details_screen.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'main_screen.dart';

class HomeScreen extends StatelessWidget {

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {


    final home = context.select((HomeProvider home) => home.onPageChangedCarousel(5));
    final lang = context.select((LangProvider lang) => lang.langApi);
    final isDark = context.select((SettingsProvider dark) => dark.isDark);


    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // banners
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height:  MediaQuery.of(context).size.height * 0.15,
                child: FutureBuilder(
                  future: getBanners(lang),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
                         ( snapshot.hasData) ? CarouselSlider.builder(
                           itemBuilder: (context, item, index) {
                             return  snapshot.data[item]['image'] == null ?
                             Image.asset('images/NoImageFound.png')
                                 :
                             Image.network(snapshot.data[item]['image'],);
                             // CachedNetworkImage(
                             //   imageUrl:
                             //   snapshot.data[item]['image'],
                             //   // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                             //   // errorWidget: (context, url, error) => Icon(Icons.error),
                             //   fit: BoxFit.cover,
                             //   width: MediaQuery.of(context).size.width,
                             // )

                             // CachedNetworkImage(
                             //   imageUrl: "https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg",
                             //   placeholder: (context, url) => CircularProgressIndicator(),
                             //   errorWidget: (context, url, error) => Icon(Icons.error),
                             // )

                            // ;
                           },
                           itemCount: snapshot.data.length,
                           carouselController: _controller,
                           options: CarouselOptions(
                               autoPlay: true,
                               enlargeCenterPage: true,
                               onPageChanged: (index, reason) {
                                 home;
                               }),
                         ):Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            // Categories
            SizedBox(
              height:  MediaQuery.of(context).size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    midText(
                        'Categories',
                        textColor(
                          context,
                          isDark,
                        ),
                        txtAlign: TextAlign.start),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                        future: getCategories(lang),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          return snapshot.data == null
                              ? const Center(child: CircularProgressIndicator())
                              : Center(
                                  child: SizedBox(
                                    height:  MediaQuery.of(context).size.height * 0.15,
                                    width: double.infinity,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data.length,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        width: 14,
                                      ),
                                      itemBuilder: (context, index) => GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryDetails(snapshot.data[index]['id'], snapshot.data[index]['name'].toString())));
                                        },
                                        child: Column(
                                          children: [
                                            CircleAvatar(
                                              radius: 35,
                                              backgroundImage: NetworkImage(
                                                  snapshot.data[index]['image']),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            subTitle(
                                                snapshot.data[index]['name'],
                                                textColor(
                                                  context,
                                                  isDark,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                        }),
                  ],
                ),
              ),
            ),
            // Best Selling
            Container(width: double.infinity,
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: midText( 'Best Selling', textColor( context, isDark, ), txtAlign: TextAlign.start)),
            const SizedBox(height: 15,),
            Expanded(
              child: FutureBuilder(
                 future: getHomeData(lang),
                     builder: (BuildContext context,  AsyncSnapshot<dynamic> snapshot) {
                   return snapshot.data == null
                       ? const Center(child: CircularProgressIndicator())
                       : StaggeredGridView.countBuilder(
                       crossAxisCount: 4,
                       itemCount:snapshot.data.length,
                       itemBuilder: (BuildContext context, int index)=> Card(
                         elevation: 3,
                         child: GestureDetector(
                           onTap: (){

                             Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetails( snapshot.data[index]['id'],snapshot.data[index]['name'].toString())));
                           },


                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Image.network(snapshot.data[index]['image'] ),
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: proText(snapshot.data[index]['name'],textColor(context,isDark,),txtAlign: TextAlign.center ),
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
                       padding: EdgeInsets.all(15),
                       staggeredTileBuilder: (int index) =>  const StaggeredTile.fit(2));
      }

              ),
            ),
          ],
        ),

      ),
    );
  }
}
