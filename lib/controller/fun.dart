import 'dart:io';

import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



buildCardSettings({required String text, required String image,required BuildContext context, GestureTapCallback? onTap , required bool isDark}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: MediaQuery.of(context).size.height * 0.07,
      margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.symmetric(vertical: 3),
                // color: Colors.lightGreen[300],
                child: SvgPicture.asset(image)),
            const SizedBox(
              width: 20,
            ),
            midText(text , textColor(context, isDark)),
            const Expanded(child: SizedBox()),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    ),
  );
}



Color textColor(BuildContext context , bool isDark){
  var color = isDark == false ? Colors.black : Colors.white;
  return color;
}

// Future <bool> onBackPressed ( BuildContext context) async{
//   return await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title:  const Text('هل تود الخروج؟', textAlign:TextAlign.center ,),
//         actions: [
//           TextButton(
//             child: const Text('لا'),
//             onPressed: () =>
//                 Navigator.of(context).pop(false),
//           ),
//           TextButton(
//               child: const Text('نعم'),
//               onPressed: () {
//                 exit(0);
//               }
//           ),
//         ],
//       ));
// }