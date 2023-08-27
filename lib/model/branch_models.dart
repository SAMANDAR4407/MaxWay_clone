
class Branch {
  final String id;
  final String name;
  final String image;
  final String phone;
  final bool isActive;
  final String address;
  final Location location;
  final String destination;
  final String workHourStart;
  final String workHourEnd;

  Branch({
    required this.id,
    required this.name,
    required this.image,
    required this.phone,
    required this.isActive,
    required this.address,
    required this.location,
    required this.destination,
    required this.workHourStart,
    required this.workHourEnd,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"] ?? '',
    name: json["name"] ?? '',
    image: json["image"] ?? '',
    phone: json["phone"] ?? '',
    isActive: json["is_active"] ?? false,
    address: json["address"] ?? '',
    location: Location.fromJson(json["location"] ?? {}),
    destination: json["destination"] ?? '',
    workHourStart: json["work_hour_start"] ?? '',
    workHourEnd: json["work_hour_end"] ?? '',
  );

}

class Location {
  final double long;
  final double lat;

  Location({
    required this.long,
    required this.lat,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    long: (json["long"] ?? 0).toDouble(),
    lat: (json["lat"] ?? 0).toDouble(),
  );

}

