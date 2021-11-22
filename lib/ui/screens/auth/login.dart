
import 'package:ecommerceapp/constant.dart';
import 'package:ecommerceapp/controller/auth_controller/auth_api.dart';
import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/shared_pref.dart';
import 'package:ecommerceapp/model/auth_model/login_model.dart';
import 'package:ecommerceapp/ui/screens/auth/reset_password.dart';
import 'package:ecommerceapp/ui/screens/auth/signup.dart';
import 'package:ecommerceapp/ui/screens/home/main_screen.dart';
import 'package:ecommerceapp/ui/screens/home/home_screen.dart';
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
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';



class LogIn extends StatelessWidget {



  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  // final fb = FacebookLogin();


  @override
  Widget build(BuildContext context) {
    final C = Provider.of<MyProvider>(context);
    Future <bool> onBackPressed ( ) async{

      return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title:  const Text('هل تود الخروج؟', textAlign:TextAlign.center ,),
            actions: [
              TextButton(
                child: const Text('لا'),
                onPressed: () =>
                    Navigator.of(context).pop(false),
              ),
              TextButton(
                  child: const Text('نعم'),
                  onPressed: () {
                    exit(0);
                  }
              ),
            ],
          ));
    }

    return WillPopScope(
     onWillPop:onBackPressed ,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                      color: textColor(context, !C.isDark ,),
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
                                  title('Welcome, ', textColor(context, C.isDark)),
                                  TextButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                                  },
                                    child:const Text('Sign Up', style: TextStyle(fontSize: 18 ,color: green),), )

                                ],
                              ),
                              const SizedBox(height: 10,),
                              subTitle('Sign in to Continue' , textColor(context, C.isDark)),
                             const SizedBox(height: 40,),
                              subTitle('Email', textColor(context, C.isDark)),
                              defaultTextFormField(
                                controller:emailController,
                                  keyboardType: TextInputType.emailAddress,
                                   onSaved: (value) => emailController.text = value ,
                                  validator: (value){
                                    if (!(value.contains('@')) || !(value.contains('.com')) || value.isEmpty){
                                      return 'please enter correct email';

                                    }
                                    else {
                                      return null;
                                    }
                                  }, ),
                              const SizedBox(height: 20,),
                              subTitle('Password' , textColor(context, C.isDark)),
                              defaultTextFormField(
                                suffixIcon:  C.unHide ?
                                IconButton( icon:  Icon(Icons.visibility),onPressed:C.showPassword ,) :
                                IconButton( icon: Icon(Icons.visibility_off),onPressed:C.showPassword ,),
                                controller:passwordController ,
                                keyboardType: TextInputType.visiblePassword,
                                obscure: C.unHide,
                                onSaved: (value) => passwordController.text = value ,
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
                                      child: subTitle('Forgot Password?' , textColor(context, C.isDark))),],
                                ),
                              const SizedBox(height: 20,),
                              Center(child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: defaultButton('SIGN IN',
                                      fun:(){
                                    formKey.currentState!.save();
                                    if (formKey.currentState!.validate()){
                                      login(email:emailController.text ,password:passwordController.text ).then((value){
                                        LogInModel val =  value;
                                        SharedPref.saveData(key: 'token', value: val.data!.token) ;
                                         C.getToken(val.data!.token.toString());
                                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(val.message.toString())));
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=> MainScreen()));

                                      });

                                    }
                                      }  ))),

                            ],

                          ),
                        ),
                      )),
                   const Text('-OR-' ,style: TextStyle(fontSize: 18),textAlign: TextAlign.center,),
                  const SizedBox(height: 40,),
                   SizedBox(
                     width: MediaQuery.of(context).size.width,
                       child: outLineButton('Sign In with Facebook' ,
                         image: 'images/Icon_Facebook.svg' ,
                        fun: _handleSignInFaceBook
       )
      ),
                  const SizedBox(height: 20,),
                   SizedBox(
                       width: MediaQuery.of(context).size.width,
                       child: outLineButton('Sign In with Google' ,
                           image: 'images/icons8_Google_2.svg',
                         fun:_handleSignIn


                       )),
                ],
              ),
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

  Future<void> _handleSignInFaceBook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
    } else {
      print(result.status);
      print(result.message);
    }


  }

}

// final userData = await FacebookAuth.instance.getUserData();
//    final  facebookAuthCredential = FacebookAuthProvider.credential(LoginResult.accessToken!.token);
//    await FacebookAuth.instance.signInWithCredential(facebookAuthCredential);