import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_generator_pexels_app/models/photos_model.dart';

class ApiServices {
  //** list of trending wallpaper ->
  static List<PhotosModel> trendingWallpaper = [];
  static List<PhotosModel> searchWallpaperList = [];
  static List<PhotosModel> categoryWallpaperList = [];

  //?? get trending wallpaper ->
  static Future<List<PhotosModel>> getTrendingWallpaper() async {
    await http.get(
      Uri.parse(
        "https://api.pexels.com/v1/curated",
      ),
      headers: {
        "Authorization":
            "D3m8ZZPF9pcLWIlJo9dCojQZp4nHNWhpImrIRS1KtFLyG1BvGnUTDHWI",
      },
    ).then(
      (value) {
        Map<String, dynamic> jsonData = jsonDecode(value.body);
        List photos = jsonData['photos'];
        photos.forEach(
          (element) {
            trendingWallpaper.add(
              PhotosModel.fromAPI2App(element),
            );
          },
        );
      },
    );
    return trendingWallpaper;
  }

  //?? search wallpapers ->
  static Future<List<PhotosModel>> searchWallpapers(String query) async {
    await http.get(
      Uri.parse(
        "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1",
      ),
      headers: {
        "Authorization":
            "D3m8ZZPF9pcLWIlJo9dCojQZp4nHNWhpImrIRS1KtFLyG1BvGnUTDHWI",
      },
    ).then(
      (value) {
        Map<String, dynamic> jsonData = jsonDecode(value.body);
        List photos = jsonData['photos'];
        searchWallpaperList.clear();
        photos.forEach(
          (element) {
            searchWallpaperList.add(
              PhotosModel.fromAPI2App(element),
            );
          },
        );
      },
    );
    return searchWallpaperList;
  }
}
