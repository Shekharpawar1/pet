import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pet/controllers/salesman_controller/myOrdersales_controller.dart';
import 'package:pet/controllers/salesman_controller/order_tracker_controller.dart';
import 'package:pet/screens/salesman/widget/orderCancellationDialog.dart';
import 'package:pet/screens/salesman/widget/orderReturnDialog.dart';

import 'package:pet/utils/colors.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import 'package:order_tracker/order_tracker.dart';

class LocationPickerMapSalesMan extends StatefulWidget {
  @override
  _LocationPickerMapSalesManState createState() => _LocationPickerMapSalesManState();
}

class _LocationPickerMapSalesManState extends State<LocationPickerMapSalesMan> {
  List<TextDto> orderList = [
    TextDto("Your order has been placed", "Fri, 25th Mar '22 - 10:47pm"),
    TextDto("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
    TextDto("Your item has been picked up by courier partner.",
        "Tue, 29th Mar '22 - 5:00pm"),
  ];

  List<TextDto> shippedList = [
    TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
    TextDto("Your item has been received in the nearest hub to you.", null),
  ];

  List<TextDto> outOfDeliveryList = [
    TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
  ];

  List<TextDto> deliveredList = [
    TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
  ];

  // LatLng _selectedLocation = LatLng(22.719568, 75.857727); // Default location
  String _userAddress = ''; // To store the fetched address
  String _desiredAddress = ''; // To store the fetched address
    OrderTrackerSalesController ordertrackcontroller = Get.put(OrderTrackerSalesController());

  SalesMyOrderController myordercontroller = Get.put(SalesMyOrderController());
  LatLng _senderLocation = LatLng(22.712622, 75.876584);
  LatLng _selectedLocation = LatLng(22.759982, 75.872925); // receiver
  List<LatLng> _routePoints = []; // List of route points for the Polyline

  @override
  void initState() {
    super.initState();
    // _fetchAddressFromLatLng(_selectedLocation);
    // _fetchRoutePoints();
    // getCurrentLocation();
    // _fetchUserAddressFromLatLng(_senderLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('Location Picker'),
      // ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 15),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_left, color: MyColors.black)),
        ),
        title: Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
          child: Text(
            "Order ID: ${ordertrackcontroller.orderId}",
            style: TextStyle(
              fontSize: 16,
              color: MyColors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        // actions: [
        //   //  SvgPicture.asset("assets/image/girl.svg"),

        //   // SizedBox(width: 20),
        //   InkWell(
        //       onTap: () {
        //         Get.to(NotificationWhole());
        //       },
        //       child: SvgPicture.asset("assets/image/notification.svg")),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          primary: true,
          shrinkWrap: false,
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     color: Colors.white,
            //   ),
            //   child: TextField(
            //     onChanged: (value) {
            //       // Handle user input changes in the TextField
            //       searchLocation(value);
            //     },
            //     decoration: InputDecoration(
            //       border: InputBorder.none, // Remove underline
            //       hintText: 'Search for a location...',
            //       contentPadding:
            //           EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.4,
            //   child: FlutterMap(
            //     options: MapOptions(
            //       center: _senderLocation,
            //       zoom: 13.2,
            //       maxZoom: 18.2,
            //       onTap: _handleMapTap,
            //     ),
            //     children: [
            //       TileLayer(
            //         urlTemplate:
            //             'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            //         subdomains: [
            //           'a',
            //           'b',
            //           'c'
            //         ], // Subdomains if your tile provider uses them
            //         // tileProvider:
            //         //     CachedNetworkTileProvider(), // Optional: Use CachedNetworkTileProvider for caching
            //       ),
            //       PolylineLayer(
            //         polylines: [
            //           Polyline(
            //             points: _routePoints, // List of route points
            //             color: Colors.blue, // Polyline color
            //             strokeWidth: 3.0, // Polyline width
            //           ),
            //         ],
            //       ),
            //       MarkerLayer(
            //         markers: [
            //           Marker(
            //             width: 40.0,
            //             height: 40.0,
            //             point: _senderLocation,
            //             builder: (ctx) => Container(
            //               child: Icon(
            //                 Icons.location_on,
            //                 color: Colors.red,
            //               ),
            //             ),
            //           ),
            //           // Marker(
            //           //   width: 40.0,
            //           //   height: 40.0,
            //           //   point: _selectedLocation,
            //           //   builder: (ctx) => Container(
            //           //     child: Icon(
            //           //       Icons.location_on,
            //           //       color: Colors.green,
            //           //     ),
            //           //   ),
            //           // ),
            //           Marker(
            //             width: 40.0,
            //             height: 40.0,
            //             point: _selectedLocation,
            //             builder: (ctx) {
            //               return TweenAnimationBuilder<double>(
            //                 tween: Tween<double>(begin: 0.0, end: 1.0),
            //                 duration: Duration(milliseconds: 800),
            //                 builder: (context, value, child) {
            //                   return Transform.scale(
            //                     scale: value,
            //                     child: Icon(
            //                       Icons.location_on,
            //                       color: Colors.green,
            //                     ),
            //                   );
            //                 },
            //               );
            //             },
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  // bottomLeft: Radius.circular(30),
                  // bottomRight: Radius.circular(30),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  children: [
                    Container(
                      // height: 200,
                      width: MediaQuery.of(context).size.width,
                      // height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                          bottom: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/image/order_id_logo.png",
                              height: 45,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pkart Logistics",
                                    style: TextStyle(
                                        fontSize: 17.533462524414062,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                  RatingStars(
                                    value: 3.5,
                                    // onValueChanged: (v) {
                                    //   //
                                    //   setState(() {
                                    //     value = v;
                                    //   });
                                    // },
                                    starBuilder: (index, color) => Icon(
                                      Icons.star,
                                      color: color,
                                      size: 15,
                                    ),
                                    starCount: 5,
                                    starSize: 20,
                                    // valueLabelColor: const Color(0xff9b9b9b),
                                    // valueLabelTextStyle: const TextStyle(
                                    //     color: Colors.white,
                                    //     fontWeight: FontWeight.w400,
                                    //     fontStyle: FontStyle.normal,
                                    //     fontSize: 12.0),

                                    // valueLabelRadius: 10,
                                    maxValue: 5,
                                    starSpacing: 0.5,
                                    maxValueVisibility: true,
                                    valueLabelVisibility: false,
                                    animationDuration:
                                        Duration(milliseconds: 1000),
                                    // valueLabelPadding:
                                    //     const EdgeInsets.symmetric(
                                    //         vertical: 1, horizontal: 8),
                                    // valueLabelMargin:
                                    //     const EdgeInsets.only(right: 8),
                                    starOffColor: const Color(0xffe7e8ea),
                                    starColor: MyColors.yellow,
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(width: 10,),

                            Image.asset(
                              "assets/image/Chat.png",
                              height: 45,
                            ),
                            SizedBox(width: 10),
                            Image.asset(
                              "assets/image/Call_icon.png",
                              height: 45,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                          // bottomLeft: Radius.circular(30),
                          // bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: 
                                GetBuilder<OrderTrackerSalesController>(
                                    init: ordertrackcontroller,
                                    builder: (controller) {
                            return ListView(
                              shrinkWrap: true,
                              primary: false,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                OrderTracker(
                                  // status: Status.delivered,
                                  status: ordertrackcontroller.orderStatus,
                                  activeColor: MyColors.yellow,
                                  inActiveColor: Color.fromRGBO(224, 224, 224, 1),
                                  orderTitleAndDateList:orderList,
                                  shippedTitleAndDateList:shippedList,
                                  outOfDeliveryTitleAndDateList: outOfDeliveryList,
                                  deliveredTitleAndDateList: deliveredList,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20.0,
                                    bottom: 20.0,
                                    right: 20,
                                    left: 20,
                                  ),
                                  child: Container(
                                    height: 1,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset("assets/image/Star.png"),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Clark Technnologies",
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          "INR 28,000",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 20),
                                GetBuilder<OrderTrackerSalesController>(
                                    init: ordertrackcontroller,
                                    builder: (controller) {
                                      return 
                                      controller.isDelivered ?Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 100),
                                        child: InkWell(
                                          onTap: () {
                                            // print(Status);
                                                 if (myordercontroller.isButtonEnabled){
                            myordercontroller.disablebutton(true);
                            print("returnorder");
  Get.dialog(OrderReturnDialogsales());
                          }
                          else{
                            myordercontroller.disablebutton(false);
  print("Button is not enabled");
                          }
                                            
                                          },
                                          child: Container(
                                            // width: MediaQuery.of(context).size.width * 0.3,
                                            height:
                                                MediaQuery.of(context).size.width *
                                                    0.11,
                                            decoration: BoxDecoration(
                                              color:
                      
                                             myordercontroller.isButtonEnabled ? Colors.red : Colors.grey,
                                      
                                              borderRadius: BorderRadius.all(
                                                // topRight:
                                                Radius.circular(30),
                                                // topLeft: Radius.circular(30),
                                                // bottomLeft: Radius.circular(30),
                                                // bottomRight: Radius.circular(30),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("Return Order",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ) :
                                 
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 100),
                                        child: InkWell(
                                          onTap: () {
                                             if (myordercontroller.isButtonEnabled){
                            myordercontroller.disablebutton(true);
  Get.dialog(OrderCancellationDialogwholesales());
                          }
                          else{
                            myordercontroller.disablebutton(false);
  print("Button is not enabled");
                          }
                                           
                                          },
                                          child: Container(
                                            // width: MediaQuery.of(context).size.width * 0.3,
                                            height:
                                                MediaQuery.of(context).size.width *
                                                    0.11,
                                            decoration: BoxDecoration(
                                              color: myordercontroller.isButtonEnabled ? Colors.red : Colors.grey,
                                      
                                            
                                              borderRadius: BorderRadius.all(
                                                // topRight:
                                                Radius.circular(30),
                                                // topLeft: Radius.circular(30),
                                                // bottomLeft: Radius.circular(30),
                                                // bottomRight: Radius.circular(30),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text("Cancel Order",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  )),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ],
                            );
                          }
                        ),
                      ),
                    ),
                  ],
                ),
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
