import 'package:ecommerceapp/controller/my_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/home_controller/home_api.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:provider/provider.dart';
import '../../../../constant.dart';


class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final set = Provider.of<SettingsProvider>(context);


    return Scaffold(
      appBar: AppBar(title: midText('fAQ',textColor(context, set.isDark ,)),centerTitle: true,),
      body: FutureBuilder(
         future: getFAQ(set.langApi),
          builder:(BuildContext context,AsyncSnapshot<dynamic> snapshot){
          return snapshot.data == null ? const Center(child: CircularProgressIndicator()) :
          ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder:(context , index) => Accordion(
              scrollIntoViewOfItems: ScrollIntoViewOfItems.none,
                maxOpenSections: 1,
                headerPadding:  const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                contentVerticalPadding: 10,
                paddingListBottom: 5,
                children: [
                  AccordionSection(
                    isOpen: false,
                    leftIcon:  const Icon(Icons.compare_rounded, color: Colors.white),
                    header: midText(snapshot.data[index]['question'],textColor(context, set.isDark ,) ,txtAlign: TextAlign.center),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: midDetailsText(snapshot.data[index]['answer'], greyDark,txtAlign: TextAlign.end),
                    ),
                  ),

                ],
              ),

          );
    }

      ),
    );
  }
}
