import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/ui/screens/auth/reset_password.dart';
import 'package:ecommerceapp/ui/screens/auth/signup.dart';
import 'package:ecommerceapp/ui/widgets/custom_button.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:ecommerceapp/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:async/async.dart';

class LogIn extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  // final fb = FacebookLogin();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          mainAxisSize:MainAxisSize.min ,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                title('Welcome, '),
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                                },
                                  child:const Text('Sign Up', style: TextStyle(fontSize: 18 ,color: green),), )

                              ],
                            ),
                            const SizedBox(height: 10,),
                            subTitle('Sign in to Continue'),
                           const SizedBox(height: 40,),
                            subTitle('Email'),
                            defaultTextFormField(
                              controller:emailController,
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (value) => emailController = value ,
                                validator: (value){
                                  if (!(value.contains('@')) || !(value.contains('.com')) || value.isEmpty){
                                    return 'please enter correct email';

                                  }
                                  else {
                                    return null;
                                  }
                                }, ),
                            const SizedBox(height: 20,),
                            subTitle('Password'),
                            defaultTextFormField(controller:passwordController ,
                              keyboardType: TextInputType.visiblePassword,
                              obscure: true,
                              onSaved: (value) => passwordController = value ,
                              validator:  (value){
                                if ( value.isEmpty || value.length <5 ){
                                  return 'please enter correct PassWord';
                                }
                                else {
                                  return null;
                                }
                              },

                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    style: const  ButtonStyle(alignment: AlignmentDirectional.centerEnd),
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ResetPassword()));
                                    },
                                    child: subTitle('Forgot Password?')),],
                              ),
                            const SizedBox(height: 20,),
                            Center(child: SizedBox(
                                width: double.infinity,
                                child: defaultButton('SIGN IN',
                                    fun:(){
                                  if (formKey.currentState!.validate()){

                                  }
                                    }  ))),

                          ],

                        ),
                      ),
                    )),
                 const Text('-OR-' ,style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                const SizedBox(height: 40,),
                 SizedBox(
                   width: double.infinity,
                     child: outLineButton('Sign In with Facebook' ,
                       image: 'images/Icon_Facebook.svg' ,
                     // fun: _handleSignInFace
     )
    ),
                const SizedBox(height: 20,),
                 SizedBox(
                     width: double.infinity,
                     child: outLineButton('Sign In with Google' ,
                         image: 'images/icons8_Google_2.svg',
                       fun:_handleSignIn


                     )),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  // Future<void> _handleSignInFace() async {
  //   try {
  //     final res = await fb.expressLogin();
  //     if (res.status == FacebookLoginStatus.success) {
  //       final FacebookAccessToken? accessToken = res.accessToken;
  //       print('Access token: ${accessToken!.token}');
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }


}
