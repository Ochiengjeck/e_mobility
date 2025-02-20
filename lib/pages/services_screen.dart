import 'package:ev_app/assets/servicse.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChargingStationScreen extends StatefulWidget {
  @override
  _ChargingStationScreenState createState() => _ChargingStationScreenState();
}

class _ChargingStationScreenState extends State<ChargingStationScreen> {
  List<dynamic>? stationData;
  final StationsApi _stationsApi = StationsApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Charging Station Details')),
      body: FutureBuilder(
        future: _stationsApi.fetchChargingStation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData ||
              snapshot.data == null ||
              (snapshot.data as List).isEmpty) {
            return const Center(child: Text('No charging stations available.'));
          } else {
            stationData =
                snapshot.data as List<dynamic>; // Casting to List<dynamic>
            return Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        stationData![0]['latitude'] ??
                            0.0, // Fallback to 0.0 if latitude is null
                        stationData![0]['longitude'] ??
                            0.0, // Fallback to 0.0 if longitude is null
                      ),
                      zoom: 15,
                    ),
                    markers: Set.from(stationData!.map((station) {
                      return Marker(
                        markerId: MarkerId(
                            station['stationName'] ?? 'unknown_station'),
                        position: LatLng(
                          station['latitude'] ??
                              0.0, // Fallback to 0.0 if latitude is null
                          station['longitude'] ??
                              0.0, // Fallback to 0.0 if longitude is null
                        ),
                      );
                    })),
                  ),
                ),
                // Optional: If you want to display the list of stations below the map
                Expanded(
                  child: ListView.builder(
                    itemCount: stationData!.length,
                    itemBuilder: (context, index) {
                      var station = stationData![index];
                      return ListTile(
                        title:
                            Text(station['stationName'] ?? 'Unknown Station'),
                        subtitle: Text(
                          'Location: ${station['latitude'] ?? 'N/A'}, ${station['longitude'] ?? 'N/A'}',
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
