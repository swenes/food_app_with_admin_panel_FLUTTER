class ProductModel {
  String productName;
  String productImage;
  int productPrice;
  String productId;
  int productQuantity;
  List<dynamic> productUnit;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productUnit,
    this.productQuantity = 0,
    required this.productPrice,
  });
}
