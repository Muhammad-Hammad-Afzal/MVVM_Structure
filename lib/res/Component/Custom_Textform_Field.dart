import 'package:flutter/material.dart';
import 'package:mvvmproject/Utils/Utils.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final String hint_text;
  final bool obsecure;
  final FocusNode current;
  final FocusNode next;

   CustomTextFormField({Key? key,
      required this.controller,
      required this.hint_text,
      this.obsecure = false,
      required this.current,
      required this.next
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecure,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: hint_text
      ),
      onFieldSubmitted: (value){
        Utils.changeFocus(context, current, next);
      },
    );
  }
}
