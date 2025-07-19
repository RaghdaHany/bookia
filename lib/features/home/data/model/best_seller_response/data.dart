import 'product.dart';

class Data {
  List<Product>? products;

  Data({this.products});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    products:
        (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    if (products != null) 'products': products?.map((e) => e.toJson()).toList(),
  };
}
