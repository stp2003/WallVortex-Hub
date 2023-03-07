import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:open_file/open_file.dart';

class ImageFullScreen extends StatelessWidget {
  //**
  final String imgUrl;

  ImageFullScreen({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  //** global key ->
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //?? save wallpaper ->
  Future<void> setWallpaperFromFile(
    String wallpaperUrl,
    BuildContext context,
  ) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Downloading Started...",
          style: TextStyle(
            fontFamily: 'poppins_medium',
            letterSpacing: 0.8,
          ),
        ),
      ),
    );
    try {
      //** Saved with this method ->
      var imageId = await ImageDownloader.downloadImage(
        wallpaperUrl,
      );
      if (imageId == null) {
        return;
      }

      //** Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            "Downloaded Successfully",
            style: TextStyle(
              fontFamily: 'poppins_medium',
              letterSpacing: 0.8,
            ),
          ),
          action: SnackBarAction(
            label: "Open",
            onPressed: () {
              OpenFile.open(path);
            },
          ),
        ),
      );
      if (kDebugMode) {
        print("IMAGE DOWNLOADED");
      }
    } on PlatformException catch (error) {
      if (kDebugMode) {
        print(error);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Error Occurred - $error",
          ),
        ),
      );
    }
  }

  //?? build ->
  @override
  Widget build(BuildContext context) {
    //** media query ->
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,

      //?? for saving wallpaper ->
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
        ),
        onPressed: () async {
          await setWallpaperFromFile(
            imgUrl,
            context,
          );
        },
        child: const Text(
          "Save Wallpaper",
          style: TextStyle(
            fontFamily: 'poppins_medium',
            letterSpacing: 0.8,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //?? body ->
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              imgUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
