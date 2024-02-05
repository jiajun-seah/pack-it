import 'package:flutter/material.dart';

// import 'foods_mapping.dart';

class Food extends StatelessWidget{
  //type of Recyclable
  final String name;
  final double relativeWidth;
  final double relativeHeight;
  final Image sprite;
  

  const Food({
    super.key,
    required this.name,
    required this.relativeWidth,
    required this.relativeHeight,
    required this.sprite,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
        // decoration: BoxDecoration(color: Colors.black12),
        // margin: EdgeInsets.all(1),
        child: sprite
      );
    // );
  }
}