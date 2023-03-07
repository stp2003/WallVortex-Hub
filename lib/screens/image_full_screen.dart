import 'package:flutter/material.dart';

class ImageFullScreen extends StatelessWidget {
  //**
  final String imgUrl;

  const ImageFullScreen({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  //?? build ->
  @override
  Widget build(BuildContext context) {
    //** media query ->
    final size = MediaQuery.of(context).size;

    return Scaffold(
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
