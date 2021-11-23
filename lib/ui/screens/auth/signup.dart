import 'package:ecommerceapp/controller/auth_controller/auth_api.dart';
import 'package:ecommerceapp/controller/my_provider.dart';
import 'package:ecommerceapp/controller/fun.dart';
import 'package:ecommerceapp/ui/widgets/custom_button.dart';
import 'package:ecommerceapp/ui/widgets/custom_text.dart';
import 'package:ecommerceapp/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:provider/provider.dart';
import '../../../constant.dart';

class SignUp extends StatelessWidget {


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final C = Provider.of<MyProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: textColor(context, !C.isDark ,),
          elevation: 0.0,
          leading: IconButton(
            onPressed:(){
              Navigator.pop(context);
            } ,
            icon:  Icon(Icons.arrow_back , color: textColor(context, C.isDark ,),),),
        ),
        body: Center(
          child: SingleChildScrollView(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              title('Sign Up ' , textColor(context, C.isDark),),
                               const SizedBox(
                                height: 40,
                              ),
                              subTitle('Name' , textColor(context, C.isDark)),
                              defaultTextFormField(controller: nameController ,
                                  keyboardType: TextInputType.name,
                                  onSaved: (value) => nameController.text = value ,
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
                              subTitle('Email' ,textColor(context, C.isDark)),
                              defaultTextFormField(controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                onSaved: (value) => emailController.text = value ,
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
                              subTitle('Phone', textColor(context, C.isDark) ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                      child:CountryCodePicker(
                                        dialogBackgroundColor: textColor(context, !C.isDark ,),
                                        initialSelection: 'eg',
                                        favorite: const ['+02','eg'],
                                        hideMainText: true,
                                        onChanged:(val){
                                          C.buildCountryCode(val);
                                        }
                                      )) ,
                                   Expanded(
                                    flex: 1,
                                    child: Text(C.countryCode),
                                       ),
                                  Expanded(
                                    flex: 4,
                                    child: defaultTextFormField(
                                     controller: phoneController,
                                        keyboardType: TextInputType.phone,
                                        onSaved: (value) => phoneController.text = value ,
                                        validator: (value){
                                          if (value.isEmpty){
                                            return 'please enter your phone number';
                                          }
                                          else {
                                            return null;
                                          }
                                        },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              subTitle('Password', textColor(context, C.isDark)),
                              defaultTextFormField(controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscure: true,
                                onSaved: (value) => passwordController.text = value ,
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
                                      width:MediaQuery.of(context).size.width,
                                      child: defaultButton('SIGN UP' ,fun: (){
                                        formKey.currentState!.save();
                                        if (formKey.currentState!.validate()){
                                          signUp(name:nameController.text ,
                                              email: emailController.text ,
                                              password: passwordController.text ,
                                              phone: C.countryCode.toString() + phoneController.text
                                              ).then((value) {
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(value) ,));
                                          });
                                          print(nameController.text);
                                          print(emailController.text);
                                          print(C.countryCode.toString() + phoneController.text);
                                          print(passwordController.text);

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
