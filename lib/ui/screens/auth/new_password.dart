import 'package:ecommerceapp/controller/auth_controller/auth_api.dart';
import 'package:ecommerceapp/controller/my_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/controller/settings_controller/lang_provider.dart';
import 'package:ecommerceapp/controller/settings_controller/settings_provider.dart';
import 'package:ecommerceapp/ui/screens/auth/login.dart';
import 'package:ecommerceapp/ui/widgets/custom_button.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:ecommerceapp/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class NewPassword extends StatelessWidget {

  var passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var email;
  var code;

  NewPassword({this.email, this.code});

  @override
  Widget build(BuildContext context) {

    final lang = context.select((LangProvider lang) => lang.langApi);
    final isDark = context.select((SettingsProvider dark) => dark.isDark);

    return Scaffold(
      appBar: AppBar(
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
                          title('New Password ',textColor(context,isDark)),
                          const SizedBox(
                            height: 40,
                          ),
                          subTitle('Password', textColor(context, isDark)),
                          defaultTextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscure: true,
                            onSaved: (value) => passwordController.text = value,
                            validator: (value) {
                              if (value.isEmpty || value.length < 5) {
                                return 'please enter correct PassWord';
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
                                  child: defaultButton('Done', fun: () {
                                    formKey.currentState!.save();
                                    if (formKey.currentState!.validate()) {
                                      resetPassword(lang,
                                          email: email,
                                          code: code,
                                          password: passwordController.text)
                                          .then((value) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                            SnackBar(content: Text(value)));
                                      });
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
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
    );
  }
}