import 'package:flutter/material.dart';

class TopBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          'assets/Bee_Sliver_Image.png',
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 5,
          left: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Witaj!",
                  style: TextStyle(color: Colors.white,  fontFamily: 'Montserrat', fontSize: 23),
                ),
                Text(
                  "Paweł!",
                  style: TextStyle(color: Colors.white,  fontFamily: 'Montserrat', fontSize: 36),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
