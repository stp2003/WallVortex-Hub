import 'package:flutter/material.dart';
import 'package:wallpaper_generator_pexels_app/widgets/app_name.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

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
                      'https://images.pexels.com/photos/1287145/pexels-photo-1287145.jpeg?auto=compress&cs=tinysrgb&w=600',
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
                      children: const [
                        Text(
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
                          'widget.catName',
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
                itemCount: 10,
                itemBuilder: (context, index) => GridTile(
                  child: Container(
                    width: 50.0,
                    height: 800.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.amberAccent,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(
                        width: 50.0,
                        height: 800.0,
                        fit: BoxFit.cover,
                        'https://images.pexels.com/photos/1719648/pexels-photo-1719648.jpeg?auto=compress&cs=tinysrgb&w=600',
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
