import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

//  <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
// <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
// <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />

class LocationPickerMapSalesMan extends StatefulWidget {
  @override
  _LocationPickerMapSalesManState createState() =>
      _LocationPickerMapSalesManState();
}

class _LocationPickerMapSalesManState extends State<LocationPickerMapSalesMan> {
  // LatLng _selectedLocation = LatLng(22.719568, 75.857727); // Default location
  String _userAddress = ''; // To store the fetched address
  String _desiredAddress = ''; // To store the fetched address

  LatLng _senderLocation = LatLng(22.712622, 75.876584);
  LatLng _selectedLocation = LatLng(22.759982, 75.872925); // receiver
  List<LatLng> _routePoints = []; // List of route points for the Polyline

  @override
  void initState() {
    super.initState();
    _fetchAddressFromLatLng(_selectedLocation);
    _fetchRoutePoints();
    getCurrentLocation();
    _fetchUserAddressFromLatLng(_senderLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('Location Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text("Your Current Address: $_userAddress"),
            SizedBox(
              height: 10,
            ),
            Text("Desired Address: $_desiredAddress"),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: TextField(
                onChanged: (value) {
                  // Handle user input changes in the TextField
                  searchLocation(value);
                },
                decoration: InputDecoration(
                  border: InputBorder.none, // Remove underline
                  hintText: 'Search for a location...',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: FlutterMap(
                options: MapOptions(
                  center: _senderLocation,
                  zoom: 13.2,
                  maxZoom: 18.2,
                  onTap: _handleMapTap,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: [
                      'a',
                      'b',
                      'c'
                    ], // Subdomains if your tile provider uses them
                    // tileProvider:
                    //     CachedNetworkTileProvider(), // Optional: Use CachedNetworkTileProvider for caching
                  ),
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: _routePoints, // List of route points
                        color: Colors.blue, // Polyline color
                        strokeWidth: 3.0, // Polyline width
                      ),
                    ],
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 40.0,
                        height: 40.0,
                        point: _senderLocation,
                        builder: (ctx) => Container(
                          child: Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      // Marker(
                      //   width: 40.0,
                      //   height: 40.0,
                      //   point: _selectedLocation,
                      //   builder: (ctx) => Container(
                      //     child: Icon(
                      //       Icons.location_on,
                      //       color: Colors.green,
                      //     ),
                      //   ),
                      // ),
                      Marker(
                        width: 40.0,
                        height: 40.0,
                        point: _selectedLocation,
                        builder: (ctx) {
                          return TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.0, end: 1.0),
                            duration: Duration(milliseconds: 800),
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.green,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void searchLocation(String query) async {
    try {
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        double latitude = location.latitude;
        double longitude = location.longitude;
        _selectedLocation =
            LatLng(latitude, longitude); // Update the map's center
        _fetchRoutePoints();
        setState(() {});
        print("===>>> $latitude  $longitude");
      }
    } catch (e) {
      print('Error searching for location: $e');
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // Location permissions are not granted, so request them.
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // Permissions are still not granted, handle this case as needed.
        print('Location permissions are not granted.');
        final snackBar = SnackBar(
          content: Text('Location permissions are not granted.'),
          duration: Duration(seconds: 3), // Adjust the display duration
        );

        // Show the Snackbar using the Scaffold
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }

      // Location permissions are granted, get the current position.
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double latitude = position.latitude;
      double longitude = position.longitude;
      _senderLocation = LatLng(latitude, longitude); // receiver
      setState(() {});
      _fetchRoutePoints();
      _fetchAddressFromLatLng(_senderLocation);
      setState(() {});
      print('Current Location: Latitude: $latitude, Longitude: $longitude');
      // You can now use the latitude and longitude as needed.
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  void _fetchRoutePoints() {
    final controlPoint1 = LatLng(
      (_selectedLocation.latitude + _senderLocation.latitude) / 2,
      _selectedLocation.longitude,
    );
    final controlPoint2 = LatLng(
      (_selectedLocation.latitude + _senderLocation.latitude) / 2,
      _senderLocation.longitude,
    );
    _routePoints = [
      _selectedLocation,

      controlPoint1,
      controlPoint2,
      // LatLng(22.715433, 75.865296),
      _senderLocation,
      // LatLng(22.712622, 75.876584),
    ];

    setState(() {});
  }

  Future<void> _handleMapTap(
      TapPosition tapPosition, LatLng tappedPoint) async {
    await _fetchAddressFromLatLng(tappedPoint);
    setState(() {
      _selectedLocation = tappedPoint;
    });
    print(_selectedLocation);
    final snackBar = SnackBar(
      content: Text('$_desiredAddress'),
      duration: Duration(seconds: 3), // Adjust the display duration
    );

    // Show the Snackbar using the Scaffold
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    _fetchRoutePoints();
  }

  Future<void> _fetchUserAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        setState(() {
          _userAddress =
              '${placemark.name}, ${placemark.locality}, ${placemark.country}';
        });
      } else {
        setState(() {
          _userAddress = 'Address not found';
        });
      }
    } catch (e) {
      print('Error fetching address: $e');
      setState(() {
        _userAddress = 'Error fetching address';
      });
    }
  }

  Future<void> _fetchAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        setState(() {
          _desiredAddress =
              '${placemark.name}, ${placemark.locality}, ${placemark.country}';
        });
      } else {
        setState(() {
          _desiredAddress = 'Address not found';
        });
      }
    } catch (e) {
      print('Error fetching address: $e');
      setState(() {
        _desiredAddress = 'Error fetching address';
      });
    }
  }
}
