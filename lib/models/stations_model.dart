class ChargingStation {
  String providerName;
  String providerWebsite;
  String license;
  String operatorName;
  String usageType;
  bool isOperational;
  String submissionStatus;
  String stationName;
  String address;
  String postalCode;
  double latitude;
  double longitude;
  List<Map<String, dynamic>> connections;
  String imageUrl;
  String thumbnailUrl;
  String uploadedBy;

  ChargingStation({
    required this.providerName,
    required this.providerWebsite,
    required this.license,
    required this.operatorName,
    required this.usageType,
    required this.isOperational,
    required this.submissionStatus,
    required this.stationName,
    required this.address,
    required this.postalCode,
    required this.latitude,
    required this.longitude,
    required this.connections,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.uploadedBy,
  });

  factory ChargingStation.fromJson(Map<String, dynamic> json) {
    return ChargingStation(
      providerName: json['DataProvider']['Title'],
      providerWebsite: json['DataProvider']['WebsiteURL'],
      license: json['DataProvider']['License'],
      operatorName: json['OperatorInfo']['Title'],
      usageType: json['UsageType']['Title'],
      isOperational: json['StatusType']['IsOperational'],
      submissionStatus: json['SubmissionStatus']['Title'],
      stationName: json['AddressInfo']['Title'],
      address:
          "${json['AddressInfo']['AddressLine1']}, ${json['AddressInfo']['AddressLine2']}, ${json['AddressInfo']['StateOrProvince']}, ${json['AddressInfo']['Country']['Title']}",
      postalCode: json['AddressInfo']['Postcode'],
      latitude: json['AddressInfo']['Latitude'],
      longitude: json['AddressInfo']['Longitude'],
      connections: (json['Connections'] as List).map((conn) {
        return {
          "Type": conn['ConnectionType']['Title'],
          "Power (kW)": conn['PowerKW'],
          "Current Type": conn['CurrentType']['Title'],
          "Quantity": conn['Quantity'],
          "Status": conn['StatusType']['Title'],
        };
      }).toList(),
      imageUrl: json['MediaItems'][0]['ItemURL'],
      thumbnailUrl: json['MediaItems'][0]['ItemThumbnailURL'],
      uploadedBy: json['MediaItems'][0]['User']['Username'],
    );
  }
}
