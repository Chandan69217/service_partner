class ProdDetailsList {
  ProdDetailsList({
    required this.data,
    this.categoryName,
  });

  final List<ProductDetails> data;
  final String? categoryName;

  factory ProdDetailsList.fromJson(Map<String, dynamic> json,
      {String? categoryName}){
    return ProdDetailsList(
      categoryName: categoryName,
      data: json["data"] == null ? [] : List<ProductDetails>.from(json["data"]!.map((x) => ProductDetails.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class ProductDetails {
  ProductDetails({
    required this.id,
    required this.prdId,
    required this.prdName,
    required this.prodPic,
    required this.uprice,
    required this.unitType,
    required this.quantityPerUnit,
  });

  final int id;
  final String prdId;
  final String prdName;
  final String prodPic;
  final String uprice;
  final String unitType;
  final String quantityPerUnit;

  factory ProductDetails.fromJson(Map<String, dynamic> json){
    return ProductDetails(
      id: json["id"] ?? 0,
      prdId: json["prd_id"] ?? "",
      prdName: json["prd_name"] ?? "",
      prodPic: json["prod_pic"] ?? "",
      uprice: json["uprice"] ?? "",
      unitType: json["unit_type"] ?? "",
      quantityPerUnit: json["quantity_per_unit"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "prd_id": prdId,
    "prd_name": prdName,
    "prod_pic": prodPic,
    "uprice": uprice,
    "unit_type": unitType,
    "quantity_per_unit": quantityPerUnit,
  };

}
