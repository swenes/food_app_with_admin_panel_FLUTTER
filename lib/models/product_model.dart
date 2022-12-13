class ProductModel {
  String productName;
  String productImage;
  int productPrice;
  String productId;
  int productQuantity;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.productImage,
    this.productQuantity = 0,
    required this.productPrice,
  });
}
