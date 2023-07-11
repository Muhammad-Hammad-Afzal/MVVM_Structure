import 'package:flutter/material.dart';

class Utils{
  static changeFocus(BuildContext context, FocusNode current, FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  void ShowSnackbar(BuildContext context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.black,
        )
    );
  }
}

// class snackbarUtils{
//   void ShowSnackbar(BuildContext context, String message){
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//           content: Text(message),
//           backgroundColor: Colors.black,
//       )
//     );
//   }
// }