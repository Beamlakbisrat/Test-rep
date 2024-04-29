import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:guzogo_app/airport_list_dialog.dart';
import 'package:guzogo_app/date_picker.dart';

class GuzogoHomePage extends StatefulWidget {
  @override
  _GuzogoHomePageState createState() => _GuzogoHomePageState();
}

class _GuzogoHomePageState extends State<GuzogoHomePage> {
  String _fromDestination = 'Addis Ababa'; 
  String _toDestination = 'Select Destination'; 
  DateTime _departureDate = DateTime.now(); 
  DateTime _returnDate = DateTime.now(); 
  String _selectedCabinClass = 'Economy'; 
  int _adults = 1; 
  int _children = 0; 
  int _infants = 0; /
  bool _isReturnTrip = true; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GuzoGo'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assetss/imagaes.jpg'),
                  fit: BoxFit.cover,
                ),
                color: Colors.indigo.withOpacity(0.5),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ),
                  Text(
                    'GuzoGo',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Return'),
                      Switch(
                        value: _isReturnTrip,
                        onChanged: (value) {
                          setState(() {
                            _isReturnTrip = value;
                            if (!_isReturnTrip) {
                        
                              _returnDate = null;
                            }
                          });
                        },
                      ),
                      Text('One-Way'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          
                          showAirportListDialog(context, true);
                        },
                        child: Text(_fromDestination),
                      ),
                      GestureDetector(
                        onTap: () {
                         
                          showAirportListDialog(context, false);
                        },
                        child: Text(_toDestination),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Bole International Airport',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  if (_isReturnTrip) 
                    GestureDetector(
                      onTap: () {
                        selectReturnDate(context);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Return Date'),
                          Text(
                            _returnDate != null
                                ? DateFormat('dd MMM, EEEE').format(_returnDate)
                                : 'Select Return Date',
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            // Body
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Departure Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      showCustomDatePicker(context, false)
                  
                    },
                    child: Text(
                      DateFormat('dd MMM, EEEE').format(_departureDate),
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Cabin Class',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCabinClass = 'Economy';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: _selectedCabinClass == 'Economy' ? Colors.blue : Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text('Economy'),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCabinClass = 'Business';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: _selectedCabinClass == 'Business' ? Colors.blue : Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text('Business'),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCabinClass = 'First';
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: _selectedCabinClass == 'First' ? Colors.blue : Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text('First'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Passenger Number',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_adults > 1) _adults--;
                          });
                        },
                        child: Icon(Icons.remove),
                      ),
                      SizedBox(width: 10.0),
                      Text('Adults: $_adults'),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _adults++;
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_children > 0) _children--;
                          });
                        },
                        child: Icon(Icons.remove),
                      ),
                      SizedBox(width: 10.0),
                      Text('Children: $_children'),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _children++;
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_infants > 0) _infants--;
                          });
                        },
                        child: Icon(Icons.remove),
                      ),
                      SizedBox(width: 10.0),
                      Text('Infants: $_infants'),
                      SizedBox(width: 10.0),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _infants++;
                          });
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Implement search functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.book),
                onPressed: () {
                  // Implement booking functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  // Handle notification button press
                },
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  // Implement settings functionality
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Implement search functionality
        },
        child: Text('Search Flights'),
        style: ElevatedButton.styleFrom(
          primary: Colors.yellow,
          onPrimary: Colors.black,
        ),
      ),
    );
  }
}
