import 'package:ecommerceapp/controller/auth_controller/auth_api.dart';
import 'package:ecommerceapp/controller/auth_controller/auth_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/ui/screens/auth/new_password.dart';
import 'package:ecommerceapp/ui/widgets/custom_button.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:ecommerceapp/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class ResetPassword extends StatelessWidget {
  var emailController = TextEditingController();
  var codeController = TextEditingController();
  var passwordController = TextEditingController();
  var code = '2129';
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formK = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final C = Provider.of<MyProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Forgot Password',
            style: TextStyle(color: black),
          ),
          backgroundColor: white,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: black,
            ),
          ),
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
                            subTitle('Email' ,textColor(context, C.isDark)),
                            defaultTextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (value) => emailController.text = value,
                              validator: (value) {
                                if (!(value.contains('@')) ||
                                    !(value.contains('.com')) ||
                                    value.isEmpty) {
                                  return 'please enter correct email';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Center(
                                child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: defaultButton('Reset Password',
                                        fun: () {
                                      formKey.currentState!.save();
                                      if (formKey.currentState!.validate()) {
                                        verifyEmail(email: emailController.text).then((value) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value),));
                                        });
                                        verifyCode(email: emailController.text,code: code);
                                        showDialog(context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title: const Text(
                                                      'Check your email for the verification code'),
                                                  content: defaultTextFormField(
                                                    controller:
                                                        codeController,
                                                    onSaved: (value) =>
                                                        codeController.text =
                                                            value,
                                                    keyboardType:
                                                        TextInputType.number,
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(context,
                                                              'Cancel'),
                                                      child:
                                                          const Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      child: const Text('OK'),
                                                      onPressed: () {
                                                        verifyCode(email:emailController.text ,code: codeController.text ).then((value) {
                                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
                                                          if (value != 'الكود الذي قمت بادخاله غير صحيح' ){
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                        NewPassword(
                                                                          email:
                                                                          emailController.text,
                                                                          code:
                                                                          codeController.text,
                                                                        )));
                                                          }
                                                          else {
                                                            return '';
                                                          }
                                                        });

                                                        }
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


