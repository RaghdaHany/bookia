import 'package:bookia/features/home/data/model/best_seller_response/product.dart';

import 'link.dart';

class Data {
  num? currentPage;
  List<Product>? data;
  String? firstPageUrl;
  num? from;
  num? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  num? perPage;
  dynamic prevPageUrl;
  num? to;
  num? total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: num.tryParse(json['current_page'].toString()),
    data:
        (json['data'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
    firstPageUrl: json['first_page_url']?.toString(),
    from: num.tryParse(json['from'].toString()),
    lastPage: num.tryParse(json['last_page'].toString()),
    lastPageUrl: json['last_page_url']?.toString(),
    links:
        (json['links'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(Map<String, dynamic>.from(e)))
            .toList(),
    nextPageUrl: json['next_page_url'],
    path: json['path']?.toString(),
    perPage: num.tryParse(json['per_page'].toString()),
    prevPageUrl: json['prev_page_url'],
    to: num.tryParse(json['to'].toString()),
    total: num.tryParse(json['total'].toString()),
  );

  Map<String, dynamic> toJson() => {
    if (currentPage != null) 'current_page': currentPage,
    if (data != null) 'data': data?.map((e) => e.toJson()).toList(),
    if (firstPageUrl != null) 'first_page_url': firstPageUrl,
    if (from != null) 'from': from,
    if (lastPage != null) 'last_page': lastPage,
    if (lastPageUrl != null) 'last_page_url': lastPageUrl,
    if (links != null) 'links': links?.map((e) => e.toJson()).toList(),
    if (nextPageUrl != null) 'next_page_url': nextPageUrl,
    if (path != null) 'path': path,
    if (perPage != null) 'per_page': perPage,
    if (prevPageUrl != null) 'prev_page_url': prevPageUrl,
    if (to != null) 'to': to,
    if (total != null) 'total': total,
  };
}
