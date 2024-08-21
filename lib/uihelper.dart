import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class uihelper {
  static CustomTextField(
    TextEditingController controller,
    String text,
    IconData iconData,
    bool toHide,
  ) {
    return TextField(
      controller: controller,
      obscureText: toHide,
      decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
    );
  }

  static customButton(VoidCallback voidCallback, String text) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          voidCallback();
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrangeAccent
        )
      ),
    );
  }

  static CustomAlertBox(BuildContext context,String text){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("proceed"))
        ],
      );
    });
  }
}
