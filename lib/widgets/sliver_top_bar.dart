import 'package:flutter/material.dart';
import 'package:hive/const.dart';

class TopBar extends SliverPersistentHeaderDelegate {
  TopBar({this.name});
  final String name;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColorDark,
              ])),
        ),
        Positioned(
          bottom: 5,
          left: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      text: 'Witaj ',
                      style: kTextStyleOne.copyWith(fontSize: 25),
                      children: <TextSpan>[
                        TextSpan(
                            text: '$name!',
                            style: kTextStyleOne.copyWith(fontSize: 30)),
                      ]),
                ),
                Text(
                  'Sprawdź jak sprawują się twoje ule:',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
              size: 30,
              
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
