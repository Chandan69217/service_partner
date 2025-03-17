class DistrictList {
  DistrictList({
    required this.id,
    required this.distr,
  });

  final int? id;
  final List<String> distr;

  factory DistrictList.fromJson(Map<String, dynamic> json){
    return DistrictList(
      id: json["id"],
      distr: json["distr"] == null ? [] : List<String>.from(json["distr"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "distr": distr.map((x) => x).toList(),
  };

  @override
  String toString(){
    return "$distr";
  }
}
