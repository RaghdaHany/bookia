class SliderModel {
  String? image;

  SliderModel({this.image});

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      SliderModel(image: json['image']?.toString());

  Map<String, dynamic> toJson() => {if (image != null) 'image': image};
}
