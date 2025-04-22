class ProductCategoryData {
  ProductCategoryData({
    required this.id,
    required this.catName,
  });

  final int? id;
  final String? catName;

  factory ProductCategoryData.fromJson(Map<String, dynamic> json){
    return ProductCategoryData(
      id: json["id"],
      catName: json["cat_name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "cat_name": catName,
  };

  @override
  String toString(){
    return "$catName";
  }
}
