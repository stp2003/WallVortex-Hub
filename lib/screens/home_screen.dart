import 'package:flutter/material.dart';
import 'package:wallpaper_generator_pexels_app/constants/colors.dart';
import 'package:wallpaper_generator_pexels_app/controllers/services/api_services.dart';
import 'package:wallpaper_generator_pexels_app/models/category_model.dart';
import 'package:wallpaper_generator_pexels_app/models/photos_model.dart';
import 'package:wallpaper_generator_pexels_app/screens/image_full_screen.dart';
import 'package:wallpaper_generator_pexels_app/widgets/app_name.dart';
import 'package:wallpaper_generator_pexels_app/widgets/category_tile.dart';
import 'package:wallpaper_generator_pexels_app/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //**
  late List<PhotosModel> trendingWallList = [];
  late List<CategoryModel> categoryModelList = [];

  bool isLoading = true;

  //?? category ->
  getCategoryDetails() async {
    categoryModelList = await ApiServices.getCategoriesList();
    print("GETTTING CAT MOD LIST");
    print(categoryModelList);
    setState(() {
      categoryModelList = categoryModelList;
    });
  }

  //?? get trending wallpapers ->
  getTrendingWallpapers() async {
    trendingWallList = await ApiServices.getTrendingWallpaper();
    setState(() {
      // isLoading = false;
    });
  }

  //?? init state ->
  @override
  void initState() {
    super.initState();
    getTrendingWallpapers();
    getCategoryDetails();
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
            //** search bar ->
            SearchBar(),

            //** list view builder for category ->
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 20.0,
              ),
              child: SizedBox(
                height: 60.0,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryModelList.length,
                  itemBuilder: (context, index) => CategoryTile(
                    categoryName: categoryModelList[index].categoryName,
                    categoryImgSrc: categoryModelList[index].categoryImageUrl,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20.0),

            //?? grid view for showing wallpaper ->
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 13.0),
              height: 590.0,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 400.0,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: trendingWallList.length,
                itemBuilder: (context, index) => GridTile(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageFullScreen(
                            imgUrl: trendingWallList[index].imgSrc,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: trendingWallList[index].imgSrc,
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
                            trendingWallList[index].imgSrc,
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
