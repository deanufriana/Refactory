import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationWidget extends StatefulWidget {
  LocationWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  LocationData _locationData;

  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_locationData != null)
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: [
                  Text(
                    'Posisi saat ini',
                    style: TextStyle(
                      fontSize: width * 0.04,
                    ),
                  ),
                  SizedBox(
                    height: width * 0.03,
                  ),
                  Text(
                    'Longitude: ${_locationData.longitude.toString()}',
                    style: TextStyle(
                      fontSize: width * 0.04,
                    ),
                  ),
                  SizedBox(
                    height: width * 0.02,
                  ),
                  Text(
                    'Latitude: ${_locationData.latitude.toString()}',
                    style: TextStyle(
                      fontSize: width * 0.04,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
