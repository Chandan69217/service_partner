class StateList {
  StateList({
    required this.id,
    required this.stat,
  });

  final int id;
  final String stat;

  factory StateList.fromJson(Map<String, dynamic> json){
    return StateList(
      id: json["id"],
      stat: json["stat"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "stat": stat,
  };

  @override
  String toString(){
    return "$stat";
  }

  @override
  bool filter(String query) {
    return stat.toLowerCase().contains(query.toLowerCase());
  }
}




