// import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'dart:convert';
// import 'dart:async';
//
// import 'package:provider/provider.dart';
//
// class CameraScreen extends StatefulWidget {
//   const CameraScreen({Key? key}) : super(key: key);
//
//   @override
//   _CameraScreenState createState() => _CameraScreenState();
// }
//
// class _CameraScreenState extends State<CameraScreen> {
//   File? imageFile;
//   var base64Image;
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final set = Provider.of<SettingsProvider>(context);
//
//     Future _showSelectionDialog(BuildContext context) {
//       return showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//                 title: const Text("From where do you want to take the photo?"),
//                 content: SingleChildScrollView(
//                   child: ListBody(
//                     children: <Widget>[
//                       GestureDetector(
//                         child: const Text("Gallery"),
//                         onTap: () {
//                           set.getFromGallery();
//                           Navigator.pop(context);
//                         },
//                       ),
//                       const Padding(padding: EdgeInsets.all(8.0)),
//                       GestureDetector(
//                         child: const Text("Camera"),
//                         onTap: () {
//                           set.getFromCamera();
//                           Navigator.pop(context);
//                         },
//                       )
//                     ],
//                   ),
//                 ));
//           });
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           "add photo",
//           style: TextStyle(color: Colors.green),
//         ),
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.grey,
//             size: 35,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Center(
//         child:
//              Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 AlertDialog(
//                     title: const Text("From where do you want to take the photo?"),
//                     content: SingleChildScrollView(
//                       child: ListBody(
//                         children: <Widget>[
//                           GestureDetector(
//                             child: const Text("Gallery"),
//                             onTap: () {
//                               set.getFromGallery();
//                               Navigator.pop(context);
//                             },
//                           ),
//                           const Padding(padding: EdgeInsets.all(8.0)),
//                           GestureDetector(
//                             child: const Text("Camera"),
//                             onTap: () {
//                               set.getFromCamera();
//                               Navigator.pop(context);
//                             },
//                           )
//                         ],
//                       ),
//                     )),
//                 imageFile != null?   Container(
//                   height: 200.0,
//                   width: MediaQuery.of(context).size.width,
//                   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                   decoration: BoxDecoration(
//                     color: const Color(0xff7c94b6),
//                     image:  DecorationImage(
//                       image:  FileImage(imageFile!),
//                       fit: BoxFit.cover,
//                     ),
//                     border: Border.all(color: Colors.black, width: 0.05),
//                     borderRadius:
//                     BorderRadius.all(const Radius.circular(10.0)),
//                   ),
//                 ) : Container(
//                   height: 200.0,
//                   width: MediaQuery.of(context).size.width,
//                   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//                   decoration: BoxDecoration(
//                     color: const Color(0xff7c94b6),
//                     border: Border.all(color: Colors.black, width: 0.05),
//                     borderRadius:
//                     const BorderRadius.all(Radius.circular(10.0)),
//                   ),
//                 ),
//               ],
//             )
//
//
//       ),
//     );
//   }
// }