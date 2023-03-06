import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                'https://images.pexels.com/photos/1719648/pexels-photo-1719648.jpeg?auto=compress&cs=tinysrgb&w=600',
              ),
            ),
            Container(
              height: 50.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            const Positioned(
              left: 25.0,
              top: 10.0,
              child: Text(
                'Cars',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'poppins_bold',
                  letterSpacing: 1.2,
                  fontSize: 17.0,
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
