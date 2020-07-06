import 'package:facturamobile/app/res/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget inputText(String text, String Function(String) validator,
    void Function(String) onSaved, IconData icon,TextInputType keyboardType,
    {bool obscureText = false,String initialValue,void Function() onTap,
    TextEditingController controller}) {
  return TextFormField(
    controller: controller,
    onTap: onTap,
    initialValue: initialValue,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: text,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.greenAccent,
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blueAccent,
        ),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.redAccent,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      prefixIcon: Icon(icon),
      hintText: text,
    ),
    obscureText: obscureText,
    validator: validator,
    onSaved: onSaved,
  );
}

Widget button(void Function() onPressed, Widget child) {
  return FlatButton(
    onPressed: onPressed,
    child: child,
    color: Colors.blueGrey,
    shape: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.blue,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
}

Widget appBar(String data) {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                   data,
                  style: TextStyle(
                    fontSize: 22,
                    color: AppTheme.darkText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
