import 'package:ecommerceapp/controller/auth_controller/auth_api.dart';
import 'package:ecommerceapp/controller/my_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/settings_controller/lang_provider.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
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


    final lang = context.select((LangProvider lang) => lang.langApi);
    final isDark = context.select((SettingsProvider dark) => dark.isDark);


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:  Text(
            'Forgot Password',
            style: TextStyle(color: textColor(context, isDark ,)),
          ),
          backgroundColor: textColor(context, !isDark ,),
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:  Icon(
              Icons.arrow_back,
              color: textColor(context, isDark ,),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                    color:  textColor(context, !isDark ,),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            subTitle('Email' ,textColor(context, isDark)),
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
                                        verifyEmail(lang,  email: emailController.text).then((value) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value),));
                                        });
                                        verifyCode(lang,  email: emailController.text,code: code);
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
                                                        verifyCode(lang,  email:emailController.text ,code: codeController.text ).then((value) {
                                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
                                                          if (value != '?????????? ???????? ?????? ?????????????? ?????? ????????' || value != 'The code you have entered is not valid'){
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


