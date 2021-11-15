import 'package:ecommerceapp/ui/widgets/custom_button.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:ecommerceapp/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';

class SignUp extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0.0,
          leading: IconButton(
            onPressed:(){
              Navigator.pop(context);
            } ,
            icon: const Icon(Icons.arrow_back , color: black,),),
        ),
        body: Center(
          child: SingleChildScrollView(
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
                              title('Sign Up '),
                              const SizedBox(
                                height: 40,
                              ),
                              subTitle('Name' ),
                              defaultTextFormField(controller: nameController ,
                                  keyboardType: TextInputType.name,
                                  onSaved: (value) => nameController = value ,
                                validator: (value){
                                  if (value.isEmpty){
                                    return 'please enter your name';
                                  }
                                  else {
                                    return null;
                                  }
                                }
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              subTitle('Email'),
                              defaultTextFormField(controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (value) => emailController = value ,
                                validator: (value){
                                  if (!(value.contains('@')) || !(value.contains('.com')) || value.isEmpty){
                                    return 'please enter correct email';

                                  }
                                  else {
                                    return null;
                                  }
                                },),
                              const SizedBox(
                                height: 20,
                              ),
                              subTitle('Password'),
                              defaultTextFormField(controller: passwordController,
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
                                },),
                              const SizedBox(
                                height: 50,
                              ),
                              Center(
                                  child: SizedBox(
                                      width: double.infinity,
                                      child: defaultButton('SIGN UP' ,fun: (){
                                        if (formKey.currentState!.validate()){

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
      ),
    );
  }
}
