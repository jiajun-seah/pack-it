import 'package:flutter/material.dart';

// import 'foods_mapping.dart';

class Food extends StatelessWidget{
  //type of Recyclable
  final String name;
  final double width;
  final double height;
  final Image sprite;
  

  const Food({
    super.key,
    required this.name,
    required this.width,
    required this.height,
    required this.sprite,
  });
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width,
      width: height,
      child: FittedBox(
        fit: BoxFit.fill,
        child: sprite),
    );
  }
}