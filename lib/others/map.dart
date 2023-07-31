import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';


class flutterMap extends StatefulWidget {
  const flutterMap({super.key});

  @override
  State<flutterMap> createState() => _flutterMapState();
}

class _flutterMapState extends State<flutterMap> {
 final MapController _mapController = new MapController();
@override
Widget build(BuildContext context) {
  return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: LatLng(51.509364, -0.128928),
              zoom: 3.2,
            ),
            children: [
              TileLayer(
                  urlTemplate: '',
                  userAgentPackageName: 'com.example.app',
              ),
            ],
          ),
        ],
      ),
    );

}}