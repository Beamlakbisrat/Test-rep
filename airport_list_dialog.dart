import 'package:flutter/material.dart';

Future<void> showAirportListDialog(BuildContext context, bool isFromDestination) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(isFromDestination ? 'From' : 'To'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Airport 1', style: TextStyle(color: Colors.indigo)),
              onTap: () {
                
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Airport 2', style: TextStyle(color: Colors.indigo)),
              onTap: () {
                
                Navigator.pop(context);
              },
            ),
            // Add more airports as needed
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.indigo),
            ),
          ),
        ],
      );
    },
  );
}
