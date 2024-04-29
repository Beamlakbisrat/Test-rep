import 'package:flutter/material.dart';

Future<DateTime> showCustomDatePicker(BuildContext context, DateTime initialDate) async {
  return await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime.now(),
    lastDate: DateTime(DateTime.now().year + 1),
    builder: (BuildContext context, Widget child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(
            primary: Colors.indigo, 
            onPrimary: Colors.white, 
            onSurface: Colors.indigo, 
          ),
          textTheme: TextTheme(
            subtitle1: TextStyle(color: Colors.indigo), 
            button: TextStyle(color: Colors.indigo), 
          ),
        ),
        child: child,
      );
    },
  );
}
