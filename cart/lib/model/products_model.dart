class ProductsModel {
  final int? id;
  final String? title;
  final double? price;
  final int? quantity;
  final double? total;
  final double? discountPercentage;
  final double? discountedTotal;
  final String? thumbnail;

  ProductsModel({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedTotal,
    this.thumbnail
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      title: json['title'],
      price: (json['price']as num).toDouble(),
      quantity: json['quantity'],
      total: (json['total']as num).toDouble(),
      discountPercentage: (json['discountPercentage']as num).toDouble(),
      discountedTotal: (json['discountedTotal']as num).toDouble(),
      thumbnail: json['thumbnail']
    );
  }
}