import 'package:ecommerceapp/ui/widgets/custom_button.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:ecommerceapp/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class ResetPassword extends StatelessWidget {
   var emailController = TextEditingController();
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();


   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Forgot Password',style: TextStyle(color: black),),
          backgroundColor: white,
          elevation: 0.0,
          leading: IconButton(
            onPressed:(){
              Navigator.pop(context);
            } ,
            icon: const Icon(Icons.arrow_back , color: black,),),
        ),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            subTitle('Email'),
                            defaultTextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (value) => emailController = value ,
                              validator: (value){
                                if (!(value.contains('@')) || !(value.contains('.com')) || value.isEmpty){
                                  return 'please enter correct email';

                                }
                                else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Center(
                                child: SizedBox(
                                    width: double.infinity,
                                    child: defaultButton('Reset Password' ,
                                        fun: (){
                                      if (formKey.currentState!.validate()){
                                        showDialog(context:context,builder: (BuildContext context) =>  AlertDialog(
                                          title: const Text('Check your email for the verification code'),
                                          content: defaultTextFormField(keyboardType: TextInputType.number),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, 'Cancel'),
                                              child:  const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, 'OK'),
                                              child:  const Text('OK'),
                                            ),
                                          ],

                                        ));
                                      }


                                    }))),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
