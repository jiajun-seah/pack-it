import 'package:flutter/material.dart';

import 'recyclable_mapping.dart';

class Piece extends StatelessWidget{
  //type of Recyclable
  Recyclable type;
  Image sprite = Image.asset('assets/images/recyclables/A.png', semanticLabel: 'deafult',);

  Piece({
    super.key,
    required this.type,
  });

  void initializePiece() {
    switch(type) {
          case Recyclable.A:
            sprite = Image.asset('assets/images/recyclables/A.png', semanticLabel: 'A',);
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