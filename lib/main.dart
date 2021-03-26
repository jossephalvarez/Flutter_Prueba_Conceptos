/// Flutter code sample for BottomNavigationBar

import 'package:flutter/material.dart';
import 'package:app_poc/ui/pages/camera_page.dart';
import 'package:app_poc/ui/pages/result_page.dart';
import 'package:camera/camera.dart';
import 'package:geolocator/geolocator.dart';

List<CameraDescription> cameras;

void getCurrentLocation() async {
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  var lat = position.latitude;
  var long = position.longitude;
  print('${lat}- ${long}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  LocationPermission permission = await Geolocator.requestPermission();
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  var lat = position.latitude;
  var long = position.longitude;
  print("${cameras.length} CAMERAS!");
  print("$permission permission!");
  print("'$lat- $long coords!");
  runApp(MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({key}) : super();

  static const String _title = 'Flutter POC APP';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const MyStatefulWidget({Key}) : super();

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Location',
      style: optionStyle,
    ),
    Text(
      'Index 1: HOME',
      style: optionStyle,
    ),
    Text(
      'Index 2: CAMERA',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
/*    setState(() {
      _selectedIndex = index;
    });*/
    print(index);
    switch (index) {
      case 0:
        {
          print('....0');
          setState(() {
            _selectedIndex = index;
          });
        }
        break;

      case 1:
        {
          print('....1');
          setState(() {
            _selectedIndex = index;
          });
        }
        break;
      case 2:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CameraPage(
                      cameras: cameras,
                    )),
          );
        }
        break;
      default:
        {
          print('default');
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FLUTTER POC APP'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.gps_fixed_outlined),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Camera',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
