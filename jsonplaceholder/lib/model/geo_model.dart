class GeoModel {
  final String? lat;
  final String? lng;

  GeoModel({
    this.lat,
    this.lng
  });

  factory GeoModel.fromJson(Map<String,dynamic> json) {
    return GeoModel(
      lat: json['lat'],
      lng: json['lng']
    );
  }
}