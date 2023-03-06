import 'package:flutter/material.dart';
import 'package:wallpaper_generator_pexels_app/constants/colors.dart';
import 'package:wallpaper_generator_pexels_app/screens/search_screen.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key}) : super(key: key);

  //**
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 15.0,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: cardColor,
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: TextField(
                controller: _searchController,
                style: const TextStyle(
                  fontFamily: 'poppins_medium',
                  letterSpacing: 1.2,
                  fontSize: 17.0,
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  hintText: 'Search Wallpaper here..',
                  hintStyle: TextStyle(
                    fontFamily: 'poppins',
                    letterSpacing: 0.8,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            //** search button ->
            IconButton(
              splashRadius: 30.0,
              splashColor: Colors.tealAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(
                      query: _searchController.text,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.search_sharp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
