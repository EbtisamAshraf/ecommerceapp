import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/home_controller/home_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomeScreen extends StatelessWidget {

  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final C = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                future: getBanners(),
                builder: (BuildContext context,
                    AsyncSnapshot<dynamic> snapshot)=>
                snapshot.data == null ? const Center(child: CircularProgressIndicator()): CarouselSlider.builder(
                  itemBuilder:(context , item , index) {
                    // print('data :${snapshot.data[item]['image']} ');
                    return  Image.network(snapshot.data[item]['image'] ,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,);
                  },
                  itemCount:  snapshot.data.length,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        C.onTapCarousel(index);
                      }),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          ),



        ],
      ),

    );
  }
}
