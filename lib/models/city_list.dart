class CityList {
  CityList({
    required this.id,
    required this.city,
  });

  final int? id;
  final List<String> city;

  factory CityList.fromJson(Map<String, dynamic> json){
    return CityList(
      id: json["id"],
      city: json["city"] == null ? [] : List<String>.from(json["city"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "city": city.map((x) => x).toList(),
  };

  @override
  String toString(){
    return "$id, $city, ";
  }
}
