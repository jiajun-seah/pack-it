import 'package:flutter/material.dart';

import 'foods_mapping.dart';

class Piece extends StatelessWidget{
  //type of Recyclable
  Food type;
  Image sprite = Image.asset('assets/images/foods/A.png', semanticLabel: 'default',);

  Piece({
    super.key,
    required this.type,
  });

  void initializePiece() {
    switch(type) {
          case Food.Red:
            sprite = Image.asset('assets/images/foods/Red.png', semanticLabel: 'Red',);
            break;
            default:
    }

  }
  
  @override
  Widget build(BuildContext context) {
    initializePiece();
    return Container(
      child: Center(
        child: sprite
      )
    );
  }

  
}