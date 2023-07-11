import 'package:flutter/material.dart';
import 'package:mvvmproject/Utils/Utils.dart';
import 'package:mvvmproject/ViewModel/Register_view_modal.dart';
import 'package:mvvmproject/ViewModel/Login_View_Model.dart';
import 'package:mvvmproject/ViewModel/Token_View_Model.dart';
import 'package:mvvmproject/res/Component/Custom_Textform_Field.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passeordcontroller = TextEditingController();
  FocusNode emailfocusnode = FocusNode();
  FocusNode password = FocusNode();

  @override
  Widget build(BuildContext context) {
    final authviewmodel = Provider.of<LoginViewModel>(context);
    final authregisterviewmodel = Provider.of<AuthRegisterViewModel>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 20
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            CustomTextFormField(controller: emailcontroller, hint_text: 'Enter Email', current: emailfocusnode, next: password),
            SizedBox(height: MediaQuery.of(context).size.height * .03),
            CustomTextFormField(controller: passeordcontroller, hint_text: 'Enter password', current: password, next: password),
            SizedBox(height: MediaQuery.of(context).size.height * .07),
            ElevatedButton(

              //Login Api Key===>  eve.holt@reqres.in
                child: LoginViewModel().loading ? CircularProgressIndicator() : Text('LogIn'),
                onPressed: (){
                  if(emailcontroller.text.isEmpty || passeordcontroller.text.isEmpty){

                    Utils().ShowSnackbar(context, 'Fill all the field');
                  }
                  else{
                    Map data = {
                      'email' : emailcontroller.text.toString(),
                      'password' : passeordcontroller.text.toString()
                    };
                    authviewmodel.LoginApi( data,context);
                    print("Api Hit");
                  }
                }),
          ],
        ),
      ),
    );
  }
}
