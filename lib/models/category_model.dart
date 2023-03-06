class CategoryModel {
  String categoryName;
  String categoryImageUrl;

  CategoryModel({
    required this.categoryName,
    required this.categoryImageUrl,
  });

  static CategoryModel fromApi2App(Map<String, dynamic> category) {
    return CategoryModel(
      categoryImageUrl: category["imgUrl"],
      categoryName: category["CategoryName"],
    );
  }
}
