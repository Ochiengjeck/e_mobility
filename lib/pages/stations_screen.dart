import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StationsScreen extends StatefulWidget {
  const StationsScreen({super.key});

  @override
  _StationsScreenState createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-1.329425, 36.715820);

  final List<Map<String, dynamic>> stations = [
    {
      "name": "Waterfront Mall EvChaja",
      "location": "Karen Road, Nairobi",
      "contact": "N/A",
      "power": "22kW",
      "charges": "Varies",
      "time": "24/7",
      "description": "Public charging station",
      "lat": -1.329425,
      "lng": 36.715820,
      "image": "assets/images/charging4.png",
    },
  ];

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _showStationDetails(Map<String, dynamic> station) {
    showModalBottomSheet(
      backgroundColor: Colors.black87,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          child: Column(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                child: SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(station["image"], fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        station["name"],
                        style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            const Icon(Icons.location_pin, color: Colors.white),
                            Text(station["location"],
                                style: const TextStyle(color: Colors.white))
                          ]),
                          Row(children: [
                            const Icon(Icons.phone, color: Colors.white),
                            Text(station["contact"],
                                style: const TextStyle(color: Colors.white))
                          ]),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            const Icon(Icons.bolt, color: Colors.white),
                            Text(station["power"],
                                style: const TextStyle(color: Colors.white))
                          ]),
                          Row(children: [
                            const Icon(Icons.attach_money, color: Colors.white),
                            Text(station["charges"],
                                style: const TextStyle(color: Colors.white))
                          ]),
                          Row(children: [
                            const Icon(Icons.access_time, color: Colors.white),
                            Text(station["time"],
                                style: const TextStyle(color: Colors.white))
                          ]),
                        ],
                      ),
                      const Divider(),
                      Text(station["description"],
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white)),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Directions"),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Book Spot"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 14.0),
        markers: stations.map((station) {
          return Marker(
            markerId: MarkerId(station["name"]),
            position: LatLng(station["lat"], station["lng"]),
            infoWindow: InfoWindow(
              title: station["name"],
              snippet: station["location"],
              onTap: () => _showStationDetails(station),
            ),
          );
        }).toSet(),
      ),
    );
  }
}
