import 'package:flutter/material.dart';
import 'package:wallpaper_generator_pexels_app/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {
  //**
  final String categoryName;
  final String categoryImgSrc;

  const CategoryTile({
    Key? key,
    required this.categoryName,
    required this.categoryImgSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
              categoryName: categoryName,
              categoryImageUrl: categoryImgSrc,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                height: 50.0,
                width: 100.0,
                fit: BoxFit.cover,
                categoryImgSrc,
              ),
            ),
            Center(
              child: Container(
                height: 50.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(14.0),
                ),
              ),
            ),
            Positioned(
              left: 10.0,
              top: 12.0,
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'poppins_bold',
                  letterSpacing: 0.6,
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
