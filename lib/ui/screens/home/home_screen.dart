import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/controller/home_controller/home_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/home_controller/home_api.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {

    final set = Provider.of<SettingsProvider>(context);
    final home = Provider.of<HomeProvider>(context);

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
                  future: getBanners(set.langApi),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
                          snapshot.data == null
                              ? const Center(child: CircularProgressIndicator())
                              : CarouselSlider.builder(
                                  itemBuilder: (context, item, index) {
                                    return  snapshot.data[item]['image'] == null ?
                                    Image.asset('images/NoImageFound.png')
                                    :Image.network(
                                      snapshot.data[item]['image'],
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width,
                                    );
                                  },
                                  itemCount: snapshot.data.length,
                                  carouselController: _controller,
                                  options: CarouselOptions(
                                      autoPlay: true,
                                      enlargeCenterPage: true,
                                      onPageChanged: (index, reason) {
                                        home.onPageChangedCarousel(index);
                                      }),
                                ),
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
                          set.isDark,
                        ),
                        txtAlign: TextAlign.start),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                        future: getCategories(set.langApi),
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
                                      itemBuilder: (context, index) => Column(
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
                                                set.isDark,
                                              ))
                                        ],
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
            midText( 'Best Selling', textColor( context, set.isDark, ), txtAlign: TextAlign.start),
            const SizedBox(height: 15,),
            Expanded(
              child: FutureBuilder(
                 future: getHomeData(set.langApi),
                     builder: (BuildContext context,  AsyncSnapshot<dynamic> snapshot) {
                   return snapshot.data == null
                       ? const Center(child: CircularProgressIndicator())
                       : StaggeredGridView.countBuilder(
                       crossAxisCount: 4,
                       itemCount:snapshot.data.length,
                       itemBuilder: (BuildContext context, int index)=> Card(
                         elevation: 3,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Image.network(snapshot.data[index]['image'] ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: proText(snapshot.data[index]['name'],textColor(context,set.isDark,),txtAlign: TextAlign.center ),
                             ),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: midText(snapshot.data[index]['price'].toString(), green),
                             ),
                           ],
                         ),
                       ),
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
