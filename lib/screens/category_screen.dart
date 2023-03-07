import 'package:flutter/material.dart';
import 'package:wallpaper_generator_pexels_app/constants/colors.dart';
import 'package:wallpaper_generator_pexels_app/controllers/services/api_services.dart';
import 'package:wallpaper_generator_pexels_app/models/photos_model.dart';
import 'package:wallpaper_generator_pexels_app/widgets/app_name.dart';

import 'image_full_screen.dart';

class CategoryScreen extends StatefulWidget {
  //**
  final String categoryName;
  final String categoryImageUrl;

  const CategoryScreen({
    Key? key,
    required this.categoryName,
    required this.categoryImageUrl,
  }) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  //**
  late List<PhotosModel> categoryResults = [];

  //** for loading ->
  bool isLoading = true;

  //?? for getting category ->
  getCategories() async {
    categoryResults = await ApiServices.searchWallpapers(
      widget.categoryName,
    );

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  //?? build ->
  @override
  Widget build(BuildContext context) {
    //** media query ->
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: appName(),
        elevation: 0.0,
      ),

      //?? body ->
      body: SingleChildScrollView(
        child: Column(
          children: [
            //?? for showing the selected category's name and image ->
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      height: 150.0,
                      width: size.width,
                      fit: BoxFit.cover,
                      widget.categoryImageUrl,
                    ),
                  ),
                  Container(
                    height: 150.0,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black12,
                    ),
                  ),
                  Positioned(
                    left: 65.0,
                    top: 30.0,
                    child: Column(
                      children: [
                        const Text(
                          "Category",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            letterSpacing: 1.2,
                            fontFamily: 'poppins_medium',
                          ),
                        ),
                        Text(
                          widget.categoryName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            letterSpacing: 1.2,
                            fontFamily: 'poppins_bold',
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30.0),

            //?? grid view for showing wallpaper ->
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 13.0),
              height: size.height,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 420.0,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: categoryResults.length,
                itemBuilder: (context, index) => GridTile(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageFullScreen(
                            imgUrl: categoryResults[index].imgSrc,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: categoryResults[index].imgSrc,
                      child: Container(
                        width: 50.0,
                        height: 800.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: bgColor,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            width: 50.0,
                            height: 800.0,
                            fit: BoxFit.cover,
                            categoryResults[index].imgSrc,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
