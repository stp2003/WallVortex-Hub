class PhotosModel {
  String imgSrc;
  String photographerName;

  PhotosModel({
    required this.imgSrc,
    required this.photographerName,
  });

  static PhotosModel fromAPI2App(Map<String, dynamic> photoMap) {
    return PhotosModel(
        photographerName: photoMap["photographer"],
        imgSrc: (photoMap["src"])["portrait"]);
  }
}
