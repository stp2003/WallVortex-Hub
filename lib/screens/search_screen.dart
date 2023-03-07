import 'package:flutter/material.dart';
import 'package:wallpaper_generator_pexels_app/constants/colors.dart';
import 'package:wallpaper_generator_pexels_app/controllers/services/api_services.dart';
import 'package:wallpaper_generator_pexels_app/models/photos_model.dart';
import 'package:wallpaper_generator_pexels_app/widgets/app_name.dart';
import 'package:wallpaper_generator_pexels_app/widgets/search_bar.dart';

import 'image_full_screen.dart';

class SearchScreen extends StatefulWidget {
  //**
  final String query;

  const SearchScreen({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //**
  late List<PhotosModel> searchResults = [];

  //?? get search Results ->
  getSearchResults() async {
    searchResults = await ApiServices.searchWallpapers(widget.query);
    setState(() {});
  }

  //?? init state ->
  @override
  void initState() {
    super.initState();
    getSearchResults();
  }

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
            //** search bar ->
            SearchBar(),

            //?? grid view for showing wallpaper ->
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 13.0),
                height: 690,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 420.0,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) => GridTile(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageFullScreen(
                              imgUrl: searchResults[index].imgSrc,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: searchResults[index].imgSrc,
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
                              searchResults[index].imgSrc,
                            ),
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
